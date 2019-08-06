<?php
/**
 *
 * @author:HH
 * @day: 2017/11/11
 */

namespace app\admin\model\merchant;

use service\PHPExcelService;
use think\Db;
use traits\ModelTrait;
use basic\ModelBasic;
use app\admin\model\store\StoreCategory as CategoryModel;
use app\admin\model\order\StoreOrder;
use app\admin\model\system\SystemConfig;

/**
 * 商户管理 model
 * Class StoreProduct
 * @package app\admin\model\Merchant
 */
class Merchant extends ModelBasic
{

    use ModelTrait;

    public static function getcount(){
        return self::count();
    }


    /*
 * 设置搜索条件
 *
 */
    public static function setWhere($where)
    {
        if($where['order']!=''){
            $model=self::order(self::setOrder($where['order']));
        }else{
            $model=self::order('id desc');
        }
        if($where['merchant_name'] !== '') {

            $model = $model->where('merchant_name', 'LIKE', '%'.$where['merchant_name'].'%');
        }
        if($where['account'] != ''){
         $model = $model->where('account','LIKE','%'.$where['account'].'%');

        }

        return $model;
    }
    /**
     * 异步获取当前商户 信息
     * @param $where
     * @return array
     */
    public static function getUserList($where){
        $model = self::setWherePage(self::setWhere($where),$where,['account','pwd','phone','status','merchant_name','uid']);
        $list = $model->field('*')
            ->page((int)$where['page'],(int)$where['limit'])
            ->select()
            ->each(function ($item){
                $item['add_time']=date('Y-m-d H:i:s',$item['add_time']);

            });//->toArray();

        $count=self::setWherePage(self::setWhere($where),$where,['account','pwd','phone','status','merchant_name'],['merchant_name','uid'])->count();
        return ['count'=>$count,'data'=>$list];
    }

}