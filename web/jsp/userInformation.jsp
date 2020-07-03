<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>管理员信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>

<%@include file="common/head.jsp"%>

<%@include file="common/user.jsp"%>

<ol class="breadcrumb" style="width: 30%;background-color: white">
    <li><a href="#">系统管理</a></li>
    <li class="active">管理员信息</li>
</ol>

<table class="table table-bordered table-hover" style="width: 80%;text-align: center">
    <tr>
        <th style="text-align: center">管理员编号</th>
        <th style="text-align: center">登录名</th>
        <th style="text-align: center">用户名</th>
        <th style="text-align: center">操作</th>
    </tr>
    <c:forEach items="${userList}" var="i">
        <tr>
            <td>${i.userId}</td>
            <td>${i.userName}</td>
            <td>${i.nickName}</td>
            <td style="text-align: center">
                <button type="button" class="btn btn-danger delete_btn">删除</button>
                    <%--<button type="button" class="btn btn-primary">编辑</button>--%>
                <button class="btn btn-primary edit_btn" data-toggle="modal" data-target="#myModal">编辑</button>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="4" style="text-align: center">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                    <c:choose>
                        <c:when test="${page==1}">
                            <li class="disabled">
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${pageContext.request.contextPath}/findAllUser.action?page=${page-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="item" varStatus="status" begin="0" end="${pageNum-1}">
                        <li><a href="${pageContext.request.contextPath}/findAllUser.action?page=${status.index+1}">${status.index+1}</a></li>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${page==pageNum}">
                            <li class="disabled">
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="${pageContext.request.contextPath}/findAllUser.action?page=${page+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            当前在第<span class="label label-default">${page}</span>页，一个有<span class="label label-default">${pageNum}</span>页，
            共<span class="label label-default">${userCount}</span>条记录
        </td>
    </tr>
</table>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑管理员信息</h4>
            </div>
            <div class="modal-body"><%--模态框的内容--%>
                <form id="form1">
                <div class="form-group">
                    <label for="exampleInputEmail1">管理员编号</label>
                    <input type="text" id="userId" name="userId" class="form-control" id="exampleInputEmail1" placeholder="管理员编号" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">登录名</label>
                    <input type="text" id="userName" name="userName" class="form-control" id="exampleInputEmail2" placeholder="登录名">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail3">用户名</label>
                    <input type="text" id="nickName" name="nickName" class="form-control" id="exampleInputEmail3" placeholder="用户名">
                </div>
                <button type="button" class="btn btn-primary update_btn">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </form>
            </div>
        </div>
    </div>
</div>




<script>

    $(function () {

        $(".delete_btn").click(function () {
            var userId = $(this).parent().parent().find("td:eq(0)").text();
            var nickName = $(this).parent().parent().find("td:eq(2)").text();
            if (confirm("确定要删除【"+nickName+"】吗？")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/deleteUser.action",
                    type:"get",
                    data:{"userId":userId},
                    success:function (data) {
                        if (data =='success'){
                            alert("删除成功！");
                            window.location.href="${pageContext.request.contextPath}/findAllUser.action?page=${page}";
                        }else{
                            alert("删除失败");
                        }
                    }
                });
            }
        });


        $(".edit_btn").click(function () {
            var userId = $(this).parent().parent().find("td:eq(0)").text();
            $.ajax({
                url:"${pageContext.request.contextPath}/findUser.action",
                type:"get",
                data:{"userId":userId},
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
                url:"${pageContext.request.contextPath}/updateUser.action",
                type:"Post",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify({"userId":userId,"userName":userName,"nickName":nickName}),
                success:function (data) {
                    if (data == 'success'){
                        alert("保存成功！");
                        window.location.href="${pageContext.request.contextPath}/findAllUser.action?page=${page}";
                    }else{
                        alert("保存失败！");
                    }
                }
            });
        })


    });

</script>

<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
