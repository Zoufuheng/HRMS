<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>部门查询</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">

</head>
<body>
<%@include file="common/head.jsp"%>

<%@include file="common/department.jsp"%>


<ol class="breadcrumb" style="width: 30%;background-color: white">
    <li><a href="#">部门管理</a></li>
    <li class="active">部门信息</li>
</ol>

<table class="table table-bordered table-hover" style="width: 80%" id="table1">
    <tr>
        <th style="text-align: center">部门编号</th>
        <th style="text-align: center">部门名称</th>
        <th style="text-align: center">部门经理</th>
        <th style="text-align: center">联系电话</th>
        <th style="text-align: center">操作</th>
    </tr>
    <c:forEach items="${departmentList}" var="i">
        <tr class="text_center">
            <td style="text-align: center">${i.departId}</td>
            <td style="text-align: center">${i.departName}</td>
            <td style="text-align: center">${i.departManager}</td>
            <td style="text-align: center">${i.departPhone}</td>
            <td style="text-align: center">
                <button type="button" class="btn btn-danger delete_btn">删除</button>
                <%--<button type="button" class="btn btn-primary">编辑</button>--%>
                <button class="btn btn-primary edit_btn" data-toggle="modal" data-target="#myModal">编辑</button>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="5" style="text-align: center">
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
                                <a href="${pageContext.request.contextPath}/findAlldepartment.action?page=${page-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="item" varStatus="status" begin="0" end="${pageNum-1}">
                        <li><a href="${pageContext.request.contextPath}/findAlldepartment.action?page=${status.index+1}">${status.index+1}</a></li>
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
                                <a href="${pageContext.request.contextPath}/findAlldepartment.action?page=${page+1}" aria-label="Next">
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
        <td colspan="5" style="text-align: center">
            当前在第<span class="label label-default">${page}</span>页，一个有<span class="label label-default">${pageNum}</span>页，
            共<span class="label label-default">${count}</span>条记录
        </td>
    </tr>
</table>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑部门信息</h4>
            </div>
            <div class="modal-body"><%--模态框的内容--%>
                <form id="form1"">
                    <div class="form-group">
                        <label for="exampleInputEmail1">部门编号</label>
                        <input value="${department.departId}" type="text" id="edit_departId" name="departId" class="form-control" id="exampleInputEmail2" placeholder="部门编号" readonly>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">部门名称</label>
                        <input value="${department.departName}" type="text" id="edit_departName" name="departName" class="form-control" id="exampleInputEmail1" placeholder="部门名称">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">部门经理</label>
                        <input value="${department.departManager}" type="text" id="edit_departManager" name="departManager" class="form-control" id="exampleInputPassword2" placeholder="部门经理">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">联系电话</label>
                        <input value="${department.departPhone}" type="text" id="edit_departPhone" name="departPhone" class="form-control" id="exampleInputPassword1" placeholder="联系电话">
                    </div>
                    <button type="button" class="btn btn-primary update_btn">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </form>
            </div>
            <%--<div class="modal-footer">
                <button type="button" class="btn btn-primary">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>--%>
        </div>
    </div>
</div>



<script type="text/javascript">
    $(function () {
        $(".delete_btn").click(function () {
            var departId = $(this).parent().parent().find("td:eq(0)").text();
            var departName = $(this).parent().parent().find("td:eq(1)").text();
            if (confirm("确定要删除【"+departName+"】吗？")){
                $.ajax({
                   url:"${pageContext.request.contextPath}/deleteDepartment.action",
                   type:"get",
                   data:{"departId":departId},
                   success:function (data) {
                       if (data =='success'){
                           alert("删除成功！");
                           window.location.href="${pageContext.request.contextPath}/findAlldepartment.action?page=${page}";
                       }else{
                           alert("删除失败");
                       }
                   }
                });
            }
        });

        $(".edit_btn").click(function () {
            var departId = $(this).parent().parent().find("td:eq(0)").text();
            $.ajax({
                url:"${pageContext.request.contextPath}/editDepartment.action",
                type:"get",
                data:{"departId":departId},
                success:function (department) {
                    $("#edit_departId").val(department.departId);
                    $("#edit_departName").val(department.departName);
                    $("#edit_departManager").val(department.departManager);
                    $("#edit_departPhone").val(department.departPhone);
                }
            });
        })

        $(".update_btn").click(function () {
            var edit_departId = $("#edit_departId").val();
            var edit_departName = $("#edit_departName").val();
            var edit_departManager = $("#edit_departManager").val();
            var edit_departPhone = $("#edit_departPhone").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/updateDepartment.action",
                type:"Post",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify({"departId":edit_departId,"departName":edit_departName,"departManager":edit_departManager,"departPhone":edit_departPhone}),
                success:function (data) {
                    if (data == 'success'){
                        alert("保存成功！");
                        window.location.href="${pageContext.request.contextPath}/findAlldepartment.action?page=${page}";
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
