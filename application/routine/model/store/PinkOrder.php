<?php
/**
 *
 * @author:HH
 * @day: 2017/12/18
 */

namespace app\routine\model\store;

use app\routine\model\store\StoreCombination;
use app\routine\model\user\User;
use app\routine\model\user\UserBill;
use app\routine\model\user\WechatUser;
use basic\ModelBasic;
use service\SystemConfigService;
use service\RoutineTemplateService;
use think\Url;
use traits\ModelTrait;

/**
 * 拼团Model
 * Class StorePink
 * @package app\wap\model\store
 */
class PinkOrder extends ModelBasic
{
    use ModelTrait;


    /**
     * 获取一条拼团数据
     * mr,hu
     * @param $id
     * @return mixed
     */
    public static function getPinkUserOne($id){
        $model = new self();
        $model = $model->alias('p');
        $model = $model->field('p.*,u.nickname,u.avatar');
        $model = $model->where('id',$id);
        $model = $model->join('__USER__ u','u.uid = p.uid');
        $list = $model->find();
        if($list) return $list->toArray();
        else return [];
    }

    /**
     * 获取拼团的团员
     * @param $id
     * @return mixed
     */
    public static function getPinkMember($id){
        $model = new self();
        $model = $model->alias('p');
        $model = $model->field('p.*,u.nickname,u.avatar');
        $model = $model->where('k_id',$id);
        $model = $model->where('is_refund',0);
        $model = $model->join('__USER__ u','u.uid = p.uid');
        $model = $model->order('id asc');
        $list = $model->select();
        if($list) return $list->toArray();
        else return [];
    }

    /**
     * 设置结束时间
     * @param $idAll
     * @return $this
     */
    public static function setPinkStopTime($idAll){
        $model = new self();
        $model = $model->where('id','IN',$idAll);
        return $model->update(['stop_time'=>time(),'status'=>2]);
    }

    /**
     * 获取正在拼团的数据  团长
     * mr.hu
     * @return mixed
     */
    public static function getPinkAll($pid){
        $model = new self();
        $model = $model->alias('p');
        $model = $model->field('p.*,u.nickname,u.avatar');
        $model = $model->where('stop_time','GT',time());
        $model = $model->where('pid',$pid);
        $model = $model->where('k_id',0);
     //   $model = $model->where('is_refund',0);
        $model = $model->order('add_time desc');
        $model = $model->join('__USER__ u','u.uid = p.uid');
        $list = $model->select();
        if($list) return $list->toArray();
        else return [];
    }

    /**
     * 获取还差几人
     * mr.hu
     */
    public static function getPinkPeople($kid,$people){
        $model = new self();
        $model = $model->where('k_id',$kid)->where('status',1);
        $count = bcadd($model->count(),1,0);
        return bcsub($people,$count,0);
    }

    /**
     * 判断订单是否在当前的拼团中
     * @param $orderId
     * @param $kid
     * @return bool
     */
    public static function getOrderIdAndPink($orderId,$kid){
        $model = new self();
        $pink = $model->where('k_id',$kid)->whereOr('id',$kid)->column('order_id');
        if(in_array($orderId,$pink))return true;
        else return false;
    }

    /**
     * 判断用户是否在团内
     * @param $id
     * @return int|string
     */
    public static function getIsPinkUid($id = 0,$uid = 0){
         $pinkT = self::where('id',$id)->where('uid',$uid)->where('is_refund',0)->count();
         $pink = self::whereOr('k_id',$id)->where('uid',$uid)->where('is_refund',0)->count();
         if($pinkT) return true;
         if($pink) return true;
         else return false;
    }


    /**
     * 判断是否发送模板消息 0 未发送 1已发送
     * @param $uidAll
     * @return int|string
     */
    public static function isTpl($uidAll,$pid){
        if(is_array($uidAll)){
            $countK = self::where('uid','IN',implode(',',$uidAll))->where('is_tpl',0)->where('id',$pid)->count();
            $count = self::where('uid','IN',implode(',',$uidAll))->where('is_tpl',0)->where('k_id',$pid)->count();
        }
        else {
            $countK = self::where('uid',$uidAll)->where('is_tpl',0)->where('id',$pid)->count();
            $count = self::where('uid',$uidAll)->where('is_tpl',0)->where('k_id',$pid)->count();
        }
        return bcadd($countK,$count,0);
    }
    /**
     * 拼团成功提示模板消息
     * @param $uidAll
     * @param $pid
     */
    public static function orderPinkAfter($uidAll,$pid){
//         foreach ($uidAll as $v){
//             $openid = WechatUser::uidToOpenid($v);
//             RoutineTemplateService::sendTemplate($openid,RoutineTemplateService::ORDER_USER_GROUPS_SUCCESS,[
//                 'first'=>'亲，您的拼团已经完成了',
//                 'keyword1'=> self::where('id',$pid)->whereOr('k_id',$pid)->where('uid',$v)->value('order_id'),
//                 'keyword2'=> self::alias('p')->where('p.id',$pid)->whereOr('p.k_id',$pid)->where('p.uid',$v)->join('__STORE_COMBINATION__ c','c.id=p.cid')->value('c.title'),
//                 'remark'=>'点击查看订单详情'
//             ],Url::build('My/order_pink_after',['id'=>$pid],true,true));
//         }
         self::beginTrans();
         $res1 = self::where('uid','IN',implode(',',$uidAll))->where('id',$pid)->whereOr('k_id',$pid)->update(['is_tpl'=>1]);
         $res2 = true;
//         if(SystemConfigService::get('colonel_status')) $res2 = self::setRakeBackColonel($pid);
//         else $res2 = true;
         $res = $res1 && $res2;
         self::checkTrans($res);
    }

