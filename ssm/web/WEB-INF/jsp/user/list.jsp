<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/layui/css/layui.css" rel="stylesheet">



<script type="text/html" id="toolBar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">新增</button>
        <button class="layui-btn layui-btn-sm" lay-event="delete">刪除</button>
    </div>
</script>
<!-- 搜索框和按钮 -->
<div class="layui-form" id="id_user_table_search">
    <div class="layui-inline">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="ds_username"  autocomplete="off" class="layui-input">
        </div>
        <button class="layui-btn" id="searchBtn">搜索</button>
    </div>
</div>
<%--表格操作區域--%>
<script type="text/html" id="table_operation">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<table class="layui-hide" id="userList"></table>

<%--表單提交--%>
<div id="userInfoDiv" style="display: none;justify-content: flex-start;align-items: center">
    <form class="layui-form" style="width: 90%" id="userInfoForm">
        <div class="layui-form-item">
            <input type="text" hidden="hidden" name="cd_user">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="ds_username" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="email" name="ds_email" required lay-verify="email" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="userInfoSubmit">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>


<script>

    //文档加载完成后，将搜索框移动到表格上方
    $(function (){
        $("#martin-table-search-area").empty();
        $('#id_user_table_search').detach().appendTo($("#martin-table-search-area"));
    })

    function getWorkArea(){
        var workarea = $('.layui-body').height() - $('#content-filter').height()
        return workarea
    }

    layui.use(['table','layer','form'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        // 已知数据渲染
        var user_table = table.render({
            elem: '#userList',
            url: '/user/list',
            height: getWorkArea(),
            toolbar: '#toolBar',
            request: {
                pageName: 'pageNum', // 页码的参数名称，默认：page
                limitName: 'pageSize' // 每页数据条数的参数名，默认：limit
            },
            parseData: function(res){ // res 即为原始返回的数据
                console.log(res);
                return {
                    "code": res.code, // 解析接口状态
                    "msg": res.msg, // 解析提示文本
                    "count": res.data.total, // 解析数据长度
                    "data": res.data.list // 解析数据列表
                };
            },
            cols: [[ //标题栏
                {type: 'checkbox', fixed: 'left'},
                {field: 'cd_user', title: 'ID', width: 80, sort: true},
                {field: 'ds_username', title: '用户', width: 120},
                {field: 'ds_email', title: '邮箱', minWidth: 160},
                {field: 'nr_checkin', title: '登录次数', width: 80, sort: true},
                {field: 'dt_record', title: '用户创建时间', width: 80},
                {title: 'Operation', width: 150, toolbar: '#table_operation'}
            ]],
            page: true, // 是否显示分页
            limits: [20, 30, 40,50],
            limit: 20 // 每页默认显示的数量
        });


        form.on('submit(userInfoSubmit)',function (data){
            $.ajax({
                url: '/user',
                contentType: "application/json",
                type: $('#userInfoForm input[name="cd_user"]').val() ? 'PUT' : 'POST', //新增
                data: JSON.stringify({
                    cd_user: parseInt($('#userInfoForm input[name="cd_user"]').val()),
                    ds_username: $('#userInfoForm input[name="ds_username"]').val(),
                    ds_email: $('#userInfoForm input[name="ds_email"]').val()
                }),
                success: function(res){
                    res = JSON.parse(res)
                    if(res.code == 0){
                        layer.msg('新增成功');
                        if (window.layerIndex){
                            layer.close(window.layerIndex)
                        }
                        user_table.reload()
                    } else {
                        layer.msg('新增失败');
                    }
                }
            });

            return false;

        })

        table.on('toolbar(userList)', function(obj){
            var id = obj.config.id;
            var checkStatus = table.checkStatus(id);
            switch(obj.event){
                case 'delete':
                    var data = checkStatus.data;
                    if (data.length == 0){
                        layer.msg('请选择要删除的数据');
                        return;
                    }
                    /*刪除邏輯*/
                    $.ajax({
                        url: '/user/deleteUsers',
                        type: 'DELETE',
                        data: {
                            ids: data.map(item => item.cd_user).join(',')
                        },
                        success: function(res){
                            if(res.code === 0){
                                layer.msg('删除成功');
                                user_table.reload();
                            } else {
                                layer.msg('删除失败');
                            }
                        }
                    });
                    break;
                case 'add':
                    layer.open({
                        type: 1,
                        title: '新增用户',
                        shadeClose: true,
                        shade: 0.8,
                        width: '500px',
                        area: ['500px', 'auto'],
                        content: $('#userInfoDiv') ,// 新增页面地址
                        success: function (layero, index) {
                            window.layerIndex = index;
                            // 清空表单数据
                            $('#userInfoDiv').css('display','flex')
                            $('#userInfoForm')[0].reset()
                        },
                        closeBtn: function () {
                            layer.close(window.layerIndex)
                            // 关闭弹出层后可以执行其他操作
                            $('#userInfoDiv').hide()
                        }
                    });

                    break;
            };
        });

        table.on('tool(userList)', function(obj){
            var data = obj.data; // 获取当前行数据
            console.log(data)
            if(obj.event === 'edit'){
                // 编辑操作
                layer.open({
                    type: 1,
                    title: '编辑用户',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['500px', 'auto'],
                    content: $('#userInfoDiv'), // 编辑页面地址
                    success: function (layero, index) {
                        window.layerIndex = index;
                        $('#userInfoForm')[0].reset()
                        $('#userInfoDiv').css('display','flex')
                        $('input[name="cd_user"]').val(data.cd_user)
                        $('input[name="ds_username"]').val(data.ds_username)
                        $('input[name="ds_email"]').val(data.ds_email)
                    },
                    closeBtn: function () {
                        layer.close(window.layerIndex)
                        // 关闭弹出层后可以执行其他操作
                        $('#userInfoDiv').hide()
                    }
                });
            } else if(obj.event === 'del'){
                // 删除操作
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url: '/user/'+data.cd_user,
                        type: 'DELETE',
                        success: function(res){
                            res = JSON.parse(res)
                            if(res.code === 0){
                                layer.msg('删除成功');
                                obj.del(); // 删除对应行（tr）的DOM结构
                                user_table.reload()
                            } else {
                                layer.msg('删除失败');
                            }
                        }
                    });
                    layer.close(index);
                });
            }
        });

        $(window).on('resize',function (){
            console.log(user_table);
            user_table.reload({
                height: getWorkArea()
            })
        })

        $('#searchBtn').click(function () {
            user_table.reload({
                where: { // 设定异步数据接口的额外参数
                    ds_username: $('input[name="ds_username"]').val(),
                    ds_email: $('input[name="ds_email"]').val()
                }
            });
        });

    });
</script>
