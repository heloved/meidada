<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2019/8/5
 * Time: 14:30
 */

namespace app\admin\controller\merchant;

use app\admin\controller\AuthController;
use app\admin\model\order\StoreOrder;
use service\JsonService as Json;
use service\JsonService;
use app\admin\model\user\User;
use app\admin\model\merchant\Merchant as MerchantModel;
use app\admin\model\wechat\WechatUser as UserModel;
use app\admin\library\FormBuilder;
use service\UtilService as Util;
use think\db;
use think\Request;


/**
 * 商户管理控制器
 * Class Merchant
 * @package app\admin\controller\merchant
 */
class Merchant extends AuthController
{

    /**
     *
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index(){

        $this->assign('count_enter',MerchantModel::getcount());
        return $this->fetch();
    }


    /**
     * 获取merchant表
     *
     * @return json
     */
    public function get_user_list(){
        $where=Util::getMore([
            ['page',1],
            ['limit',20],
            ['merchant_name',''],
            ['account',''],
            ['order',''],
        ]);
        return Json::successlayui(MerchantModel::getUserList($where));
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
      $res =  Db::name('merchant')->where('id',$post['id'])->find();

        $this->assign('info',$res);

        return $this->fetch();

    }

    /**
     * 新增
     * @return mixed
     */
    public function add()
    {

        return $this->fetch();
    }

    /*
     * 编辑
     */
    public function edit()
    {
        $id = $this->request->param('id');
 
        $res =  Db::name('merchant')->where('id',$id)->find();

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

            if(isset($post['id'])){
                $data = array(
                    'merchant_name'   => $post['merchant_name'],
                    'province'    => $post['province'],
                    'city'=>$post['city'],
                    // 'district'   => $post['district'],
                    'address'   => $post['address'],
                    'account'   => $post['account'],
                    'pwd'   => $post['pwd'],
                    // 'phone'   => $post['phone'],
                    // 'status'   => $post['status']
                );
                $res = Db::name('merchant')->where('id',$post['id'])->update($data);

            }else{
                $data = array(
                    'merchant_name'   => $post['merchant_name'],
                    'province'    => $post['province'],
                    'city'=>$post['city'],
                    // 'district'   => $post['district'],
                    'address'   => $post['address'],
                    'account'   => $post['account'],
                    'pwd'   => $post['pwd'],
                    'uid'   => '',
                    // 'phone'   => $post['phone'],
                    // 'status'   => $post['status'],
                    'add_time'   => time()
                );

                $res = Db::name('merchant')->insert($data);

            }
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
        $res = Db::name('merchant')->where('id',$post['id'])->delete();

        if($res){
            return JsonService::successful('删除成功');

        }else{
            return JsonService::fail('删除失败');
        }
    }


    /**
     * 修改状态 190810
     * @return Request
     */
    public function changeStatus()
    {
        $post = $this->request->post();

        if(!isset($post['id'])){
            JsonService::fail('缺少参数');
        }
        $res = Db::name('merchant')->update($post);

        if($res){
            return JsonService::successful('操作成功');
        }else{
            return JsonService::fail('操作失败');
        }
    }
}