    /**
     * 拼团失败发送的模板消息
     * @param $uid
     * @param $pid
     */
    public static function orderPinkAfterNo($uid,$pid){
            $openid = WechatUser::uidToOpenid($uid);
            RoutineTemplateService::sendTemplate($openid,RoutineTemplateService::ORDER_USER_GROUPS_LOSE,[
                'first'=>'亲，您的拼团失败',
                'keyword1'=> self::alias('p')->where('p.id',$pid)->whereOr('p.k_id',$pid)->where('p.uid',$uid)->join('__STORE_COMBINATION__ c','c.id=p.cid')->value('c.title'),
                'keyword2'=> self::where('id',$pid)->whereOr('k_id',$pid)->where('uid',$uid)->value('price'),
                'keyword3'=> self::alias('p')->where('p.id',$pid)->whereOr('p.k_id',$pid)->where('p.uid',$uid)->join('__STORE_ORDER__ c','c.order_id=p.order_id')->value('c.pay_price'),
                'remark'=>'点击查看订单详情'
            ],Url::build('My/order_pink_after',['id'=>$pid],true,true));
            self::where('id',$pid)->update(['status'=>3]);
            self::where('k_id',$pid)->update(['status'=>3]);
    }

    /**
     * 获取当前拼团数据返回订单编号
     * @param $id
     * @return array|false|\PDOStatement|string|\think\Model
     */
    public static function getCurrentPink($id){
        $uid = User::getActiveUid();//获取当前登录人的uid
        $pink = self::where('id',$id)->where('uid',$uid)->find();
        if(!$pink) $pink = self::where('k_id',$id)->where('uid',$uid)->find();
        return StoreOrder::where('id',$pink['order_id_key'])->value('order_id');
    }

    public static function systemPage($where){
        $model = new self;
        $model = $model->alias('p');
        $model = $model->field('p.*,c.title');
        if($where['data'] !== ''){
            list($startTime,$endTime) = explode(' - ',$where['data']);
            $model = $model->where('p.add_time','>',strtotime($startTime));
            $model = $model->where('p.add_time','<',strtotime($endTime));
        }
        if($where['status']) $model = $model->where('p.status',$where['status']);
        $model = $model->where('p.k_id',0);
        $model = $model->order('p.id desc');
        $model = $model->join('StoreCombination c','c.id=p.cid');
        return self::page($model,function($item)use($where){
            $item['count_people'] = bcadd(self::where('k_id',$item['id'])->count(),1,0);
        },$where);
    }

    public static function isPinkBe($data,$id){
        $data['id'] = $id;
        $count = self::where($data)->count();
        if($count) return $count;
        $data['k_id'] = $id;
        $count = self::where($data)->count();
        if($count) return $count;
        else return 0;
    }
    public static function isPinkStatus($pinkId){
        if(!$pinkId) return false;
        $stopTime = self::where('id',$pinkId)->value('stop_time');
        if($stopTime < time()) return true; //拼团结束
        else return false;//拼团未结束
    }

    /**
     * 判断拼团结束 后的状态
     * @param $pinkId
     * @return bool
     */
    public static function isSetPinkOver($pinkId){
        $people = self::where('id',$pinkId)->value('people');
        $stopTime = self::where('id',$pinkId)->value('stop_time');
        if($stopTime < time()){
            $countNum = self::getPinkPeople($pinkId,$people);
            if($countNum) return false;//拼团失败
            else return true;//拼团成功
        }else return true;
    }

