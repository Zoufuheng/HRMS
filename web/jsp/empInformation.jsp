<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>员工信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>

<%@include file="common/head.jsp"%>

<%@include file="common/employee.jsp"%>

<ol class="breadcrumb" style="width: 30%;background-color: white">
    <li><a href="#">员工管理</a></li>
    <li class="active">员工信息</li>
</ol>

<table class="table table-bordered table-hover" style="width: 80%;text-align: center">
    <tr>
        <th style="text-align: center">员工编号</th>
        <th style="text-align: center">姓名</th>
        <th style="text-align: center">性别</th>
        <th style="text-align: center">所属部门</th>
        <th style="text-align: center">职位</th>
        <th style="text-align: center">联系电话</th>
        <th style="text-align: center">操作</th>
    </tr>
    <c:forEach items="${employeeList}" var="i">
        <tr>
            <td>${i.empId}</td>
            <td>${i.empName}</td>
            <td>${i.empGender}</td>
            <td>${i.empDepart}</td>
            <td>${i.postName}</td>
            <td>${i.empPhone}</td>
            <td style="text-align: center">
                <button type="button" class="btn btn-danger delete_btn">删除</button>
                <button class="btn btn-primary edit_btn" data-toggle="modal" data-target="#myModal">编辑</button>
                <button type="button" class="btn btn-success information_btn" data-toggle="modal" data-target="#myModal1">详细信息</button>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="7">
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
                                <a href="${pageContext.request.contextPath}/findEmpByPage.action?page=${page-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="item" varStatus="status" begin="0" end="${pageNum-1}">
                        <li><a href="${pageContext.request.contextPath}/findEmpByPage.action?page=${status.index+1}">${status.index+1}</a></li>
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
                                <a href="${pageContext.request.contextPath}/findEmpByPage.action?page=${page+1}" aria-label="Next">
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
        <td colspan="7">
            当前在第<span class="label label-default">${page}</span>页，一个有<span class="label label-default">${pageNum}</span>页，
            共<span class="label label-default">${empCount}</span>条记录
        </td>
    </tr>
</table>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑员工信息</h4>
            </div>
            <div class="modal-body"><%--模态框的内容--%>
                <form id="form1"">
                <div class="form-group">
                    <label for="exampleInputEmail1">员工编号</label>
                    <input type="text" id="empId" name="empId" class="form-control" id="exampleInputEmail2" placeholder="员工编号" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">姓名</label>
                    <input type="text" id="empName" name="empName" class="form-control" id="exampleInputEmail1" placeholder="姓名">
                </div>
                <div class="form-group">
                    <strong>性别： </strong>
                    <label class="radio-inline">
                        <input type="radio" id="empGender1"  value="男" name="empGender" checked>男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" id="empGender2"  value="女" name="empGender">女
                    </label>
                </div>
                <div class="form-group">
                    <label>年龄</label>
                    <input type="text" id="empAge" name="empAge" class="form-control"placeholder="年龄">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail3">身份证号码</label>
                    <input type="text" id="empIdnum" name="empIdnum" class="form-control" id="exampleInputEmail3" placeholder="身份证号码">
                </div>
                <div class="form-group">
                    <label>所属部门</label>

                    <select class="form-control" id="empDepart">
                        <c:forEach items="${departmentList}" var="i">
                            <option value="${i.departName}">${i.departName}</option>
                        </c:forEach>
                    </select>


                </div>
                <div class="form-group">
                    <label>职位</label>

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
                <button type="button" class="btn btn-primary update_btn">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </form>
            </div>

        </div>
    </div>
</div>


