<?php
namespace app\routine\controller;

use Api\Express;
use app\routine\model\routine\RoutineCode;
use app\routine\model\routine\RoutineFormId;
use app\routine\model\routine\RoutineTemplate;
use app\routine\model\store\StoreCombination;
use service\JsonService;
use service\GroupDataService;
use service\MiniProgramService;
use service\RoutineBizDataCrypt;
use service\SystemConfigService;
use service\UploadService;
use service\UtilService;
use think\Db;
use think\Request;
use service\WechatTemplateService;
use service\CacheService;
use service\HookService;
use behavior\StoreProductBehavior;
use think\Url;
use app\routine\model\store\StoreCouponUser;
use app\routine\model\store\StoreOrder;
use app\routine\model\store\StoreProductRelation;
use app\routine\model\store\StoreProductAttr;
use app\routine\model\store\StoreProductAttrValue;
use app\routine\model\store\StoreProductReply;
use app\routine\model\store\StoreCart;
use app\routine\model\store\StoreCategory;
use app\routine\model\store\StoreProduct;
use app\routine\model\store\StoreSeckill;
use app\routine\model\user\User;
use app\routine\model\user\UserNotice;
use app\routine\model\store\StoreCouponIssue;
use app\routine\model\store\StoreCouponIssueUser;
use app\routine\model\store\StoreOrderCartInfo;
use app\routine\model\store\StorePink;
use app\routine\model\store\Pink;
use app\routine\model\store\PinkOrder;
use app\routine\model\store\StoreService;
use app\routine\model\store\StoreServiceLog;
use app\routine\model\user\UserAddress;
use app\routine\model\user\UserBill;
use app\routine\model\user\UserExtract;
use app\routine\model\user\UserRecharge;
use app\routine\model\user\UserSign;
use app\routine\model\user\WechatUser;
use app\admin\model\system\SystemConfig;
use app\routine\model\store\StoreBargain;
use app\routine\model\store\StoreBargainUser;
use app\routine\model\store\StoreBargainUserHelp;
use app\routine\model\article\Article as ArticleModel;

/**
 * 商户接口
 * Class AuthApi
 * @package app\routine\controller
 *
 */
class Store extends AuthController{


    /**
     * 添加拼团
     * ok
     * @return Request
     */
    public function addPink()
    {
        $post = $this->request->get();
        if(!$post['uid']) return JsonService::fail('参数错误');
        if(!$post['num'])return JsonService::fail('数量不能为空');

        $data = array(
            'uid'   => $post['uid'],
            'pname' => $post['pname'],
            'address'  => $post['address'],
            'num'=>$post['num'],
            'people'=>$post['people'],
        //     'tel'=>$post['tel'],
            'price'=>$post['price'],
            'add_time'=>strtotime($post['add_time']),
            'stop_time'=>strtotime($post['stop_time']),
            'detail_image'=>json_encode($post['detail_image']),
            'picture'=>json_encode($post['picture']),
            'info'=>$post['info'],
            'directions'=>$post['directions'],
            'service_tel'=>$post['service_tel'],
            'create_time'=>time(),
            'notice'=>$post['notice'],
            'shop_name'=>$post['shop_name']
        );

        $res = Db::name('pink')->insert($data);
        if($res){
            return JsonService::successful('ok');
        }else{
            return  JsonService::fail('添加拼团失败');
        }

    }

    /**
     * 添加银行卡
     * mr.hu ok
     * @return Request
     */
    public function addBank()
    {
        $post = $this->request->post();
        if(!isset($post['uid'])) return JsonService::fail('参数错误');
        if(!isset($post['bank_code']))return JsonService::fail('银行卡号不能为空');

        $data = array(
            'uid'   => $post['uid'],
            'real_name' => $post['real_name'],
            'province'=>$post['province'],
            'city'=>$post['city'],
            'district'=>$post['district'],
            'address'  => $post['address'],
            'user_name'=>$post['user_name'],
            'phone'=>$post['phone'],
            'bank_code'=>$post['bank_code'],
            'add_time'=>time(),
        );

        $res = Db::name('bank')->insert($data);
        if($res){
            return JsonService::successful('ok');
        }else{
            return  JsonService::fail('添加失败');
        }

    }

    /**
     * 银行卡列表
     *  mr.hu ok
     * @return Request
     */
    public function getBank()
    {
        $post = $this->request->post();
        if(!isset($post['uid'])) return JsonService::fail('参数错误');
       $list = Db::name('bank')->where('uid',$post['uid'])->order('add_time DESC')->select();
        if($list){
            return JsonService::successful('ok',$list);
        }else{
            return  JsonService::fail('添加失败');
        }
    }


    /**
     * 申请提现
     * mr.hu ok
     * @return Request
     */
    public function addExtract()
    {
        $post = $this->request->post();
        if(!isset($post['uid'])||!isset($post['bid'])) return JsonService::fail('参数错误');

        $res = Db::name('bank')->where(['bid'=>$post['bid'],'uid'=>$post['uid']])->find();

        $data = array(
            'uid'   => $post['uid'],
            'mid'=> Db::name('merchant')->where(['uid'=>$post['uid']])->value('id'),
            'real_name' => $res['real_name'],
            'bid'=>$post['bid'],
            'ordernob'=>$this->getNewId(),//单号
            'extract_price'=>$post['extract_price'],
            'bank_code'=>$res['bank_code'],
            'add_time'=>time(),
        );

        $res = Db::name('extract')->insert($data);
        if($res){
            return JsonService::successful('ok');
        }else{
            return  JsonService::fail('添加失败');
        }

    }

    /**
     * 提现记录
     * mr.hu ok
     * @return Request
     */
    public function getExtract()
    {
        $post = $this->request->post();
        if(!isset($post['uid'])) return JsonService::fail('参数错误');

        $list = Db::name('extract')->where(['uid'=>$post['uid']])->order('add_time DESC')->select();
        if($list){
            return JsonService::successful('ok',$list);
        }else{
            return  JsonService::fail('添加失败');
        }

    }


    //生成提现单号
    private  function getNewId()
    {
        return 'tx'.date('YmdHis',time()).rand(10000,99999);
    }

    /**
     * 获取拼团产品详情
     *
     * @param int $id
     */
    public function combination_detail(){
        $post = $this->request->post();
        if(!$post['id']) return JsonService::fail('拼团不存在或已下架');

        $info = Db::name('pink')->where('id',$post['id'])->find();
        if(!$info) return JsonService::fail('拼团不存在或已下架');
      //  $pink_order_list= Db::name('pink_order')->where('pid',$info['pid'])->field('id DESC')->select();

        $info['picture'] = json_decode($info['picture'],true);

     //   $combinationOne['userCollect'] = StoreProductRelation::isProductRelation($id,$this->userInfo['uid'],'collect','pink_product');

        $pink = PinkOrder::getPinkAll($post['id']);//拼团列表
        $pindAll = array();
        foreach ($pink as $k=>$v){
            $pink[$k]['count'] = PinkOrder::getPinkPeople($v['id'],$v['people']);
            $pink[$k]['h'] = date('H',$v['stop_time']);
            $pink[$k]['i'] = date('i',$v['stop_time']);
            $pink[$k]['s'] = date('s',$v['stop_time']);
            $pindAll[] = $v['id'];//开团团长ID
        }
        $user = WechatUser::get($this->userInfo['uid'])->toArray();//用户信息
        $data['pink'] = $pink;
        $data['user'] = $user;
        $data['pindAll'] = $pindAll;
        $data['storeInfo'] =$info;
        return JsonService::successful('ok,',$data);
    }

}