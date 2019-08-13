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
</style>
{/block}
{block name="content"}
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            
            <div class="ibox-title">
                <h5>编辑商户</h5>
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
                            <input type="text" name="add_time" lay-verify="required" value="{$info.add_time}" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">拼团结束时间: </label>
                        <div class="layui-input-block">
                            <input type="text" name="account" lay-verify="required" value="{$info.stop_time}" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">拼团页面顶部图: </label>
                        <div class="layui-input-block">
                            <input type="text" name="account" lay-verify="required" value="{$info.stop_time}" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">服务详情: </label>
                        <div class="layui-input-block">
                            <input type="text" name="info" lay-verify="required" value="{$info.info}" class="layui-input">
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
                            <input type="text" name="notice" lay-verify="required" value="{$info.notice}" class="layui-input">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">地　　区：</label>
                            <div class="layui-input-inline" style="margin-left:34px;">
                                <select name="country" lay-verify="country" lay-filter='country'>
                                    <option value="">请选择国</option>
                                    <option value="domestic" selected="selected">中国</option>
                                    <!-- <option value="abroad">外国</option> -->
                                </select>
                            </div>
                        </div>
                    </div>
                       
                    <div class="layui-form-item">   
                        <div class="layui-inline" id="province-div">
                            <label class="layui-form-label">省　　份：</label>
                            <div class="layui-input-inline" style="margin-left:34px;">
                                <select name="province" lay-verify="required|province" lay-filter='province' id="province">
                                    <option value="{$info.province}" id="province-top" selected="selected">{$info.province}</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline" id="city-div">
                            <label class="layui-form-label">市　　区：</label>
                            <div class="layui-input-inline" >
                                <select name="city" lay-verify="required|city"  lay-filter='city' id="city">
                                    <option value="{$info.city}" id="city-top" selected="selected">{$info.city}</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">详细地址: </label>
                        <div class="layui-input-block">
                            <input type="text" name="address" lay-verify="required" value="{$info.address}" class="layui-input">
                        </div>
                    </div>
                    <input type="hidden" name="id" value="{$info.id}">
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="" lay-filter="submit">
                                <i class="layui-icon layui-icon-auz layuiadmin-button-btn"></i>提交</button>
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
    // $('#province-div').hide();
    // $('#city-div').hide();
    layList.select('country',function (odj,value,name) {
        var html = '';
        $.each(city,function (index,item) {
            html += '<option value="'+item.label+'">'+item.label+'</option>';
        })
        if(odj.value == 'domestic'){
            $('#province-div').show();
            $('#city-div').show();
            $('#province-top').siblings().remove();
            $('#province-top').after(html);
            $('#province').val('');
            layList.form.render('select');
        }else{
            $('#province-div').hide();
            $('#city-div').hide();
        }
        $('#province').val('');
        $('#city').val('');
    });
    layList.select('province',function (odj,value,name) {
        var html = '';
        $.each(city,function (index,item) {
            if(item.label == odj.value){
                $.each(item.children,function (indexe,iteme) {
                    html += '<option value="'+iteme.label+'">'+iteme.label+'</option>';
                })
                $('#city').val('');
                $('#city-top').siblings().remove();
                $('#city-top').after(html);
                layList.form.render('select');
            }
        })
    });
    layList.form.render();
 
    layList.search('submit',function(where){

        var len = Object.keys(where).length;
        
        if(len){
            layList.basePost(layList.Url({a:'save'}),where,function (res) {
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                 
                if(res.code == 200){
                    layList.msg(res.msg);
                    setTimeout(function () {
                        parent.layer.close(index); //再执行关闭    
                    },1000);
                }else{
                    layList.msg(res.msg);
                }
            });
        }else{
            layList.msg('请完善信息后再提交');
        }



      
    });

    var action={
       
        set_status_f:function () {
           var ids=layList.getCheckData().getIds('uid');
           if(ids.length){
               layList.basePost(layList.Url({a:'set_status',p:{is_echo:1,status:0}}),{uids:ids},function (res) {
                   layList.msg(res.msg);
                   layList.reload();
               });
           }else{
               layList.msg('请选择要封禁的会员');
           }
        },
        set_status_j:function () {
            
        },
        set_grant:function () {
            var ids=layList.getCheckData().getIds('uid');
            if(ids.length){
                var str = ids.join(',');
                $eb.createModalFrame('发送优惠券',layList.Url({c:'ump.store_coupon',a:'grant',p:{id:str}}),{'w':800});
            }else{
                layList.msg('请选择要发送优惠券的会员');
            }
        },
        set_template:function () {
            var ids=layList.getCheckData().getIds('uid');
            if(ids.length){
                var str = ids.join(',');
            }else{
                layList.msg('请选择要发送模板消息的会员');
            }
        },
        set_info:function () {
            var ids=layList.getCheckData().getIds('uid');
            if(ids.length){
                var str = ids.join(',');
                $eb.createModalFrame('发送站内信息',layList.Url({c:'user.user_notice',a:'notice',p:{id:str}}),{'w':1200});
            }else{
                layList.msg('请选择要发送站内信息的会员');
            }
        },
        set_custom:function () {
            var ids=layList.getCheckData().getIds('uid');
            if(ids.length){
                var str = ids.join(',');
                $eb.createModalFrame('发送客服图文消息',layList.Url({c:'wechat.wechat_news_category',a:'send_news',p:{id:str}}),{'w':1200});
            }else{
                layList.msg('请选择要发送客服图文消息的会员');
            }
        },
        refresh:function () {
            layList.reload();
        }
    };
    $('.conrelTable').find('button').each(function () {
        var type=$(this).data('type');
        $(this).on('click',function () {
            action[type] && action[type]();
        })
    })
    $(document).on('click',".open_image",function (e) {
        var image = $(this).data('image');
        $eb.openImage(image);
    })
</script>
{/block}
