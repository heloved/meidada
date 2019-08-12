<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2019/8/5
 * Time: 14:30
 */

namespace app\admin\controller\extract;

use app\admin\controller\AuthController;
use service\JsonService as Json;
use app\admin\model\order\StoreOrder;
use app\admin\model\user\User;
use app\admin\model\wechat\WechatUser as UserModel;
use app\admin\model\wechat\UserEnter as UserEnterModel;
use app\admin\library\FormBuilder;
use app\wap\model\user\UserBill;
use service\UtilService as Util;
use think\db;
use think\Request;
use service\JsonService;


/**
 * 商户提现控制器
 * Class Extract
 * @package app\admin\controller\extract
 */
class Extract extends AuthController
{

    /**
     * 商户提现
     * @return array
     * @throws \think\Exception
     * @throws \think\exception\DbException
     * @throws db\exception\DataNotFoundException
     * @throws db\exception\ModelNotFoundException
     */
    public function index()
    {
        
        return $this->fetch();

    }

    /**
     * @return json
     */
    public function get_extract_lst(Request $request){
        $data = $request->param();

        //获取每页显示的条数
        $limit= $data['limit'];
        //获取当前页数
        $page= $data['page'];

        $where = array(
            'status' => 0,
        );
        $count= DB::name('extract')->where($where)->field('*')->count();

        //计算出从那条开始查询
        $tol=($page-1)*$limit;

       $list = DB::name('extract')->where($where)->field('*')->limit($tol, $limit)->select();
        foreach ($list as $k=>$v){
            $list[$k]['merchant_name']= Db::name('merchant')->where(['uid'=>$v['uid']])->value('merchant_name');
            $list[$k]['account']= Db::name('merchant')->where(['uid'=>$v['uid']])->value('account');
        }

        return Json::successlayui(array('count'=>$count, 'data' => $list));
    }




    /**
     * 详情
     * @return Request
     */
    public function getInfo()
    {
        $post = $this->request->post();

        if(!isset($post['id'])){
            JsonService::fail('缺少参数');
        }
        $res =  Db::name('extract')->where('id',$post['id'])->find();

        $this->assign('info',$res);

        return $this->fetch();

    }


    /**
     * 提现审核 通过|不通过
     *
     * @return json
     */
    public function set_status($status='',$id=''){
        ($status=='' || $id=='') && JsonService::fail('缺少参数');
        $res=Db::name('extract')->where(['id'=>$id])->update(['status'=>(int)$status]);
        if($res){
            return JsonService::successful($status==1 ? '审核通过':'审核不通过');
        }else{
            return JsonService::fail($status==-1 ? '审核不通过':'审核通过');
        }
    }

}