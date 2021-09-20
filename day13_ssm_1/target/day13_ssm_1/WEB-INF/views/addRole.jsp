<%--
  Created by IntelliJ IDEA.
  User: wen
  Date: 2020/6/3
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${PATH}/statics/layui/css/layui.css" media="all">
    <script src="${PATH}/statics/layui/layui.js"></script>
    <script src="${PATH}/statics/js/jquery-3.3.1.min.js"></script>

    <script>
        layui.use([ 'element', 'form' ], function () {
            var element = layui.element;
            var form = layui.form;


            //监听提交
            form.on('submit(formDemo)', function (data) {

                //layer.msg(JSON.stringify(data.field));//data.field代表全部表单字段，名值对形式：{name: value}
                $.post("${PATH}/role/addRole", data.field, function(d) {
                    if (d == true) {
                        //弹出消息3秒以后，会执行回调函数
                        layer.msg("添加成功",{time:1000}, function() {
                            window.location.href = "${PATH}/role/forwardPages/listRole";
                        });
                    } else {
                        layer.msg("添加失败");
                    }
                }, "json");
                return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。

            });

        });
    </script>

</head>

<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">

    <jsp:include page="../models/head.jsp"/>

    <jsp:include page="../models/left.jsp"/>

    <div class="layui-body">
        <div style="padding: 15px;">
            <form class="layui-form" action="">

                <div class="layui-form-item">
                    <label class="layui-form-label">角色名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name"  required lay-verify="required"
                               placeholder="请输入name"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" id="submit" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>

        </div>
    </div>

    <jsp:include page="../models/foot.jsp"/>

</div>

</body>

</html>
