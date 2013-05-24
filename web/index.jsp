<%-- 
    Document   : index
    Created on : 2012-2-17, 10:21:40
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, com.shenzhe.blog.entity.*, com.shenzhe.blog.common.Page"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="zh-CN">
    <head profile="http://gmpg.org/xfn/11">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>泽泽时代 - 持续的思考</title>
        <link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/static/css/style.css" />
        <style type="text/css">.recentcomments a{display:inline !important;padding:0 !important;margin:0 !important;}</style>
        <jsp:useBean id="blogModel" class="com.shenzhe.blog.model.BlogModel" />
        <jsp:useBean id="categoryModel" class="com.shenzhe.blog.model.CategoryModel" />
        <jsp:useBean id="commentModel" class="com.shenzhe.blog.model.CommentModel" />
    </head>
    <body class="home blog">
        <div id="nav">
            <div id="menus">
                <ul><li class="current_page_item"><a href="<%=request.getContextPath()%>/index.jsp">首页</a></li></ul>
                <div class="menu"><ul><li class="page_item page-item-9"><a href="<%=request.getContextPath()%>/about.jsp">关于我</a></li></ul></div>
            </div>
        </div>
        <div id="wrapper">
            <div id="header">		
                <h1><a href="<%=request.getContextPath()%>/index.jsp">泽泽时代</a></h1>
                <h2>持续的思考</h2>
                <div class="clear"></div>
            </div>
            <div id="content">
                <%
                    String url = request.getContextPath()+"/index.jsp";
                    String p = request.getParameter("p");
                    if(p == null) {
                        p = "1";
                    }
                    String categoryId = request.getParameter("categoryId");
                    if(categoryId != null) {
                        
                        url += "?categoryId"+categoryId;
                    } else {
                        categoryId = "0";
                    }
                    Page pa = new Page();
                    pa.setUrl(url);
                    pa.setRows(blogModel.getBlogCount(Integer.parseInt(categoryId)));
                    pa.setPagerows(10);
                    pa.setNowpage(Integer.parseInt(p));
                    List blogList = blogModel.getList(Integer.parseInt(categoryId), Integer.parseInt(p), pa.getPagerows());
                    List categoryList = categoryModel.getList();
                    for(int i=0; i<blogList.size(); i++) {
                        BlogEntity be = (BlogEntity) blogList.get(i);
                        String categoryTitle = categoryModel.getTitleById(categoryList, be.getCategoryid());
                %>
                <div class="post type-post status-publish format-standard hentry post"><!-- post div -->
                    <h2 class="title"><a href="<%=request.getContextPath()%>/detail.jsp?id=<%=be.getId()%>"><%=be.getTitle()%></a></h2>
                    <div class="post-info-top">
                        <span class="post-info-date">
                            作者: 泽泽
                            日期: <%=be.getDatetime()%>
                            分类: <a href="<%=request.getContextPath()%>/index.jsp?categoryId=<%=be.getCategoryid()%>"><%=categoryTitle%></a>
                        </span>
                    </div>
                    <div class="clear"></div>
                    <div class="entry">
                       <%=be.getContent()%>
                    </div><!-- END entry -->
                </div><!-- END post -->
                <% } %>
            </div><!--content-->
            <div id="sidebar-border">
                <div id="rss_border">
                    <div class="rss_border">
                        <div id="rss_wrap">
                            <div class="rss_wrap">
                                <a class="rss rss_text" href="<%=request.getContextPath()%>/feed.jsp" rel="bookmark" title="RSS 订阅">RSS 订阅</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="sidebar">
                    <div id="categories-2" class="widget widget_categories">
                        <h3 class="widgettitle">分类目录</h3>		
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/index.jsp">所有分类</a></li>
                            <%
                                for(int m=0; m<categoryList.size(); m++) {
                                    CategoryEntity ce = (CategoryEntity) categoryList.get(m);
                            %>
                            <li class="cat-item cat-item-3"><a href="<%=request.getContextPath()%>/index.jsp?categoryId=<%=ce.getId()%>" title="<%=ce.getTitle()%>"><%=ce.getTitle()%></a></li>
                            <% } %>
                        </ul>
                    </div>
                    <div id="recent-comments-2" class="widget widget_recent_comments">
                        <h3 class="widgettitle">近期评论</h3>
                        <ul id="recentcomments"></ul>
                    </div>
                    <div id="meta-2" class="widget widget_meta">
                        <h3 class="widgettitle">友情链接</h3>
                        <ul>
                        
                        </ul>
                    </div>

                </div><!-- end: #sidebar -->
            </div><!-- end: #sidebar-border -->
            <div class="clear">
                <%=pa.makePage()%>
            </div>
        </div><!--wrapper-->
        <div class="clear"></div>
        <div id="footer">
            <div id="footer-inside">
                <p>
                    版权所有 © 2012 泽泽时代		
                </p>
                <span id="back-to-top">↑ <a href="#" rel="nofollow" title="Back to top">回到顶部</a></span>
            </div>
        </div><!--footer-->

    </body></html>
