<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>岗位新增</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>

<%@include file="common/head.jsp"%>

<%@include file="common/post.jsp"%>

<ol class="breadcrumb" style="width: 30%;background-color: white">
    <li><a href="#">职位管理</a></li>
    <li class="active">添加职位</li>
</ol>


<form id="form1" style="width: 30%;float: right;margin-right: 750px">
    <div class="form-group">
        <label for="exampleInputEmail1">职位名称</label>
        <input type="text" id="postName" name="postName" class="form-control" id="exampleInputEmail1" placeholder="职位名称">
    </div>
    <input type="button" id="submit1" class="btn btn-primary" value="新增">
    <input type="reset" class="btn btn-primary" value="重置">
</form>


<script>
    $(function () {
        $("#submit1").click(function () {
            var postName = $("#postName").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/insertPost.action",
                type:"Post",
                data:{"postName":postName},
                success:function(data){
                    if (data=='success'){
                        alert("新增成功！");
                        window.location.href="${pageContext.request.contextPath}/jsp/postInsert.jsp"
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
