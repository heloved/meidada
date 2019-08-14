{extend name="public/container"}
{block name="head_top"}
<script src="{__PLUG_PATH}city.js"></script>
<style>
    .layui-btn-xs{margin-left: 0px !important;}
    legend{
        width: auto;
        border: none;
        font-weight: 700 !important;
    }
    .site-demo-button{
        padding-bottom: 20px;
        padding-left: 10px;
    }
    .layui-form-label{
        width: auto;
    }
    .layui-input-block input{
        width: 50%;
        height: 34px;
    }
    .layui-form-item{
        margin-bottom: 10px;
    }
    .layui-input-block .time-w{
        width: 200px;
    }
    .layui-table-body{overflow-x: hidden;}
    .layui-btn-group button i{
        line-height: 30px;
        margin-right: 3px;
        vertical-align: bottom;
    }
    .back-f8{
        background-color: #F8F8F8;
    }
    .layui-input-block button{
        border: 1px solid #e5e5e5;
    }
    .avatar{width: 50px;height: 50px;}


    /* 多图上传 */
    .layui-upload-img { width: 90px; height: 90px; margin: 0; }
    .pic-more { width:100%; left; margin: 10px 0px 0px 0px;}
    .pic-more li { width:90px; float: left; margin-right: 8px;}
    .pic-more li .layui-input { display: initial; }
    .pic-more li a { position: absolute; top: 0; display: block; }
    .pic-more li a i { font-size: 24px; background-color: #008800; }    
    #slide-pc-priview .item_img img{ width: 90px; height: 90px;}
    #slide-pc-priview li{position: relative;}
    #slide-pc-priview li .operate{ color: #000; display: none;}
    #slide-pc-priview li .toleft{ position: absolute;top: 40px; left: 1px; cursor:pointer;}
    #slide-pc-priview li .toright{ position: absolute;top: 40px; right: 1px;cursor:pointer;}
    #slide-pc-priview li .close{position: absolute;top: 5px; right: 5px;cursor:pointer; color:red;font-size:26px;}
    #slide-pc-priview li:hover .operate{ display: block;}    
    /* 多图上传 */

    /* 详情图 start */
    #slide-detail-preview .item_img img{ width: 90px; height: 90px;}
    #slide-detail-preview li{position: relative;}
    #slide-detail-preview li .operate{ color: #000; display: none;}
    #slide-detail-preview li .toleft{ position: absolute;top: 40px; left: 1px; cursor:pointer;}
    #slide-detail-preview li .toright{ position: absolute;top: 40px; right: 1px;cursor:pointer;}
    #slide-detail-preview li .close{position: absolute;top: 5px; right: 5px;cursor:pointer; color:red;font-size:26px;}
    #slide-detail-preview li:hover .operate{ display: block;}    
    /* 详情图 END */




</style>



{/block}
{block name="content"}
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            
            <div class="ibox-title">
                <h5>编辑拼团活动</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>

            <div class="ibox-content" style="display: block;">
                
                <form class="layui-form">

                    <div class="layui-form-item">
                        <label class="layui-form-label">拼团名称: </label>
                        <div class="layui-input-block">
                            <input type="text" name="pname" lay-verify="required" value="{$info.pname}" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">拼团开始时间: </label>
                        <div class="layui-input-block">
                            <input type="text" name="add_time" id="start_time" lay-verify="required" value="{$info.add_time}" autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">拼团结束时间: </label>
                        <div class="layui-input-block">
                            <input type="text" name="stop_time" id="end_time" lay-verify="required" value="{$info.stop_time}" autocomplete="off" class="layui-input" readonly>
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">拼团人数: </label>
                        <div class="layui-input-block">
                            <input type="text" name="people" lay-verify="required" value="{$info.people}" class="layui-input">
                        </div>
                    </div>
                    
                    <div class="layui-form-item">
                        <label class="layui-form-label">拼团价格: </label>
                        <div class="layui-input-block">
                            <input type="text" name="price" lay-verify="required" value="{$info.price}" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item" id="pics">
                        <div class="layui-form-label">拼团页面顶部图: </div>
                        <div class="layui-input-block" style="width: 70%;">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn layui-btn-sm pull-left" id="slide-pc" style="background-color:#009688">选择多图</button><br/>
                                <div class="pic-more">
                                    <ul class="pic-more-upload-list" id="slide-pc-priview">
                                        {notempty name="$info.top_img"}
                                        {volist name="$info.top_img" id="vo"}

                                        <li class="item_img">
                                            <div class="operate">
                                                <i class="close layui-icon"></i>
                                            </div>
                                            <img src="{$vo}" class="img" >
                                            <input type="hidden" name="picture[]" value="{$vo}" />
                                        </li>

                                        {/volist}
                                        {/notempty}
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="layui-form-item">
                        <label class="layui-form-label">服务详情: </label>
                        <div class="layui-input-block">
                            <!-- <input type="text" name="info" lay-verify="required" value="{$info.info}" class="layui-input"> -->
                            <textarea name="info" placeholder="请输入内容" class="layui-textarea" lay-verify="required">{$info.info}</textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-form-label"></div>
                        <div class="layui-input-block" style="width: 70%;">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn layui-btn-sm pull-left" id="slide-detail" style="background-color:#009688">选择多图</button><br/>
                                <div class="pic-more">
                                    <ul class="pic-more-upload-list" id="slide-detail-preview">
                                    {notempty name="$info.detail_img"}
                                        {volist name="$info.detail_img" id="vo"}

                                        <li class="item_img">
                                            <div class="operate">
                                                <i class="close layui-icon"></i>
                                            </div>
                                            <img src="{$vo}" class="img" >
                                            <input type="hidden" name="detail_image[]" value="{$vo}" />
                                        </li>

                                        {/volist}
                                        {/notempty}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">美容院名称: </label>
                        <div class="layui-input-block">
                            <input type="text" name="shop_name" lay-verify="required" value="{$info.shop_name}" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">地址位置: </label>
                        <div class="layui-input-block">
                            <input type="text" name="address" lay-verify="required" value="{$info.address}" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">客服电话: </label>
                        <div class="layui-input-block">
                            <input type="text" name="service_tel" lay-verify="required" value="{$info.service_tel}" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">参团须知: </label>
                        <div class="layui-input-block">
                            <!-- <input type="text" name="notice" lay-verify="required" value="{$info.notice}" class="layui-input"> -->
                            <textarea name="notice" placeholder="请输入内容" class="layui-textarea" lay-verify="required">{$info.notice}</textarea>
                        </div>
                    </div>


                    <input type="hidden" name="id" value="{$info.id}">
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="" lay-filter="submit">
                                <i class="layui-icon layui-icon-auz"></i>提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

                   
<script src="{__ADMIN_PATH}js/layuiList.js"></script>
<script src="{__FRAME_PATH}js/content.min.js?v=1.0.0"></script>
{/block}
{block name="script"}
<script>

    layList.date({elem:'#start_time',theme:'#393D49',type:'datetime'});
    layList.date({elem:'#end_time',theme:'#393D49',type:'datetime'});

    layList.search('submit',function(where){
        
        layList.basePost(layList.Url({a:'save'}),where,function (res) {
            layList.msg(res.msg);
            parent.$(".J_iframe:visible")[0].contentWindow.location.reload();
            setTimeout(function (e) {
                parent.layer.close(parent.layer.getFrameIndex(window.name));
            },800)

        },function(err){
            layList.msg(err.msg);
        });
    });

    var action={
        refresh:function () {
            layList.reload();
        }
    };



    // 图片上传 start
    layui.use('upload', function(){
        var $ = layui.jquery;
        var upload = layui.upload;            
        
        upload.render({
            elem: '#slide-pc',
            url: '{:url('admin/pink.pink/upload_image')}',
            //size: 500,
            exts: 'jpg|png|jpeg',
            multiple: true,
            before: function(obj) {
                layer.msg('图片上传中...', {
                    icon: 16,
                    shade: 0.01,
                    time: 0
                })
            },
            done: function(res) {
                layer.close(layer.msg());//关闭上传提示窗口
                if(res.code != 200) {
                    return layer.msg(res.msg);
                }
                var html = '';
                    html +='<li class="item_img">';
                    
                        html +='<div class="operate">';
                            // html += '<i class="toleft layui-icon"></i>';
                            // html += '<i class="toright layui-icon"></i>';
                            html += '<i class="close layui-icon"></i>';
                        html += '</div>';
                        html += '<img src="' + res.data.url + '" class="img" >';
                        // html += '<img src="__STATIC__/../' + res.data.url + '" class="img" >';
                        html += '<input type="hidden" name="picture[]" value="' + res.data.url + '" />';
                    
                    html +='</li>';
                
                $('#slide-pc-priview').append(html);

                    
                //$('#slide-pc-priview').append('<input type="hidden" name="pc_src[]" value="' + res.filepath + '" />');
                
                // $('#slide-pc-priview').append('<li class="item_img"><div class="operate"><i class="toleft layui-icon"></i><i class="toright layui-icon"></i><i  class="close layui-icon"></i></div><img src="__STATIC__/../' + res.filepath + '" class="img" ><input type="hidden" name="pc_src[]" value="' + res.filepath + '" /></li>');
            }
        });



        // 上传详情图 begin
        upload.render({
            elem: '#slide-detail',
            url: '{:url('admin/pink.pink/upload_image')}',
            //size: 500,
            exts: 'jpg|png|jpeg',
            multiple: true,
            before: function(obj) {
                layer.msg('图片上传中...', {
                    icon: 16,
                    shade: 0.01,
                    time: 0
                })
            },
            done: function(res) {
                layer.close(layer.msg());//关闭上传提示窗口
                if(res.code != 200) {
                    return layer.msg(res.msg);
                }
                var html = '';
                    html +='<li class="item_img">';
                    
                        html +='<div class="operate">';
                            // html += '<i class="toleft layui-icon"></i>';
                            // html += '<i class="toright layui-icon"></i>';
                            html += '<i class="close layui-icon layui-icon-delete"></i>';
                        html += '</div>';
                        html += '<img src="' + res.data.url + '" class="img" >';
                        // html += '<img src="__STATIC__/../' + res.data.url + '" class="img" >';
                        html += '<input type="hidden" name="detail_image[]" value="' + res.data.url + '" />';
                    
                    html +='</li>';
                
                $('#slide-detail-preview').append(html);

                //$('#slide-pc-priview').append('<input type="hidden" name="pc_src[]" value="' + res.filepath + '" />');
                
                // $('#slide-pc-priview').append('<li class="item_img"><div class="operate"><i class="toleft layui-icon"></i><i class="toright layui-icon"></i><i  class="close layui-icon"></i></div><img src="__STATIC__/../' + res.filepath + '" class="img" ><input type="hidden" name="pc_src[]" value="' + res.filepath + '" /></li>');
            }
        });
        // 上传详情图 end


    });

    //点击多图上传的X,删除当前的图片    
    $("body").on("click",".close",function(){
        $(this).closest("li").remove();
    });
    //多图上传点击<>左右移动图片
    $("body").on("click",".pic-more ul li .toleft",function(){
        var li_index=$(this).closest("li").index();
        if(li_index>=1){
            $(this).closest("li").insertBefore($(this).closest("ul").find("li").eq(Number(li_index)-1));
        }
    });
    $("body").on("click",".pic-more ul li .toright",function(){
        var li_index=$(this).closest("li").index();
        $(this).closest("li").insertAfter($(this).closest("ul").find("li").eq(Number(li_index)+1));
    });
   
    // 图片上传 end



</script>
{/block}
