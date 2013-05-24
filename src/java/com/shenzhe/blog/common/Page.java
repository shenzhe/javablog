/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.common;

/**
 *
 * @author shenzhe
 */
public class Page {
    
    private String url;
    private int rows;
    private int pagerows;
    private int nowpage;
    
    public String  makePage() {
        int pageCount = this.getRows() / this.getPagerows();
        if(this.getRows() % this.getPagerows() == 0) {
            pageCount += 1;
        }
        String pageHtml = "<ul class='paging'>";
        for(int i=1; i<=pageCount; i++) {
            if(this.getNowpage() == i) {
                pageHtml += "<li class='current'>"+i+"</li> ";
            } else {
                pageHtml += "<li><a href='"+this.getUrl()+"&p="+i+"'>"+i+"</a></li>";
            }
        }
        pageHtml += "</ul>";
        return pageHtml;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        if(url.indexOf("?") == -1) {
            url += "?";
        }
        this.url = url;
    }

    /**
     * @return the rows
     */
    public int getRows() {
        return rows;
    }

    /**
     * @param rows the rows to set
     */
    public void setRows(int rows) {
        this.rows = rows;
    }

    /**
     * @return the pagerows
     */
    public int getPagerows() {
        return pagerows;
    }

    /**
     * @param pagerows the pagerows to set
     */
    public void setPagerows(int pagerows) {
        this.pagerows = pagerows;
    }

    /**
     * @return the nowpage
     */
    public int getNowpage() {
        return nowpage;
    }

    /**
     * @param nowpage the nowpage to set
     */
    public void setNowpage(int nowpage) {
        this.nowpage = nowpage;
    }
}
