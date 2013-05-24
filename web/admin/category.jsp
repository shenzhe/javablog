<%-- 
    Document   : index
    Created on : 2012-2-17, 10:21:40
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, com.shenzhe.blog.entity.CategoryEntity" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>分类管理</title>
        <link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
        <jsp:useBean id="category" class="com.shenzhe.blog.model.CategoryModel" />
    </head>
    <body>
        <div class="content">
        <h3>博客分类 </h3>
        <form method="post" id="multi-form" autocomplete="off">
        <table class="list">
            <thead>
            <tr>
                <th class="check"><input name="" type="checkbox" value=""  class="checkall" /></th>
                <th width="100">id</th>
                <th >标题</th>
                <th class="td-thired">Actions</th>
            </tr>
            </thead>
            <tbody>
                <%
                List categoryList = category.getList();
                for(int i=0; i<categoryList.size(); i++) {
                    CategoryEntity ce = (CategoryEntity) categoryList.get(i);
                %>
                <tr>
                    <td class="check"><input type="checkbox" value="<%=ce.getId()%>" name="id[]" /></td>
                    <td ><span class="text"><%=ce.getId()%></span></td>
                    <td ><span class="text"><a href="<%=request.getContextPath()%>/admin/list.jsp?categoryId=<%=ce.getId()%>"><%=ce.getTitle()%></a></span></td>
                    <td class="td-thired">
                        <a href="<%=request.getContextPath()%>/admin/editcategory.jsp?id=<%=ce.getId()%>">编辑</a> 
                        <a href="<%=request.getContextPath()%>/admin/deleteCategoryServlet?id=<%=ce.getId()%>">删除</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        </form>
        </div>
        
    </body>
</html>
