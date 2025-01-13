
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="/layui/css/layui.css" rel="stylesheet">
<body class="layui-padding-3">

<style>
    .admin-login-container{width: 320px; margin: 21px auto 0;}
    .admin-login-other .layui-icon{position: relative; display: inline-block; margin: 0 2px; top: 2px; font-size: 26px;}
</style>

<div class="admin-login-container">
    <form class="layui-form">
        <div class="admin-login-container">
            <div class="layui-form-item">
                <div class="layui-input-wrap">
                    <div class="layui-input-prefix">
                        <i class="layui-icon layui-icon-username"></i>
                    </div>
                    <input type="text" name="username" value="" lay-verify="required" placeholder="用户名" lay-reqtext="请填写用户名" autocomplete="off" class="layui-input" lay-affix="clear">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-wrap">
                    <div class="layui-input-prefix">
                        <i class="layui-icon layui-icon-password"></i>
                    </div>
                    <input type="password" name="password" value="" lay-verify="required" placeholder="密   码" lay-reqtext="请填写密码" autocomplete="off" class="layui-input" lay-affix="eye">
                </div>
            </div>
            <div class="layui-form-item">
                <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="admin-login">登录</button>
            </div>

        </div>
    </form>
</div>

<!-- 请勿在项目正式环境中引用该 layui.js 地址 -->
<script src="/layui/layui.js"></script>
<script src="/resources/static/jquery-3.6.0.min.js"></script>
<script>
    layui.use(function(){
        var form = layui.form;
        var layer = layui.layer;
        // 提交事件
        form.on('submit(admin-login)', function(data){
            var field = data.field; // 获取表单字段值
            // 显示填写结果，仅作演示用
                console.log(field)
                $.ajax({
                    url:"/admin/login",
                    type:"post",
                    data:field,
                    success:function (data) {
                        console.log(data);
                        data = JSON.parse(data);
                        if (data.code == 0){
                            layer.msg(data.msg,{icon:1,time:1000},function () {
                                window.location.href="/admin/index";
                            });
                        }else {
                            layer.msg(data.msg,{icon:2,time:1000});
                        }
                   }
                })
                return false; // 阻止默认 form 跳转
            })
        });
</script>

</body>
</html>
