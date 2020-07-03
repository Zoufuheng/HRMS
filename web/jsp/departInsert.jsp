<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门新增</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>
<%@include file="common/head.jsp"%>

<%@include file="common/department.jsp"%>


<ol class="breadcrumb" style="width: 30%;background-color: white">
    <li><a href="#">部门管理</a></li>
    <li class="active">添加部门</li>
</ol>

    <form id="form1" style="width: 30%;float: right;margin-right: 750px">
        <div class="form-group">
            <label for="exampleInputEmail1">部门名称</label>
            <input type="text" id="departName" name="departName" class="form-control" id="exampleInputEmail1" placeholder="部门名称">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">部门经理</label>
            <input type="text" id="departManager" name="departManager" class="form-control" id="exampleInputPassword1" placeholder="部门经理">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">联系电话</label>
            <input type="text" id="departPhone" name="departPhone" class="form-control" id="exampleInputPassword1" placeholder="联系电话">
        </div>
        <input type="button" id="submit1" class="btn btn-primary" value="新增">
        <input type="reset" class="btn btn-primary" value="重置">
    </form>

<script type="text/javascript">
    $(function () {
        $("#submit1").click(function () {
            var departName = $("#departName").val();
            var departManager = $("#departManager").val();
            var departPhone=$("#departPhone").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/insertDepartment.action",
                type:"Post",
                data:JSON.stringify({"departName":departName,"departManager":departManager,"departPhone":departPhone}),
                contentType:"application/json;charset=UTF-8",
                success:function(data){
                    if (data=='success'){
                        alert("新增成功！");
                        window.location.href="${pageContext.request.contextPath}/jsp/departInsert.jsp"
                    }else{
                        alert("新增失败！");
                    }
                }
            });
        });
    });



</script>

<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
