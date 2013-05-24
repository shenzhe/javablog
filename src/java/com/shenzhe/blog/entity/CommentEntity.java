/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.entity;

/**
 *
 * @author shenzhe
 */
public class CommentEntity {
    private int id;
    private int categoryid;
    private int blogid;
    private String username;
    private String content;
    private String datetime;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the categoryid
     */
    public int getCategoryid() {
        return categoryid;
    }

    /**
     * @param categoryid the categoryid to set
     */
    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    /**
     * @return the blogid
     */
    public int getBlogid() {
        return blogid;
    }

    /**
     * @param blogid the blogid to set
     */
    public void setBlogid(int blogid) {
        this.blogid = blogid;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the datetime
     */
    public String getDatetime() {
        return datetime;
    }

    /**
     * @param datetime the datetime to set
     */
    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }
}
