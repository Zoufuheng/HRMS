<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加管理员</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>

<%@include file="common/head.jsp"%>

<%@include file="common/user.jsp"%>

<ol class="breadcrumb" style="width: 30%;background-color: white">
    <li><a href="#">系统管理</a></li>
    <li class="active">添加管理员</li>
</ol>

<form id="form1" style="width: 30%;float: right;margin-right: 750px">
    <div class="form-group">
        <label for="exampleInputEmail1">登录名</label>
        <input type="text" id="userName" name="userName" class="form-control" id="exampleInputEmail1" placeholder="登录名">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail2">用户名</label>
        <input type="text" id="nickName" name="nickName" class="form-control" id="exampleInputEmail2" placeholder="用户名">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail3">密码</label>
        <input type="text" id="password" name="password" class="form-control" id="exampleInputEmail3" placeholder="密码">
    </div>
    <input type="button" id="submit1" class="btn btn-primary" value="新增">
    <input type="reset" class="btn btn-primary" value="重置">
</form>

<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>

<script>
    $(function () {
        $("#submit1").click(function () {
            var userName = $("#userName").val();
            var nickName = $("#nickName").val();
            var password = $("#password").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/insertUser.action",
                type:"Post",
                data:JSON.stringify({"userName":userName,"nickName":nickName,"password":password}),
                contentType:"application/json;charset=UTF-8",
                success:function(data){
                    if (data=='success'){
                        alert("新增成功！");
                        window.location.href="${pageContext.request.contextPath}/jsp/userInsert.jsp"
                    }else{
                        alert("新增失败！");
                    }
                }
            });
        });
    });

</script>

</body>
</html>
