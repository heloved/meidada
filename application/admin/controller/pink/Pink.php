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
use service\UploadService as Upload;


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
        
        $res['add_time'] = date('Y-m-d H:i:s',$res['add_time']);
        $res['stop_time'] = date('Y-m-d H:i:s',$res['stop_time']);
        $res['top_img'] = explode(',',$res['picture']);
        $res['detail_img'] = explode(',',$res['detail_image']);

        dump($res);

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
                return JsonService::fail('缺少参数');
            }
            $add_time=  Db::name('pink')->where('id',$post['id'])->value('add_time');
            if(time()>$add_time){
                return JsonService::fail('拼团已开始，不能编辑');
            }
            
            if(!isset($post['picture'])){
                return JsonService::fail('请上传顶部图');
            }
            $picture = implode(',',$post['picture']);

            if(!isset($post['detail_image'])){
                return JsonService::fail('请上传详情图');
            }
            $detail_img = implode(',',$post['detail_image']);

            $data = array(
                'pname'   => $post['pname'],
                'service_tel'=>$post['service_tel'],
                'num'   => 99999,
                'address'   => $post['address'],
                'people'   => $post['people'],
                'price'   => $post['price'],
                'add_time'   => strtotime($post['add_time']),
                'stop_time' => strtotime($post['stop_time']),
                'picture'   => $picture,
                'detail_image'=>$detail_img,
                'info'=>$post['info'],
                //'directions'=>$post['directions'],
                'shop_name'=>$post['shop_name'],
                'notice'=>$post['notice'],
                // 'status'   => $post['status']
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


     /**
     * 上传图文图片
     * @return \think\response\Json
     */
    public function upload_image(){
        // $file = $request->file('file');
        $res = Upload::Image('file','pink/'.date('Ymd'));
        if(!$res->status) return Json::fail($res->error);
        return Json::successful('上传成功!',['url'=>$res->filePath]);
    }


     /**
     * 上传图片 190807
     */
    public function uploadAjax(Request $request){
		
		$file = $request->file('file');
	
        // 移动到框架应用根目录/uploads/ 目录下
        $info = $file->move( './uploads/');
        if($info){
            // 成功上传后 获取上传信息
            
            // $domain=$request->domain();
            // $file_path = $domain.config('view_replace_str')['__UPLOADS__'].str_replace("\\",'/',$info->getSaveName());

            $file_path = config('view_replace_str')['__UPLOADS__'].str_replace("\\",'/',$info->getSaveName());

            return json(['code' => 0, 'msg' => '上传成功!', 'url' => $file_path]);
        }else{
            // 上传失败获取错误信息
            return json(['code' => 1, 'msg' => $file->getError(), 'url' => '']);
        }

    }



        /**
     * s上传图片
     * */
    public function upload(){
        $res = Upload::image('file','pink/'.date('Ymd'));
        $thumbPath = Upload::thumb($res->dir);
        if($res->status == 200)
            return Json::successful('图片上传成功!',['name'=>$res->fileInfo->getSaveName(),'url'=>Upload::pathToUrl($thumbPath)]);
        else
            return Json::fail($res->error);
    }


     /**
     * 上传图片
     * @return \think\response\Json
     */
    public function upload1()
    {
        $res = Upload::image('file','store/product/'.date('Ymd'));
        $thumbPath = Upload::thumb($res->dir);
        //产品图片上传记录
        $fileInfo = $res->fileInfo->getinfo();
        SystemAttachment::attachmentAdd($res->fileInfo->getSaveName(),$fileInfo['size'],$fileInfo['type'],$res->dir,$thumbPath,1);
        if($res->status == 200)
            return Json::successful('图片上传成功!',['name'=>$res->fileInfo->getSaveName(),'url'=>Upload::pathToUrl($thumbPath)]);
        else
            return Json::fail($res->error);
    }




    /**
     * 图片管理上传图片
     * @return \think\response\Json
     */
    public function upload2()
    {
        $pid = input('pid')!= NULL ?input('pid'):session('pid');
        $res = Upload::image('file','attach'.DS.date('Y').DS.date('m').DS.date('d'));
        $thumbPath = Upload::thumb($res->dir);
        //产品图片上传记录
        $fileInfo = $res->fileInfo->getinfo();
        //入口是public需要替换图片路径
        if(strpos(PUBILC_PATH,'public') == false){
            $res->dir = str_replace('public/','',$res->dir);
        }
        SystemAttachmentModel::attachmentAdd($res->fileInfo->getSaveName(),$fileInfo['size'],$fileInfo['type'],$res->dir,$thumbPath,$pid);
        $info = array(
//            "originalName" => $fileInfo['name'],
//            "name" => $res->fileInfo->getSaveName(),
//            "url" => '.'.$res->dir,
//            "size" => $fileInfo['size'],
//            "type" => $fileInfo['type'],
//            "state" => "SUCCESS"
            'code' =>200,
            'msg'  =>'上传成功',
            'src'  =>$res->dir
        );
        echo json_encode($info);
    }


    
    /**
     * 上传图片
     * @param string $filename
     * @return \think\response\Json
     */
    public function upload3(Request $request)
    {
        $data = UtilService::postMore([['filename','']],$request);
        $res = UploadService::image($data['filename'],'store/comment');
        if($res->status == 200)
            return JsonService::successful('图片上传成功!',['name'=>$res->fileInfo->getSaveName(),'url'=>UploadService::pathToUrl($res->dir)]);
        else
            return JsonService::fail($res->error);
    }





}