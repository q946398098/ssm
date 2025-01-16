<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理</title>
</head>
<link href="/layui/css/layui.css" rel="stylesheet">
<script src="/resources/static/jquery-3.6.0.min.js"></script>
<style>
    .layui-layout-admin .layui-header .menu-title{
        line-height: 60px;
        position: absolute;
        top: 0;
        left: 200px;
        right: 220px;
        text-align: center;
        font-size: 14px;
        color: #fff;
    }
    #content-filter{
        height: 80px;
        border-bottom: 1px solid black;
    }
    #content-filter .content-filter-header{
        color: #fff;
        line-height: 28px;
        background-color: black;
    }
    #content-filter .content-filter-header p{
        text-indent: 14px;
        font-weight: bold;
    }
    #martin-table-search-area{
        height: calc(100% - 30px);
    }
</style>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">后台管理</div>
        <div class="menu-title"></div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-sm-inline-block">
                <a href="javascript:;">
                    <img src="//unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img">
                    tester
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">Your Profile</a></dd>
                    <dd><a href="javascript:;">Settings</a></dd>
                    <dd><a href="javascript:;">Sign out</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href='javascript:;'>人员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href='javascript:openPage("/user","人员列表");'>人员列表</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <div id="content-filter">
            <div class="content-filter-header">
                <p>Filter</p>
            </div>
            <div id="martin-table-search-area">

            </div>
        </div>
        <div id="content-body"></div>
    </div>
    <div class="layui-footer">
        <p style="text-align: center">2025</p>

    </div>
</div>

</body>
</html>
<script src="/layui/layui.js"></script>
<script>
    function openPage(url,title){
       $('#content-body').load(url)
       $('.layui-layout-admin .layui-header .menu-title').html(title)
    }
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element;
        var layer = layui.layer;
        var util = layui.util;
        var $ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            menuLeft: function(othis){ // 左侧菜单事件
                layer.msg('展开左侧菜单的操作', {icon: 0});
            },
            menuRight: function(){  // 右侧菜单事件
                layer.open({
                    type: 1,
                    title: '更多',
                    content: '<div style="padding: 15px;">处理右侧面板的操作</div>',
                    area: ['260px', '100%'],
                    offset: 'rt', // 右上角
                    anim: 'slideLeft', // 从右侧抽屉滑出
                    shadeClose: true,
                    scrollbar: false
                });
            }
        });
    });
</script>

