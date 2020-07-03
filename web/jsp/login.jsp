<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>人力资源管理系统登陆</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>

<div style="width:30%;margin: 130px auto"><h1>欢迎使用人力资源管理系统</h1></div>


<form class="form-horizontal" style="width: 30%;margin: 100px auto">
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">账号</label>
        <div class="col-sm-10">
            <input type="text" id="userName" class="form-control" id="inputEmail3" placeholder="账号">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-10">
            <input type="password" id="password" class="form-control" id="inputPassword3" placeholder="密码">
        </div>
    </div>
    <div class="form-group" style="margin: 0px auto;padding-left: 100px">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="button" class="btn btn-primary" id="submit1">登陆</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset" class="btn btn-default">重置</button>
        </div>
    </div>
</form>

<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>

<script>
    $(function () {
        $("#submit1").click(function () {
            var userName = $("#userName").val();
            var password = $("#password").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/toLogin.action",
                type:"post",
                data:JSON.stringify({"userName":userName,"password":password}),
                contentType:"application/json;charset=UTF-8",
                success:function (data) {
                    if (data=='success'){
                        window.location.href="${pageContext.request.contextPath}/jsp/index.jsp";
                    }else{
                        alert("用户名或密码错误！");
                    }
                }
            });
        });
    });
</script>



</body>
</html>
