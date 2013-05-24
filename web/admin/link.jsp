<%-- 
    Document   : index
    Created on : 2012-2-17, 10:21:40
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, com.shenzhe.blog.entity.LinkEntity" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>链接管理</title>
        <link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
        <jsp:useBean id="link" class="com.shenzhe.blog.model.LinkModel" />
    </head>
    <body>
        <div class="content">
        <h3>链接列表 </h3>
        <form method="post" id="multi-form" autocomplete="off">
        <table class="list">
            <thead>
            <tr>
                <th class="check"><input name="" type="checkbox" value=""  class="checkall" /></th>
                <th width="100">id</th>
                <th >名称</th>
                <th >地址</th>
                <th class="td-thired">Actions</th>
            </tr>
            </thead>
            <tbody>
                <%
                List linkList = link.getList();
                for(int i=0; i<linkList.size(); i++) {
                    LinkEntity ce = (LinkEntity) linkList.get(i);
                %>
                <tr>
                    <td class="check"><input type="checkbox" value="<%=ce.getId()%>" name="id[]" /></td>
                    <td ><span class="text"><%=ce.getId()%></span></td>
                    <td ><span class="text"><%=ce.getTitle()%></span></td>
                    <td ><span class="text"><a href="<%=ce.getUrl()%>" target="_blank"><%=ce.getUrl()%></a></span></td>
                    <td class="td-thired">
                        <a href="<%=request.getContextPath()%>/admin/editlink.jsp?id=<%=ce.getId()%>">编辑</a> 
                        <a href="<%=request.getContextPath()%>/admin/deleteLinkServlet?id=<%=ce.getId()%>">删除</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        </form>
        </div>
        
    </body>
</html>
