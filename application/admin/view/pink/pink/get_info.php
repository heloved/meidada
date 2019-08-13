{extend name="public/container"}
{block name="head_top"}
<link href="{__ADMIN_PATH}module/wechat/news/css/index.css" type="text/css" rel="stylesheet">
{/block}
{block name="content"}
<style>
    tr td img{height: 80px;}
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox">
            <div class="ibox-title">
                <div style="margin-top: 2rem"></div>
            </div>
            <div class="ibox-content">
                <table class="footable table table-striped  table-bordered " data-page-size="20">
                    <thead>
                    <tr>
                        <th class="text-center" width="5%">序号</th>
                        <th class="text-center" width="28%">电话号码</th>
                        <th class="text-center" width="10%">状态</th>
                        <th class="text-center" width="10%">到店情况</th>
                        <th class="text-center" width="20%">核销码</th>
                    </tr>
                    </thead>
                    <tbody>
                    {volist name="list" id="vo"}
                    <tr>
                        <td class="text-center">{$vo.id}</td>
                        <td class="text-center">{$vo.phone}</td>
                        <td class="text-center"><!-- <img src=""/> -->{$vo.k_id} </td>
                        <td class="text-center"> {$vo.is_shop} </td>
                        <td class="text-center"> {$vo.code} </td>
                    </tr>
                    {/volist}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

{/block}

