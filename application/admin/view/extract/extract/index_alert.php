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
                        <th class="text-center" width="28%">店名</th>
                        <th class="text-center" width="10%">账号</th>
                        <th class="text-center" width="10%">银行卡</th>
                        <th class="text-center" width="10%">提现金额</th>
                        <th class="text-center" width="10%">提现时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    {volist name="lst" id="vo"}
                    <tr>
                        <td class="text-center">{$vo.id}</td>
                        <td class="text-center">{$vo.merchant_name}</td>
                        <td class="text-center">
                            <!-- <img src=""/> -->{$vo.account}
                        </td>
                        <td>{$vo.bank_code}</td>
                        <td class="text-center">
                            {$vo.extract_price}
                        </td>

                        <td class="text-center">
                            {$vo.add_time|date='Y-m-d',###}
                        </td>
                    </tr>
                    {/volist}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

{/block}