<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">员工详细信息</h4>
            </div>
            <div class="modal-body"><%--模态框的内容--%>
                <form id="form1">
                <div class="form-group">
                    <label for="exampleInputEmail1">员工编号</label>
                    <input type="text" id="empId1" name="empId" class="form-control" placeholder="员工编号" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">姓名</label>
                    <input type="text" id="empName1" name="empName" class="form-control"placeholder="姓名" readonly>
                </div>
                <div class="form-group">
                    <strong>性别： </strong>
                    <label class="radio-inline">
                        <input type="radio" id="empGender11"  value="男" name="empGender" checked disabled="disabled">男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" id="empGender21"  value="女" name="empGender" disabled="disabled">女
                    </label>
                </div>
                <div class="form-group">
                    <label>年龄</label>
                    <input type="text" id="empAge1" name="empAge" class="form-control"placeholder="年龄" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail3">身份证号码</label>
                    <input type="text" id="empIdnum1" name="empIdnum" class="form-control" placeholder="身份证号码" readonly>
                </div>
                <div class="form-group">
                    <label>所属部门</label>

                    <select class="form-control" id="empDepart1" style="background-color:#EEEEEE;" disabled="disabled">
                        <c:forEach items="${departmentList}" var="i">
                            <option value="${i.departName}">${i.departName}</option>
                        </c:forEach>
                    </select>


                </div>
                <div class="form-group">
                    <label>职位</label>

                    <select class="form-control" id="postName1" style="background-color:#EEEEEE;" disabled="disabled">
                        <c:forEach items="${postList}" var="i">
                            <option value="${i.postName}">${i.postName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail6">联系电话</label>
                    <input type="text" id="empPhone1" name="empPhone" class="form-control" placeholder="联系电话" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail7">Email</label>
                    <input type="text" id="empEmail1" name="empEmail" class="form-control" placeholder="Email" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail8">住址</label>
                    <input type="text" id="address1" name="address" class="form-control"placeholder="住址" readonly>
                </div>
                <div class="form-group">
                    <label>学历</label>
                    <select class="form-control" id="eduBackground1" style="background-color:#EEEEEE;" disabled="disabled">
                        <option value="本科">本科</option>
                        <option value="大专">大专</option>
                        <option value="硕士">硕士</option>
                        <option value="博士">博士</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                </form>
            </div>

        </div>
    </div>
</div>


<script>
    $(function () {

        $(".delete_btn").click(function () {
            var empId = $(this).parent().parent().find("td:eq(0)").text();
            var empName = $(this).parent().parent().find("td:eq(1)").text();
            if (confirm("确定要删除【"+empName+"】吗？")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/deleteEmployee.action",
                    type:"get",
                    data:{"empId":empId},
                    success:function (data) {
                        if (data =='success'){
                            alert("删除成功！");
                            window.location.href="${pageContext.request.contextPath}/findEmpByPage.action?page=${page}";
                        }else{
                            alert("删除失败");
                        }
                    }
                });
            }
        });

        $(".edit_btn").click(function () {
            var empId = $(this).parent().parent().find("td:eq(0)").text();
            $.ajax({
                url:"${pageContext.request.contextPath}/findEmployee.action",
                type:"get",
                data:{"empId":empId},
                success:function (employee) {
                    $("#empId").val(employee.empId);
                    $("#empName").val(employee.empName);
                    if (employee.empGender=='女'){
                        $("#empGender2").attr("checked",'checked');
                    }
                    $("#empAge").val(employee.empAge);
                    $("#empIdnum").val(employee.empIdnum);
                    $("#empDepart").find("option[value="+employee.empDepart+"]").prop("selected","selected");
                    $("#postName").find("option[value="+employee.postName+"]").prop("selected","selected");
                    $("#empPhone").val(employee.empPhone);
                    $("#empEmail").val(employee.empEmail);
                    $("#address").val(employee.address);
                    $("#eduBackground").find("option[value="+employee.eduBackground+"]").prop("selected","selected");
                }
            });
        });

        $(".update_btn").click(function () {
            var empId = $("#empId").val();
            var empName = $("#empName").val();
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
                url:"${pageContext.request.contextPath}/updateEmployee.action",
                type:"Post",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify({"empId":empId,"empName":empName,"empGender":empGender,"empAge":empAge
                    ,"empIdnum":empIdnum,"empDepart":empDepart,"postName":postName,"empPhone":empPhone
                    ,"empEmail":empEmail,"address":address,"eduBackground":eduBackground}),
                success:function (data) {
                    if (data == 'success'){
                        alert("保存成功！");
                        window.location.href="${pageContext.request.contextPath}/findEmpByPage.action?page=${page}";
                    }else{
                        alert("保存失败！");
                    }
                }
            });
        });

        $(".information_btn").click(function () {
            var empId = $(this).parent().parent().find("td:eq(0)").text();
            $.ajax({
                url:"${pageContext.request.contextPath}/findEmployee.action",
                type:"get",
                data:{"empId":empId},
                success:function (employee) {
                    $("#empId1").val(employee.empId);
                    $("#empName1").val(employee.empName);
                    if (employee.empGender=='女'){
                        $("#empGender21").attr("checked",'checked');
                    }
                    $("#empAge1").val(employee.empAge);
                    $("#empIdnum1").val(employee.empIdnum);
                    $("#empDepart1").find("option[value="+employee.empDepart+"]").prop("selected","selected");
                    $("#postName1").find("option[value="+employee.postName+"]").prop("selected","selected");
                    $("#empPhone1").val(employee.empPhone);
                    $("#empEmail1").val(employee.empEmail);
                    $("#address1").val(employee.address);
                    $("#eduBackground1").find("option[value="+employee.eduBackground+"]").prop("selected","selected");
                }
        });
    });

    });
</script>

<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
