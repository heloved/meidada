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
        margin-bottom: 0;
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
                <h5>拼团列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
             
                <form class="layui-form" style="margin-top:20px;">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">拼团名称：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="pname" lay-verify="pname" style="width: 100%" autocomplete="off" placeholder="请输入拼团名称" class="layui-input">
                            </div>
                        </div>
                        <!-- <div class="layui-inline">
                            <label class="layui-form-label">账号：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="account" lay-verify="account" style="width: 100%" autocomplete="off" placeholder="请输入商户账号" class="layui-input">
                            </div>
                        </div> -->
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="" lay-filter="search" >
                                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>搜索</button>
                        </label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox">
            <div class="ibox-content">
                <div class="table-responsive">
                    <div class="layui-btn-group conrelTable">
                                           <!--   <button class="layui-btn layui-btn-sm layui-btn-danger" type="button" data-type="set_status_f"><i class="fa fa-ban"></i>封禁</button>-->
                        <!--                        <button class="layui-btn layui-btn-sm layui-btn-normal" type="button" data-type="set_status_j"><i class="fa fa-check-circle-o"></i>解封</button>-->
                        <!--<button class="layui-btn layui-btn-sm layui-btn-normal" type="button" data-type="set_grant"><i class="fa fa-check-circle-o"></i>发送优惠券</button>-->
                        <!--                        <button class="layui-btn layui-btn-sm layui-btn-normal" type="button" data-type="set_custom"><i class="fa fa-check-circle-o"></i>发送客服图文消息</button>-->
                        <!--                        <button class="layui-btn layui-btn-sm layui-btn-normal" type="button" data-type="set_template"><i class="fa fa-check-circle-o"></i>发送模板消息</button>-->
                        <!--<button class="layui-btn layui-btn-sm layui-btn-normal" type="button" data-type="set_info"><i class="fa fa-check-circle-o"></i>发送站内消息</button>-->
                        <!-- <button class="layui-btn layui-btn-sm layui-btn-normal" type="button" data-type="set_add"><i class="fa fa-check-circle-o"></i>新增</button> -->
                        <!-- <button class="layui-btn layui-btn-sm" onclick="$eb.createModalFrame(this.innerText,'{:Url('create')}',{h:700,w:1100})">添加产品</button> -->
                        <button class="layui-btn layui-btn-sm layui-btn-normal" type="button" data-type="refresh"><i class="layui-icon layui-icon-refresh" ></i>刷新</button>
                    </div>
                    <table class="layui-hide" id="pinkList" lay-filter="pinkList">

                    </table>


                    <script type="text/html" id="detailData">
                        <span style="color:#01AAED;cursor:pointer;" lay-event="detail">拼团详情</span>
                    </script>


                    <!-- <script type="text/html" id="user_type">
                        <button type="button" class="layui-btn layui-btn-normal layui-btn-radius layui-btn-xs">{{d.user_type}}</button>
                    </script>
                    <script type="text/html" id="checkboxstatus">
                        <input type='checkbox' name='status' lay-skin='switch' value="{{d.uid}}" lay-filter='status' lay-text='正常|禁止'  {{ d.status == 1 ? 'checked' : '' }}>
                    </script> -->
                    
                    <script type="text/html" id="posterData">
                        <a href="#">下载{{ d.poster}}</a>
                    </script>

                    <!-- <script type="text/html" id="statusData">
                        {{#  if(d.status == 0){  }}
                        已启用
                        {{#  }else{   }}
                        已禁用
                        {{#  }  }}
                    </script> -->


                    <script type="text/html" id="handle">

                        <button type="button" class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</button>

                        {{#  if(d.status == 1){  }}
                            <button type="button" class="layui-btn layui-btn-xs" lay-event="stop" style="background-color:#FFB800">
                                <i class="layui-icon layui-icon-face-cry"></i>停用
                            </button>
                        {{#  }else if(d.status ==2) {   }}
                            <!-- <button type="button" class="layui-btn layui-btn-xs" lay-event="pass"><i class="layui-icon layui-icon-ok"></i>启用</button> -->
                        {{#  }else if(d.status ==-1){ }}
                            <!-- <button type="button" class="layui-btn layui-btn-xs layui-btn-disabled" ><i class="layui-icon layui-icon-ok"></i>未通过</button> -->
                        {{#  }  }}

                        <button type="button" class="layui-btn layui-btn-xs" lay-event="del" style="background-color:#FF5722">
                            <i class="layui-icon layui-icon-delete"></i>删除
                        </button>

                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{__ADMIN_PATH}js/layuiList.js"></script>
<script src="{__FRAME_PATH}js/content.min.js?v=1.0.0"></script>
{/block}
{block name="script"}
<script>
    $('#province-div').hide();
    $('#city-div').hide();
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
    layList.tableList('pinkList',"{:Url('pink.pink/get_pink_lst')}",function () {
        return [
            // {type:'checkbox'},
            {field: 'id', title: '序号', width:'6%',event:'id'},
            {field: 'create_time', title: '创建时间', width:'12%', },
            {field: 'pname', title: '活动名称', width:'15%',},
            {field: 'shop_name', title: '店名',align:'center',width:'15%'},
            {field: 'account', title: '账号',align:'center',width:'10%'},
            {field: 'ping_detail', title: '拼团记录',align:'center',width:'8%', toolbar:'#detailData'},
            {field: 'status', title: '单号',align:'center',width:'8%'},
            {field: 'poster', title: '海报', width: '10%', align: 'center', toolbar: '#posterData'},
            {fixed: 'right', title: '操作', width: '15%', align: 'center', toolbar: '#handle'}

        ];
    });
    //layList.date('add_time');
    //监听并执行 id 的排序
    layList.sort(function (obj) {
        var layEvent = obj.field;
        var type = obj.type;
        switch (layEvent){
            case 'id':
                layList.reload({order: layList.order(type,'u.id')},true,null,obj);
                break;
     /*       case 'now_money':
                layList.reload({order: layList.order(type,'u.now_money')},true,null,obj);
                break;
            case 'integral':
                layList.reload({order: layList.order(type,'u.integral')},true,null,obj);
                break;*/
        }
    });
    //监听并执行 id 的排序
    layList.tool(function (event,data) {
        var layEvent = event;
        console.log(data);
        switch (layEvent){
            case 'edit':
                $eb.createModalFrame('编辑',layList.Url({c:'pink.pink',a:'edit',p:{id:data.id}}));
                break;
            case 'stop':
                // $eb.createModalFrame('停用',layList.Url({a:'see',p:{id:data.id}}));
                layList.basePost(layList.Url({c:'pink.pink',a:'set_status'}),{id:data.id,status:2},function (res) {
                    layList.msg(res.msg);
                    layList.reload();
                });
                break;
            case 'del':
                // $eb.createModalFrame('删除',layList.Url({a:'del',p:{id:data.id}}));
                layList.basePost(layList.Url({a:'set_status'}),{id:data.id,status:3},function (res) {
                    layList.msg(res.msg);
                    layList.reload();
                });
                break;
            case 'detail':
                $eb.createModalFrame('拼团详情',layList.Url({a:'getInfo',p:{pid:data.id}}));
                break;
        }
    });
    //    layList.sort('uid');
    //监听并执行 now_money 的排序
    // layList.sort('now_money');
    //监听 checkbox 的状态
    layList.switch('status',function (odj,value,name) {
        if(odj.elem.checked==true){
            layList.baseGet(layList.Url({a:'set_status',p:{status:1,uid:value}}),function (res) {
                layList.msg(res.msg);
            });
        }else{
            layList.baseGet(layList.Url({a:'set_status',p:{status:0,uid:value}}),function (res) {
                layList.msg(res.msg);
            });
        }
    });
    layList.search('search',function(where){
        if(where['user_time_type'] != '' && where['user_time'] == '') return layList.msg('请选择选择时间');
        if(where['user_time_type'] == '' && where['user_time'] != '') return layList.msg('请选择访问情况');
        layList.reload(where);
    });

    var action={
        set_add: function(){
            $eb.createModalFrame('新增商户','{:Url("admin/merchant.merchant/add")}');
        },

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
