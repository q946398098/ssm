<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/layui/css/layui.css" rel="stylesheet">


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


<table class="layui-hide" id="userList"></table>


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

    layui.use('table', function(){
        var table = layui.table;
        // 已知数据渲染
        var user_table = table.render({
            elem: '#userList',
            url: '/user/list',
            height: getWorkArea(),
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
                {field: 'cd_user', title: 'ID', width: 80, sort: true},
                {field: 'ds_username', title: '用户', width: 120},
                {field: 'ds_email', title: '邮箱', minWidth: 160},
                {field: 'nr_checkin', title: '登录次数', width: 80, sort: true},
                {field: 'dt_record', title: '用户创建时间', width: 80},
            ]],
            page: true, // 是否显示分页
            limits: [20, 30, 40,50],
            limit: 20 // 每页默认显示的数量
        });

        $(window).on('resize',function (){
            user_table.reload({
                height: getWorkArea()
            })
        })

        $('#searchBtn').click(function (){
            user_table.reload({
                where: { // 设定异步数据接口的额外参数
                    ds_username: $('input[name="ds_username"]').val(),
                    ds_email: $('input[name="ds_email"]').val()
                }
            });
        })
    });
</script>
