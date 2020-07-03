<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>员工新增</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>

<%@include file="common/head.jsp"%>

<%@include file="common/employee.jsp"%>

<ol class="breadcrumb" style="width: 30%;background-color: white">
    <li><a href="#">员工管理</a></li>
    <li class="active">添加员工</li>
</ol>

<form id="form1" style="width: 30%;float: right;margin-right: 750px">
    <div class="form-group">
        <label for="exampleInputEmail1">姓名</label>
        <input type="text" id="empName" name="empName" class="form-control" id="exampleInputEmail1" placeholder="姓名">
    </div>
    <div class="form-group">
        <strong>性别： </strong>
        <label class="radio-inline">
            <input type="radio" class="empGender"  value="男" name="empGender" checked>男
        </label>
        <label class="radio-inline">
            <input type="radio" class="empGender"  value="女" name="empGender">女
        </label>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail2">年龄</label>
        <input type="text" id="empAge" name="empAge" class="form-control" id="exampleInputEmail2" placeholder="年龄">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail3">身份证号码</label>
        <input type="text" id="empIdnum" name="empIdnum" class="form-control" id="exampleInputEmail3" placeholder="身份证号码">
    </div>
    <div class="form-group">
        <label>所属部门</label>
        <%--<input type="text" id="empDepart" name="empDepart" class="form-control" id="exampleInputEmail4" placeholder="所属部门">--%>
        <select class="form-control" id="empDepart">
            <c:forEach items="${departmentList}" var="i">
                <option value="${i.departName}">${i.departName}</option>
            </c:forEach>
        </select>


    </div>
    <div class="form-group">
        <label>职位</label>
        <%--<input type="text" id="postName" name="postName" class="form-control" id="exampleInputEmail5" placeholder="职位">--%>
        <select class="form-control" id="postName">
            <c:forEach items="${postList}" var="i">
                <option value="${i.postName}">${i.postName}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail6">联系电话</label>
        <input type="text" id="empPhone" name="empPhone" class="form-control" id="exampleInputEmail6" placeholder="联系电话">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail7">Email</label>
        <input type="text" id="empEmail" name="empEmail" class="form-control" id="exampleInputEmail7" placeholder="Email">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail8">住址</label>
        <input type="text" id="address" name="address" class="form-control" id="exampleInputEmail8" placeholder="住址">
    </div>
    <div class="form-group">
        <label>学历</label>
        <select class="form-control" id="eduBackground">
            <option value="本科">本科</option>
            <option value="大专">大专</option>
            <option value="硕士">硕士</option>
            <option value="博士">博士</option>
            <option value="其他">其他</option>
        </select>
    </div>
    <input type="button" id="submit1" class="btn btn-primary" value="新增">
    <input type="reset" class="btn btn-primary" value="重置">
</form>

<script>
    $(function () {
        $("#submit1").click(function () {
            var empName=$("#empName").val();
            var empGender = $('input:radio:checked').val();
            var empAge = $("#empAge").val();
            var empIdnum = $("#empIdnum").val();
            var empDepart = $("#empDepart option:selected").val();
            var postName = $("#postName option:selected").val();
            var empPhone = $("#empPhone").val();
            var empEmail = $("#empEmail").val();
            var address = $("#address").val();
            var eduBackground = $("#eduBackground option:selected").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/insertEmployee.action",
                type:"post",
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify({"empName":empName,"empGender":empGender,"empAge":empAge
                ,"empIdnum":empIdnum,"empDepart":empDepart,"postName":postName,"empPhone":empPhone
                ,"empEmail":empEmail,"address":address,"eduBackground":eduBackground}),
                success:function (data) {
                    if (data == 'success'){
                        alert("新增成功！");
                        window.location.href="${pageContext.request.contextPath}/findAllDepartAndPost.action";
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
