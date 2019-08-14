{extend name="public/container"}
{block name="head_top"}
<!-- 全局js -->
<script src="{__PLUG_PATH}echarts/echarts.common.min.js"></script>
<script src="{__PLUG_PATH}echarts/theme/macarons.js"></script>
<script src="{__PLUG_PATH}echarts/theme/westeros.js"></script>
{/block}
{block name="head"}
<style>
    .layui-fluid {
        padding: 15px;
    }
    .layadmin-tips {
        margin-top: 30px;
        text-align: center;
    }
    /* .layadmin-tips .layui-icon[face] {
        display: inline-block;
        font-size: 300px;
        color: #393D49;
    } */
    .layadmin-tips .layui-icon-face-smile {
        display: inline-block;
        font-size: 300px;
        /* color: #393D49; */
        /* color: #1E9FFF; */
        color: #FF5722;
    }

    .layadmin-tips .layui-text {
        width: 588px;
        margin: 30px auto;
        line-height: 22px;
        padding-top: 20px;
        border-top: 5px solid #009688;
        font-size: 16px;
    }
    .layadmin-tips h1 {
        font-size: 100px;
        line-height: 100px;
        color: #009688;
    }
    .layadmin-tips .layui-text .layui-anim {
        display: inline-block;
    }
</style>

{/block}
{block name="content"}


<body layadmin-themealias="default">


<div class="layui-fluid">
  <div class="layadmin-tips">
    <i class="layui-icon layui-icon-face-smile"></i>
    <div class="layui-text">
      <h1>
        <span class="layui-anim layui-anim-loop layui-anim-">m</span> 
        <span class="layui-anim layui-anim-loop layui-anim-">e</span> 
        <span class="layui-anim layui-anim-loop layui-anim-rotate">i</span> 
        <span class="layui-anim layui-anim-loop layui-anim-">d</span>
        <span class="layui-anim layui-anim-loop layui-anim-">a</span>
        <span class="layui-anim layui-anim-loop layui-anim-">d</span>
        <span class="layui-anim layui-anim-loop layui-anim-">a</span>
      </h1>
    </div>
  </div>
</div>

{/block}