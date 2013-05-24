<%-- 
    Document   : index
    Created on : 2012-2-17, 10:21:40
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, com.shenzhe.blog.common.Page, com.shenzhe.blog.entity.BlogEntity, com.shenzhe.blog.entity.CategoryEntity" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>博客管理</title>
        <link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
        <jsp:useBean id="blogModel" class="com.shenzhe.blog.model.BlogModel" />
        <jsp:useBean id="categoryModel" class="com.shenzhe.blog.model.CategoryModel" />
    </head>
    <%
                String url = request.getContextPath()+"/admin/list.jsp";
                String p = request.getParameter("p");
                if(p == null) {
                    p = "1";
                }
                String categoryId = request.getParameter("categoryId");
                if(categoryId != null) {
                    url +="?categoryId="+ categoryId;
                } else {
                    categoryId = "0";
                }
                
                Page pa = new Page();
                pa.setUrl(url);
                pa.setPagerows(10);
                pa.setNowpage(Integer.parseInt(p));
                pa.setRows(blogModel.getBlogCount(Integer.parseInt(categoryId)));
                List blogList = blogModel.getList(Integer.parseInt(categoryId), Integer.parseInt(p), pa.getPagerows());
                List categoryList = categoryModel.getList();
    %>
    <body>
        <div class="content">
        <h3>博客列表 </h3>
        <%=pa.makePage()%>
        <form method="post" id="multi-form" autocomplete="off">
        <table class="list">
            <thead>
            <tr>
                <th class="check"><input name="" type="checkbox" value=""  class="checkall" /></th>
                <th width="100">id</th>
                <th >标题</th>
                <th>分类</th>
                <th>时间</th>
                <th>点击数</th>
                <th>评论</th>
                <th class="td-thired">Actions</th>
            </tr>
            </thead>
            <tbody>
                <%
                
                for(int i=0; i<blogList.size(); i++) {
                    BlogEntity be = (BlogEntity) blogList.get(i);
                    String categoryTitle = categoryModel.getTitleById(categoryList, be.getCategoryid());
                %>
                <tr>
                    <td class="check"><input type="checkbox" value="<%=be.getId()%>" name="id[]" /></td>
                    <td ><span class="text"><%=be.getId()%></span></td>
                    <td ><span class="text"><a href="<%=request.getContextPath()%>/detail.jsp?id=<%=be.getId()%>" target="_blank"><%=be.getTitle()%></a></span></td>
                    <td ><span class="text"><a href="<%=request.getContextPath()%>/admin/list.jsp?categoryId=<%=be.getCategoryid()%>"><%=categoryTitle%></a></span></td>
                    <td ><span class="text"><%=be.getDatetime()%></span></td>
                    <td ><span class="text"><%=be.getHits()%></span></td>
                    <td ><span class="text"><a href="<%=request.getContextPath()%>/admin/comment.jsp?blogid=<%=be.getId()%>">查看评论</a></span></td>
                    <td class="td-thired">
                        <a href="<%=request.getContextPath()%>/admin/editblog.jsp?id=<%=be.getId()%>">编辑</a> 
                        <a href="<%=request.getContextPath()%>/admin/deleteBlogServlet?id=<%=be.getId()%>">删除</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        </form>
        </div>
        
    </body>
</html>
