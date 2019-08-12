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

        $pink = PinkOrder::getPinkAll($post['id'],2);//拼团列表
        $pindAll = array();
        foreach ($pink as $k=>$v){
          $count = PinkOrder::getPinkPeople($v['id'],$v['people']);
            $pink[$k]['pink']= $count==$v['people']?'1':0; //1拼团成功
            $pink[$k]['count']=$count;
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

    /**
     * 拼团列表（参团）
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function combination_list(){
        $post = $this->request->post();
        if(!$post['id']) return JsonService::fail('拼团不存在或已下架');

        $info = Db::name('pink')->where('id',$post['id'])->find();
        if(!$info) return JsonService::fail('拼团不存在或已下架');

        //   $combinationOne['userCollect'] = StoreProductRelation::isProductRelation($id,$this->userInfo['uid'],'collect','pink_product');

        $pink = PinkOrder::getPinkAll($post['id']);//拼团列表

       // $user = WechatUser::get($this->userInfo['uid'])->toArray();//用户信息
        $data['pink'] = $pink;
       // $data['user'] = $user;
        return JsonService::successful($data);
    }

    /**
     * 拼团 加入到购物车
     * @param string $productId
     * @param int $cartNum
     * @param int $combinationId
     * @return \think\response\Json
     */
    public function now_buy($productId = '',$cartNum = 1,$combinationId = 0){
        if(!$combinationId || !is_numeric($productId)) return JsonService::fail('参数错误');

        if(!Pink::getCombinationStock($combinationId,$cartNum))
            return self::setErrorInfo('该产品库存不足'.$cartNum);
        if(!Pink::isValidCombination($combinationId))
            return self::setErrorInfo('该产品已下架或删除');
        $where = ['type'=>'product','uid'=>$this->userInfo['uid'],'product_id'=>$productId,'product_attr_unique'=>'','is_new'=>1,'is_pay'=>0,'is_del'=>0,'combination_id'=>$combinationId];

        $cart =  Db::name('store_cart')->where($where)->find();
        if(!$cart){
            $data = ['type'=>'product',
                'uid'=>$this->userInfo['uid'],
                'product_id'=>$productId,
                'product_attr_unique'=>'',
                'is_new'=>1,
                'is_pay'=>0,
                'is_del'=>0,
                'add_time'=>time(),
                'combination_id'=>$combinationId
            ];

            $id = Db::name('store_cart')->insertGetId($data);
            if(!$id) return JsonService::fail(StoreCart::getErrorInfo());
            else  return JsonService::successful('ok',['cartId'=>$id]);
        }



    }
    /**
     * 订单页面
     * @param Request $request
     * @return \think\response\Json
     */
    public function confirm_order(Request $request){

        $data = UtilService::postMore(['cartId'],$request);
        $cartId = $data['cartId'];
        if(!is_string($cartId) || !$cartId ) return JsonService::fail('请提交购买的商品');
        $cartInfo=  Db::name('store_cart')->where('id',$cartId)->find();
       $pink = Db::name('pink')->where('id',$cartInfo['product_id'])->find();

            $info = StoreCart::where('id',$cartId)->find();
            if((int)$info['combination_id']>0) $combination_id=$info['combination_id'];
            else $combination_id=0;

        $data['combination_id'] = $combination_id;
        $data['cartInfo'] = $cartInfo;
        $data['pink'] = $pink;
    //    $data['priceGroup'] = $priceGroup;
     //   $data['orderKey'] = StoreOrder::cacheOrderInfo($this->userInfo['uid'],$cartInfo,$priceGroup,$other);
     //   $data['offlinePostage'] = $other['offlinePostage'];
        $data['userInfo'] = User::getUserInfo($this->userInfo['uid']);
       // $data['integralRatio'] = $other['integralRatio'];
        return JsonService::successful($data);
    }
    /**
     * 创建订单
     * @param string $key
     * @return \think\response\Json
     */
    public function create_order($key = '')
    {
        if(!$key) return JsonService::fail('参数错误!');
        if(StoreOrder::be(['order_id|unique'=>$key,'uid'=>$this->userInfo['uid'],'is_del'=>0])){

            return JsonService::status('extend_order','订单已生成',['orderId'=>$key,'key'=>$key]);
        }

        list($addressId,$couponId,$payType,$useIntegral,$mark,$combinationId,$pinkId,$seckill_id,$formId,$bargainId) = UtilService::postMore([
            'addressId','couponId','payType','useIntegral','mark',['combinationId',0],['pinkId',0],['seckill_id',0],['formId',''],['bargainId','']
        ],Request::instance(),true);
        $payType = strtolower($payType);

        if($pinkId) if(PinkOrder::getIsPinkUid($pinkId,$this->userInfo['uid'])){

         return JsonService::status('ORDER_EXIST','订单生成失败，你已经在该团内不能再参加了',['orderId'=>StoreOrder::getStoreIdPink($pinkId,$this->userInfo['uid'])]);
        }
        if($pinkId) if(StoreOrder::getIsOrderPink($pinkId,$this->userInfo['uid'])){
            return JsonService::status('ORDER_EXIST','订单生成失败，你已经参加该团了，请先支付订单',['orderId'=>StoreOrder::getStoreIdPink($pinkId,$this->userInfo['uid'])]);

        }
       //生成订单
        $order = StoreOrder::cacheKeyCreateOrder($this->userInfo['uid'],$key,$addressId,$payType,$useIntegral,$couponId,$mark,$combinationId,$pinkId,$seckill_id,$bargainId);
        $orderId = $order['order_id'];
        $info = compact('orderId','key');
        if($orderId){
            if($payType == 'weixin'){
                $orderInfo = StoreOrder::where('order_id',$orderId)->find();
                if(!$orderInfo || !isset($orderInfo['paid'])) exception('支付订单不存在!');
                if($orderInfo['paid']) exception('支付已支付!');
                //如果支付金额为0
                if(bcsub((float)$orderInfo['pay_price'],0,2) <= 0){
                    //创建订单jspay支付
                    if(StoreOrder::jsPayPrice($orderId,$this->userInfo['uid'],$formId))
                        return JsonService::status('success','微信支付成功',$info);
                    else
                        return JsonService::status('pay_error',StoreOrder::getErrorInfo());
                }else{
                    try{
                        $jsConfig = StoreOrder::jsPay($orderId);//创建订单jspay
                    }catch (\Exception $e){
                        return JsonService::status('pay_error',$e->getMessage(),$info);
                    }
                    $info['jsConfig'] = $jsConfig;
                    return JsonService::status('wechat_pay','订单创建成功',$info);
                }
            }
        }else{
            return JsonService::fail(StoreOrder::getErrorInfo('订单生成失败!'));
        }
    }

}