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
     * 商户列表
     * @return array
     * @throws \think\Exception
     * @throws \think\exception\DbException
     * @throws db\exception\DataNotFoundException
     * @throws db\exception\ModelNotFoundException
     */
    /*public function index()
    {
        $where = Util::getMore([
            ['merchant_name',''],
            ['link_tel',''],
        ],$this->request);
        $this->assign([
            'where'=>$where,
        ]);

        $count= DB::name('user_enter')->where($where)->field('*')->count();

        //获取每页显示的条数
        $limit= Request::instance()->param('limit');
        //获取当前页数
        $page= Request::instance()->param('page');
        //计算出从那条开始查询
        $tol=($page-1)*$limit;

       $list = DB::name('user_enter')->where($where)->field('*')->limit($tol, $limit)->select();

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $count,
            'data'  =>$list,
        );
//var_dump($data);die;
        return $data;




    }*/
    /**
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
}