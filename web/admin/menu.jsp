<%-- 
    Document   : menu
    Created on : 2012-2-20, 14:45:12
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
</head>
<body id="menuBody">
<div class="icon"></div>
<div class="menu">
  <ul>

    <li><a href="<%=request.getContextPath()%>/admin/category.jsp" target="main">分类列表</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/addcategory.jsp" target="main">添加分类</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/list.jsp" target="main">博客列表</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/addblog.jsp" target="main">添加博客</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/comment.jsp" target="main">评论列表</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/link.jsp" target="main">链接列表</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/addlink.jsp" target="main">添加链接</a></li>
  </ul>
</div>
</body>
</html>
