<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>职位信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>

<%@include file="common/head.jsp"%>

<%@include file="common/post.jsp"%>

<ol class="breadcrumb" style="width: 30%;background-color: white">
    <li><a href="#">职位管理</a></li>
    <li class="active">职位信息</li>
</ol>

<form class="form-inline">
    <div class="form-group">
        <label for="exampleInputName2">职位编号：</label>
        <input type="text" class="form-control" id="exampleInputName2" placeholder="职位编号">
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="form-group">
        <label>职位名称：</label>
        <input type="email" class="form-control" placeholder="职位名称">
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">搜索</button>
</form>

<table class="table table-bordered table-hover" style="width: 80%;text-align: center">
    <tr>
        <th style="text-align: center">职位编号</th>
        <th style="text-align: center">职位名称</th>
        <th style="text-align: center">操作</th>
    </tr>
    <c:forEach items="${postList}" var="i">
        <tr>
            <td>${i.postId}</td>
            <td>${i.postName}</td>
            <td style="text-align: center">
                <button type="button" class="btn btn-danger delete_btn">删除</button>
                    <%--<button type="button" class="btn btn-primary">编辑</button>--%>
                <button class="btn btn-primary edit_btn" data-toggle="modal" data-target="#myModal">编辑</button>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="3" style="text-align: center">
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
                                <a href="${pageContext.request.contextPath}/findAllPost.action?page=${page-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="item" varStatus="status" begin="0" end="${pageNum-1}">
                        <li><a href="${pageContext.request.contextPath}/findAllPost.action?page=${status.index+1}">${status.index+1}</a></li>
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
                                <a href="${pageContext.request.contextPath}/findAllPost.action?page=${page+1}" aria-label="Next">
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
        <td colspan="3" style="text-align: center">
            当前在第<span class="label label-default">${page}</span>页，一个有<span class="label label-default">${pageNum}</span>页，
            共<span class="label label-default">${postCount}</span>条记录
        </td>
    </tr>
</table>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑岗位信息</h4>
            </div>
            <div class="modal-body"><%--模态框的内容--%>
                <form id="form1"">
                <div class="form-group">
                    <label for="exampleInputEmail1">岗位编号</label>
                    <input type="text" id="edit_postId" name="postId" class="form-control" id="exampleInputEmail2" placeholder="岗位编号" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">岗位名称</label>
                    <input type="text" id="edit_postName" name="postName" class="form-control" id="exampleInputEmail1" placeholder="岗位名称">
                </div>
                <button type="button" class="btn btn-primary update_btn">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </form>
            </div>

        </div>
    </div>
</div>



<script type="text/javascript">
    $(function () {
        $(".delete_btn").click(function () {
            var postId = $(this).parent().parent().find("td:eq(0)").text();
            var postName = $(this).parent().parent().find("td:eq(1)").text();
            if (confirm("确定要删除【"+postName+"】吗？")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/deletePost.action",
                    type:"get",
                    data:{"postId":postId},
                    success:function (data) {
                        if (data =='success'){
                            alert("删除成功！");
                            window.location.href="${pageContext.request.contextPath}/findAllPost.action?page=${page}";
                        }else{
                            alert("删除失败");
                        }
                    }
                });
            }
        });


        $(".edit_btn").click(function () {
            var postId = $(this).parent().parent().find("td:eq(0)").text();
            $.ajax({
                url:"${pageContext.request.contextPath}/findPost.action",
                type:"get",
                data:{"postId":postId},
                success:function (post) {
                    $("#edit_postId").val(post.postId);
                    $("#edit_postName").val(post.postName);
                }
            });
        });


        $(".update_btn").click(function () {
            var edit_postId = $("#edit_postId").val();
            var edit_postName = $("#edit_postName").val();

            $.ajax({
                url:"${pageContext.request.contextPath}/updatePost.action",
                type:"Post",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify({"postId":edit_postId,"postName":edit_postName}),
                success:function (data) {
                    if (data == 'success'){
                        alert("保存成功！");
                        window.location.href="${pageContext.request.contextPath}/findAllPost.action?page=${page}";
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