    /**
     * 拼团退款
     * @param $id
     * @return bool
     */
    public static function setRefundPink($oid){
        $res = true;
        $order = StoreOrder::where('id',$oid)->find();
        if($order['pink_id']) $id = $order['pink_id'];
        else return $res;
        $count = self::where('id',$id)->where('uid',$order['uid'])->find();//正在拼团 团长
        $countY = self::where('k_id',$id)->where('uid',$order['uid'])->find();//正在拼团 团员
        if(!$count && !$countY) return $res;
        if($count){//团长
            //判断团内是否还有其他人  如果有  团长为第二个进团的人
            $kCount = self::where('k_id',$id)->order('add_time asc')->find();
            if($kCount){
                $res11 = self::where('k_id',$id)->update(['k_id'=>$kCount['id']]);
                $res12 = self::where('id',$kCount['id'])->update(['stop_time'=>$count['add_time']+86400,'k_id'=>0]);
                $res1 = $res11 && $res12;
                $res2 = self::where('id',$id)->update(['stop_time'=>time()-1,'k_id'=>0,'is_refund'=>$kCount['id'],'status'=>3]);
            }else{
                $res1 = true;
                $res2 = self::where('id',$id)->update(['stop_time'=>time()-1,'k_id'=>0,'is_refund'=>$id,'status'=>3]);
            }
            //修改结束时间为前一秒  团长ID为0
            $res = $res1 && $res2;
        }else if($countY){//团员
            $res =  self::where('id',$countY['id'])->update(['stop_time'=>time()-1,'k_id'=>0,'is_refund'=>$id,'status'=>3]);
        }
        return $res;

    }



    /**
     * 拼团人数完成时，判断全部人都是未退款状态
     * @param $pinkIds
     * @return bool
     */
    public static function setPinkStatus($pinkIds){
        $orderPink = self::where('id','IN',$pinkIds)->where('is_refund',1)->count();
        if(!$orderPink) return true;
        else return false;
    }


    /**
     * 创建拼团
     * mr.hu
     * @param $order
     * @return mixed
     */
    public static function createPink($order){
        $order = StoreOrder::tidyOrder($order,true)->toArray();
        if($order['pink_id']){//拼团存在
            $res = false;
            $pink['uid'] = $order['uid'];//用户id
            if(self::isPinkBe($pink,$order['pink_id'])) return false;
            $pink['order_id'] = $order['order_id'];//订单id  生成
            $pink['oid'] = $order['id'];//订单id  数据库id
            $pink['total_num'] = $order['total_num'];//购买个数
            $pink['total_price'] = $order['pay_price'];//总金额
            $pink['k_id'] = $order['pink_id'];//拼团id
            foreach ($order['cartInfo'] as $v){
                $pink['cid'] = $v['combination_id'];//拼团产品id
                $pink['pid'] = $v['product_id'];//产品id
                $pink['people'] = StoreCombination::where('id',$v['combination_id'])->value('people');//几人拼团
                $pink['price'] = $v['productInfo']['price'];//单价
                $pink['stop_time'] = 0;//结束时间
                $pink['add_time'] = time();//开团时间
                $res = StorePink::set($pink)->toArray();
            }
            if($res) return true;
            else return false;
        }else{
            $res = false;
            $pink['uid'] = $order['uid'];//用户id
            $pink['order_id'] = $order['order_id'];//订单id  生成
            $pink['oid'] = $order['id'];//订单id  数据库id
            $pink['total_num'] = $order['total_num'];//购买个数
            $pink['total_price'] = $order['pay_price'];//总金额
            $pink['k_id'] = 0;//拼团id
            foreach ($order['cartInfo'] as $v){
                $pink['cid'] = $v['combination_id'];//拼团产品id
                $pink['pid'] = $v['product_id'];//产品id
                $pink['people'] = StoreCombination::where('id',$v['combination_id'])->value('people');//几人拼团
                $pink['price'] = $v['productInfo']['price'];//单价
//                $stopTime = StoreCombination::where('id',$v['combination_id'])->value('stop_time');//获取拼团产品结束的时间
//                if($stopTime < time()+86400)  $pink['stop_time'] = $stopTime;//结束时间
                $pink['stop_time'] = time()+86400;//结束时间
                $pink['add_time'] = time();//开团时间
                $res1 = self::set($pink)->toArray();
                $res2 = StoreOrder::where('id',$order['id'])->update(['pink_id'=>$res1['id']]);
                $res = $res1 && $res2;
            }
            if($res) return true;
            else return false;
        }
    }

    /**
     * 拼团成功后给团长返佣金
     * @param int $id
     * @return bool
     */
//    public static function setRakeBackColonel($id = 0){
//        if(!$id) return false;
//        $pinkRakeBack = self::where('id',$id)->field('people,price,uid,id')->find()->toArray();
//        $countPrice = bcmul($pinkRakeBack['people'],$pinkRakeBack['price'],2);
//        if(bcsub((float)$countPrice,0,2) <= 0) return true;
//        $rakeBack = (SystemConfigService::get('rake_back_colonel') ?: 0)/100;
//        if($rakeBack <= 0) return true;
//        $rakeBackPrice = bcmul($countPrice,$rakeBack,2);
//        if($rakeBackPrice <= 0) return true;
//        $mark = '拼团成功,奖励佣金'.floatval($rakeBackPrice);
//        self::beginTrans();
//        $res1 = UserBill::income('获得拼团佣金',$pinkRakeBack['uid'],'now_money','colonel',$rakeBackPrice,$id,0,$mark);
//        $res2 = User::bcInc($pinkRakeBack['uid'],'now_money',$rakeBackPrice,'uid');
//        $res = $res1 && $res2;
//        self::checkTrans($res);
//        return $res;
//    }
}