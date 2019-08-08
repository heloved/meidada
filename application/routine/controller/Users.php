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
 * 用户接口
 * Class AuthApi
 * @package app\routine\controller
 *
 */
class Users extends AuthController{

    /**
     * 个人中心
     * @return \think\response\Json
     */
    public function myInfo(){
     //   $this->userInfo['couponCount'] = StoreCouponUser::getUserValidCouponCount($this->userInfo['uid']);
       // $post = $this->request->post();
       // if(!$post['id']) return JsonService::fail('拼团不存在或已下架');

        //订单信息
       // $order_list=DB::name('store_order')->where(['uid'=>$this->userInfo['uid'],'status'=>0])->order('id DESC')->select();
        $where['uid']=$this->userInfo['uid'];
        $where['status']=0;
        $order_list = StoreOrder::getOrderPink($where);

        foreach ($order_list as $k=>$v){

        }

        $this->userInfo['no_pay_order']='';
        $this->userInfo['pay_order'] =DB::name('store_order')->where(['uid'=>$this->userInfo['uid'],'status'=>1])->order('id DESC')->select();
        return JsonService::successful($this->userInfo);
    }

    /**
     * 获取拼团产品详情
     * mr.hu
     * @param int $id
     */
    public function combination_detail(){
        $post = $this->request->post();
        if(!$post['id']) return JsonService::fail('拼团不存在或已下架');

        $info = Db::name('pink')->where('id',$post['id'])->find();
        if(!$info) return JsonService::fail('拼团不存在或已下架');
      //  $pink_order_list= Db::name('pink_order')->where('pid',$info['pid'])->field('id DESC')->select();

        $combinationOne['images'] = json_decode($info['images'],true);
     //   $combinationOne['userCollect'] = StoreProductRelation::isProductRelation($id,$this->userInfo['uid'],'collect','pink_product');

        $pink = PinkOrder::getPinkAll($post['id']);//拼团列表
        $pindAll = array();
        foreach ($pink as $k=>$v){
            $pink[$k]['count'] = StorePink::getPinkPeople($v['id'],$v['people']);
            $pink[$k]['h'] = date('H',$v['stop_time']);
            $pink[$k]['i'] = date('i',$v['stop_time']);
            $pink[$k]['s'] = date('s',$v['stop_time']);
            $pindAll[] = $v['id'];//开团团长ID
        }
        $user = WechatUser::get($this->userInfo['uid'])->toArray();//用户信息
        $data['pink'] = $pink;
        $data['user'] = $user;
        $data['pindAll'] = $pindAll;
        $data['storeInfo'] = $combinationOne;
      //  $data['reply'] = StoreProductReply::getRecProductReply($combinationOne['product_id']);
       // $data['replyCount'] = StoreProductReply::productValidWhere()->where('product_id',$combinationOne['product_id'])->count();
//        $data['mer_id'] = StoreProduct::where('id',$combinationOne['product_id'])->value('mer_id');
        return JsonService::successful($data);
    }

}