<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2019/8/5
 * Time: 14:30
 */

namespace app\admin\controller\pink;

use app\admin\controller\AuthController;
use app\admin\model\pink\Pink as PinkModel;
use service\JsonService as Json;
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
        return $this->fetch();
    }




    public function get_pink_lst()
    {
        $where=Util::getMore([
            ['page',1],
            ['limit',20],
            ['pname',''],
        ]);
        return Json::successlayui(PinkModel::getPinkList($where));

    }




    /*
    * 编辑
    */
    public function edit()
    {
        $param = $this->request->param();

        if(!isset($param['id'])){
            JsonService::fail('缺少参数');
        }

        $res =  Db::name('pink')->where('id',$param['id'])->find();
        // dump($res);

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
            $add_time=  Db::name('pink')->where('id',$post['id'])->value('add_time');
            if(time()>$add_time){
                JsonService::fail('拼团已开始，不能编辑');
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
     * 删除
     * @return Request
     */
    public function del()
    {
        $post = $this->request->post();

        if(!isset($post['id'])){
            JsonService::fail('缺少参数');
        }
        $add_time=  Db::name('pink')->where('id',$post['id'])->value('add_time');
        if(time()>$add_time){
            JsonService::fail('拼团已开始，不能删除');
        }
        $res=Db::name('pink')->where(['id'=>$post['id']])->update(['status'=>3]);

        if($res){
            return JsonService::successful('删除成功');

        }else{
            return JsonService::fail('删除失败');
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
    public function getInfo()
    {
        $pid = (int)$this->request->param('pid');

        if($pid <=0){
            JsonService::fail('缺少参数');
        }
        $pink_order_list =  Db::name('pink_order')->where('pid',$pid)->field('id,uid,k_id,code,is_shop')->select();
        foreach ($pink_order_list as $k=>$v){
            $pink_order_list[$k] ['k_id'] = $v['k_id']==0?'团长':'';
            $pink_order_list[$k] ['is_shop'] = $v['is_shop']==1?'已到店':'未到店';
            $pink_order_list[$k] ['phone'] = Db::name('user')->where('uid',$v['uid'])->value('phone');

        }

        $this->assign('list',$pink_order_list);

        return $this->fetch();
    }

}