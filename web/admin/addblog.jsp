<%-- 
    Document   : addcategory.jsp
    Created on : 2012-2-17, 17:44:12
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,com.shenzhe.blog.entity.CategoryEntity"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
        <title>添加博客</title>
        <jsp:useBean id="categoryModel" class="com.shenzhe.blog.model.CategoryModel" />
    </head>
    <body>
        <div class="content">
        <h3>添加博客</h3>
        <form method="post" action="<%=request.getContextPath()%>/admin/addBlogServlet">
            <div id="accordion" class="form-section">
                <div>
                    <h4><a href="#">General</a></h4>
                    <div class="bg box">
                        <dl>
                            <dt>Title：</dt>
                            <dd>
                               <input type="text" name="title" value=""/>
                            </dd>
                        </dl>
                        <dl>
                            <dt>分类：</dt>
                            <dd>
                                <select name="categoryid">
                                <%
                                List categoryList = categoryModel.getList();
                                for(int i=0; i<categoryList.size(); i++) {
                                    CategoryEntity ce = (CategoryEntity) categoryList.get(i);
                                %>
                                <option value="<%=ce.getId()%>"><%=ce.getTitle()%></option>
                                <% } %>
                                </select>
                            </dd>
                        </dl>
                        <dl>
                            <dt>内容：</dt>
                            <dd>
                                <textarea name="content" class="tinymce" rows="15" cols="120"></textarea>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
            <p>
                <input type="submit" value="submit" />
            </p>
            
        </form>
        </div>
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/tiny_mce/jquery.tinymce.js"></script>
        <script type="text/javascript">
            $().ready(function() {
                $('textarea.tinymce').tinymce({
                    // Location of TinyMCE script
                    script_url : '<%=request.getContextPath()%>/static/js/tiny_mce/tiny_mce.js',

                    // General options
                    theme : "simple",
                    plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",


                    // Drop lists for link/image/media/template dialogs
                    template_external_list_url : "lists/template_list.js",
                    external_link_list_url : "lists/link_list.js",
                    external_image_list_url : "lists/image_list.js",
                    media_external_list_url : "lists/media_list.js"
                });
            });
        </script>
    </body>
</html>
