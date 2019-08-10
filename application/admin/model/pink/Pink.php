<?php

namespace app\admin\model\pink;

use think\Db;
use traits\ModelTrait;
use basic\ModelBasic;

/**
 * 拼团模型 model
 * Class Pink
 * @package app\admin\model\Pink
 */
class Pink extends ModelBasic
{

    use ModelTrait;

    public static function getcount(){
        return self::count();
    }


   /*
    * 设置搜索条件
    */
    public static function setWhere($where)
    {
        $model=self::order('id desc');
        // if($where['pname']!=''){
        //     $model=self::order(self::setOrder($where['order']));
        // }else{
        //     $model=self::order('id desc');
        // }
        if($where['pname'] !== '') {

            $model = $model -> where('pname', 'LIKE', '%'.$where['pname'].'%');
        }
        // if($where['account'] != ''){
        //  $model = $model->where('account','LIKE','%'.$where['account'].'%');

        // }

        return $model;
    }
    /**
     * 异步获取当前拼团信息
     * @param $where
     * @return array
     */


    public static function getPinkList($where){

        $field = array('id','uid','pname','address','tel','num', 'people', 
                'price', 'add_time', 'stop_time', 'status', 'poster', 'picture', 
                'detail_image', 'info', 'remark', 'directions', 'shop_name', 'create_time', 'service_tel', 'notice');
        $model = self::setWherePage(self::setWhere($where),$where, $field);
        $list = $model->field('*')
            ->page((int)$where['page'],(int)$where['limit'])
            ->select()
            ->each(function ($item){
                $item['add_time']=date('Y-m-d H:i:s',$item['add_time']);
                $item['stop_time']=date('Y-m-d H:i:s',$item['stop_time']);
                // $item['create_time']=substr($item['create_time'],0,10);

            });//->toArray();
  
        $count=self::setWherePage(self::setWhere($where),$where, $field, [])->count();
        return ['count'=>$count,'data'=>$list];
    }

}