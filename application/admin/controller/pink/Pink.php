<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2019/8/5
 * Time: 14:30
 */

namespace app\admin\controller\pink;

use app\admin\controller\AuthController;
use app\admin\model\user\User;
use app\admin\library\FormBuilder;
use app\wap\model\user\UserBill;
use service\UtilService as Util;
use think\db;
use think\Request;
use service\JsonService;


/**
 * 拼团管理控制器
 * Class Pink
 * @package app\admin\controller\pink
 */
class Pink extends AuthController
{

    /**
     * 拼团列表
     * @return array
     * @throws \think\Exception
     * @throws \think\exception\DbException
     * @throws db\exception\DataNotFoundException
     * @throws db\exception\ModelNotFoundException
     */
    public function index()
    {
        $where = Util::getMore([
            ['pname',''],
            ['data',''],
        ],$this->request);
        $this->assign([
            'where'=>$where,
        ]);

        $count= DB::name('pink')->where($where)->field('*')->count();

        //获取每页显示的条数
        $limit= Request::instance()->param('limit');
        //获取当前页数
        $page= Request::instance()->param('page');
        //计算出从那条开始查询
        $tol=($page-1)*$limit;

       $list = DB::name('pink')->where($where)->field('*')->limit($tol, $limit)->select();

       foreach ($list as $k=>$v){
           //拼团开始后不允许编辑
             if(time()>= $v['add_time']&&$v['status']==1){
                 $list[$k]['edit']=false;
             }
       }

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $count,
            'data'  =>$list,
        );
//var_dump($data);die;
        return $data;




    }

    /*
    * 编辑
    */
    public function edit()
    {
        $post = $this->request->post();

        if(!isset($post['id'])){
            JsonService::fail('缺少参数');
        }
        $res =  Db::name('pink')->where('id',$post['id'])->find();

        $this->assign('info',$res);
        return $this->fetch();
    }

    /**
     * 保存
     * @return array
     */
    public function save(){
        if($this->request->isPost()){
            $post = $this->request->post();

            if(!isset($post['id'])){
                JsonService::fail('缺少参数');
            }
                $data = array(
                    'pname'   => $post['pname'],
                    'service_tel'=>$post['service_tel'],
                    'num'   => $post['num'],
                    'address'   => $post['address'],
                    'people'   => $post['people'],
                    'price'   => $post['price'],
                    'add_time'   => $post['add_time'],
                    'stop_time'=>$post['stop_time'],
                    'picture'=>$post['picture'],
                    'detail_image'=>$post['detail_image'],
                    'info'=>$post['info'],
                    'directions'=>$post['directions'],
                    'shop_name'=>$post['shop_name'],
                    'notice'=>$post['notice'],
                    'status'   => $post['status']
                );
                $res = Db::name('pink')->where('id',$post['id'])->update($data);


            if($res){
                return JsonService::successful('保存成功');

            }else{
                return JsonService::fail('保存失败');
            }


        }
    }

    /**
     * 停用
     *
     * @return json
     */
    public function set_status($status='',$id=''){
        ($status=='' || $id=='') && JsonService::fail('缺少参数');
        $res=Db::name('pink')->where(['id'=>$id])->update(['status'=>(int)$status]);
        if($res){
            return JsonService::successful($status==1 ? '上线':'下架');
        }else{
            return JsonService::fail($status==2 ? '下架':'上线');
        }
    }

    /**
     * 拼团详情
     * @return Request
     */
    public function info()
    {
        $post = $this->request->post();

        if(!isset($post['pid'])){
            JsonService::fail('缺少参数');
        }
        $pink_order_list =  Db::name('pink_order')->where('pid',$post['pid'])->field('id,uid,k_id,code,is_shop')->select();
        foreach ($pink_order_list as $k=>$v){
            $pink_order_list[$k] ['k_id'] = $v['k_id']==0?'团长':'';
            $pink_order_list[$k] ['is_shop'] = $v['is_shop']==1?'已到店':'未到店';
            $pink_order_list[$k] ['phone'] = Db::name('user')->where('uid',$v['uid'])->value('phone');

        }

        $this->assign('list',$pink_order_list);

        return $this->fetch();
    }

}