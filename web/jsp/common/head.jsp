<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>导航栏</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">

</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/index.jsp">人力资源管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/findAllUser.action?page=1">系统管理</a></li>
                <li><a href="${pageContext.request.contextPath}/findAlldepartment.action?page=1">部门管理</a></li>
                <li><a href="${pageContext.request.contextPath}/findEmpByPage.action?page=1">员工管理</a></li>
                <li><a href="#">考勤管理</a></li>
                <li><a href="${pageContext.request.contextPath}/findAllPost.action?page=1">职位管理</a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="请输入要搜索的内容">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.nickName}<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li ><a id="editAccount" style="cursor: pointer"  data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span>  修改账号信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" id="logout"><span class="glyphicon glyphicon-off"></span>  退出系统</a></li>
                    </ul>

                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑账号信息</h4>
            </div>
            <div class="modal-body"><%--模态框的内容--%>
                <form id="form1"">
                <div class="form-group">
                    <label for="exampleInputEmail1">管理员编号</label>
                    <input type="text" id="userId" name="userId" class="form-control" id="exampleInputEmail2" placeholder="岗位编号" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">登录名</label>
                    <input type="text" id="userName" name="userName" class="form-control"placeholder="登录名">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">用户名</label>
                    <input type="text" id="nickName" name="nickName" class="form-control" id="exampleInputEmail1" placeholder="用户名">
                </div>
                <button type="button" class="btn btn-primary update_btn">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </form>
            </div>

        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>

<script>
    $(function () {
        $("#logout").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/toLogout.action",
                type:"get",
                success:function (data) {
                    if (data=='success'){
                        window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
                    }
                }
            });
        });

        $("#editAccount").click(function () {
           $.ajax({
               url:"${pageContext.request.contextPath}/editAccount.action",
               type:"get",
               success:function (user) {
                   $("#userId").val(user.userId);
                   $("#userName").val(user.userName);
                   $("#nickName").val(user.nickName);
               }
           });
        });

        $(".update_btn").click(function () {
            var userId = $("#userId").val();
            var userName = $("#userName").val();
            var nickName = $("#nickName").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/updateLocalUser.action",
                type:"post",
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify({"userId":userId,"userName":userName,"nickName":nickName}),
                success:function (data) {
                    if (data=='success'){

                    }else{
                        alert("保存失败！");
                    }
                }
            });
        })

    });
</script>

</body>
</html>
