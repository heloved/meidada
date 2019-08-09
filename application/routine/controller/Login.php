<?php

namespace app\routine\controller;

use app\admin\model\system\SystemConfig;
use app\routine\model\routine\RoutineServer;
use app\routine\model\user\RoutineUser;
use service\JsonService;
use service\UtilService;
use service\MiniProgramService;
use think\Controller;
use think\Db;
use think\Request;

class Login extends Controller{



    /**
     * 获取用户信息
     * mr.hu ok
     * @param Request $request
     * @return \think\response\Json
     */

    public function index(Request $request){
        $data = UtilService::postMore([['info',[]]],$request);//获取前台传的code
//        var_dump($data);
//        var_dump(MiniProgramService::encryptor($data->code));
        $data = $data['info'];
        unset($data['info']);
//        var_dump(MiniProgramService::getUserInfo($data['code']));

        $res = $this->setCode($data['code']);
        if(!isset($res['openid'])) return JsonService::fail('openid获取失败');
        if(isset($res['unionid'])) $data['unionid'] = $res['unionid'];
        else $data['unionid'] = '';
        $data['routine_openid'] = $res['openid'];
        $data['session_key'] = $res['session_key'];
        $dataOauthInfo = RoutineUser::routineOauth($data);
        $data['uid'] = $dataOauthInfo['uid'];
        $data['page'] = $dataOauthInfo['page'];
        $data['status'] = RoutineUser::isUserStatus($data['uid']);
        return JsonService::successful($data);
    }

    
    /**
     * 小程序登录（用户）
     * 根据前台传code  获取 openid 和  session_key //会话密匙
     * mr.hu ok
     * @param string $code
     * @return array|mixed
     */
    public function setCode($code = ''){
        if($code == '') return [];
        $routineAppId = SystemConfig::getValue('routine_appId');//小程序appID
        $routineAppSecret = SystemConfig::getValue('routine_appsecret');//小程序AppSecret
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$routineAppId.'&secret='.$routineAppSecret.'&js_code='.$code.'&grant_type=authorization_code';
        return json_decode(RoutineServer::curlGet($url),true);
    }

    /**
     * 商户登录
     * @param string $user_name
     * @param string $user_passwd
     */
    public function login()
    {
        $post = $this->request->post();
        if(!$post['user_name']) return JsonService::fail('用户名不能为空');
        if(!$post['user_passwd']) return JsonService::fail('密码不能为空');

        $user= Db::name('merchant')->where(['account'=>$post['user_name']])->field('id,account,pwd')->find();

         if(strtolower($user['pwd'])==strtolower($post['user_passwd'])){
             $data['id']=$user['id'];
             $data['account']=$user['account'];
            return JsonService::successful($data);
        } else {
            return JsonService::fail('登录失败');

        }
    }

    /**
     * @return Request
     */
    public function restPwd()
    {
        return $this->request;
    }




    /**
     * 获取网站logo
     */
    public function get_enter_logo(){
        $siteLogo = SystemConfig::getValue('routine_logo');
        $siteName = SystemConfig::getValue('routine_name');
        $data['site_logo'] = $siteLogo;
        $data['site_name'] = $siteName;
        return JsonService::successful($data);
    }

    /**
     * 获取网站顶部颜色
     */
    public function get_routine_style(){
        $routineStyle = SystemConfig::getValue('routine_style');
        $data['routine_style'] = $routineStyle;
        return JsonService::successful($data);
    }

    /**
     * 获取客服电话
     */
    public function get_site_service_phone(){
        $siteServicePhone = SystemConfig::getValue('site_service_phone');
        $data['site_service_phone'] = $siteServicePhone;
        return JsonService::successful($data);
    }
}