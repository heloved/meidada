<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2019/8/5
 * Time: 14:30
 */

namespace app\admin\controller\pink;

use app\admin\controller\AuthController;
use app\admin\model\order\StoreOrder;
use app\admin\model\user\User;
use app\admin\model\wechat\WechatUser as UserModel;
use app\admin\model\wechat\UserEnter as UserEnterModel;
use app\admin\library\FormBuilder;
use app\wap\model\user\UserBill;
use service\UtilService as Util;
use think\db;
use think\Request;


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
            ['nickname',''],
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

       $list = DB::name('user_enter')->where($where)->field('*')->limit($tol, $limit)->select();

        $data = array(
            'code'  => 0,
            'msg'   => '',
            'count' => $count,
            'data'  =>$list,
        );
//var_dump($data);die;
        return $data;




    }

}