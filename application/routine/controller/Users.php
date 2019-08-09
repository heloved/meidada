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
     * mr.hu ok
     * {"code":200,"msg":"ok","data":{"uid":1,"account":"rt11564829206","pwd":"e10adc3949ba59abbe56e057f20f883e","nickname":"Mr\u3001Hu","avatar":"https:\/\/wx.qlogo.cn\/mmopen\/vi_32\/50DwZgyicl9cO0fE5uosPn81bDwnjrMEXDd2JDxWZFvyrA4rvEr4SzLicl3NPPiaQGric9mkuiaKuxthvVKibDQJldicg\/132","phone":null,"add_time":1564829206,"add_ip":"127.0.0.1","last_time":1565255291,"last_ip":"127.0.0.1","now_money":"0.00","integral":"0.00","sign_num":0,"status":1,"level":0,"spread_uid":0,"spread_time":0,"user_type":"routine","is_promoter":0,"pay_count":0,"spread_count":0,"no_pay_order":[{"id":1,"uid":1,"sid":1,"order_id":"wx2019080814273010001","oid":1,"total_num":1,"total_price":"100.00","pname":"\u4e03\u5915\u8282","pid":1,"people":6,"price":"100.00","add_time":"","stop_time":"","k_id":0,"code":0,"is_shop":0,"is_tpl":0,"status":1}],"pay_order":[]},"count":0}
     * @return \think\response\Json
     */
    public function myInfo(){
     //   $this->userInfo['couponCount'] = StoreCouponUser::getUserValidCouponCount($this->userInfo['uid']);
        $post = $this->request->post();
        if(!$post['status']) return JsonService::fail('参数错误');

        //订单信息
        $where['o.uid']=$this->userInfo['uid'];

        $where['o.status']=$post['status'];//0;

        $order_list = StoreOrder::getOrderPink($where);

        $this->userInfo['order']=$order_list;

        return JsonService::successful($this->userInfo);
    }


    /**
     * 获取拼团产品详情
     * mr.hu ok
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
        return JsonService::successful($data);
    }

}