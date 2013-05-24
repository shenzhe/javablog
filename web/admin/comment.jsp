<%-- 
    Document   : index
    Created on : 2012-2-17, 10:21:40
    Author     : shenzhe
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, com.shenzhe.blog.common.Page, com.shenzhe.blog.entity.CommentEntity" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>博客管理</title>
        <link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
        <jsp:useBean id="commentModel" class="com.shenzhe.blog.model.CommentModel" />
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
                <th >用户</th>
                <th >内容</th>
                <th>时间</th>
                <th class="td-thired">Actions</th>
            </tr>
            </thead>
            <tbody>
                <%
                String where = null;
                String url = request.getContextPath()+"/admin/comment.jsp?";
                String p = request.getParameter("page");
                if(p == null) {
                    p = "1";
                }
                String categoryId = request.getParameter("categoryId");
                if(categoryId == null) {
                    
                    categoryId = "0";
                } else {
                    url +="&categoryId"+categoryId;
                }
                String blogId = request.getParameter("blogId");
                if(blogId == null) {
                    
                    blogId = "0";
                } else {
                    url +="&blogId"+blogId;
                }
                Page pa = new Page();
                pa.setUrl(url);
                pa.setPagerows(10);
                pa.setNowpage(Integer.parseInt(p));
                
                List commentList = commentModel.getList(Integer.parseInt(blogId), Integer.parseInt(categoryId), pa.getNowpage(), pa.getPagerows());
                for(int i=0; i<commentList.size(); i++) {
                    CommentEntity ce = (CommentEntity) commentList.get(i);
                %>
                <tr>
                    <td class="check"><input type="checkbox" value="<%=ce.getId()%>" name="id[]" /></td>
                    <td ><span class="text"><%=ce.getId()%></span></td>
                    <td ><span class="text"><%=ce.getUsername()%></span></td>
                    <td ><span class="text"><%=ce.getContent()%></span></td>
                    <td ><span class="text"><%=ce.getDatetime()%></span></td>
                    <td class="td-thired">
                        <a href="<%=request.getContextPath()%>/detail.jsp?id=<%=ce.getBlogid()%>" target="_blank">查看所属博客</a>
                        <a href="<%=request.getContextPath()%>/admin/deleteCommentServlet?id=<%=ce.getId()%>">删除</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        </form>
        </div>
        
    </body>
</html>
