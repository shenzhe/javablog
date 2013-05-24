/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.model;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.shenzhe.blog.common.DataSource;
import com.shenzhe.blog.dao.ICommentDao;
import com.shenzhe.blog.entity.CommentEntity;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *
 * @author shenzhe
 */
public class CommentModel extends ModelBase{
    public List getList(int blogId, int categoryId, int page, int pagerows) {
        
        ICommentDao icd = getSession().getMapper(ICommentDao.class);
        Map map = new HashMap();
        map.put("blogid", blogId);
        map.put("categoryid", categoryId);
        if(pagerows > 0) {
            map.put("start", (page - 1) * pagerows);
            map.put("pagerows", pagerows);
        }
        List<CommentEntity> commentList = icd.selectList(map);
        closeSession();
        return commentList;
    }
    
    public List getListByBlog(int blogId) {
        return getList(blogId, 0, 0, 0);
    }
    
   
    
    public int getCommentCount(int blogId, int categoryId) {
        ICommentDao icd = getSession().getMapper(ICommentDao.class);
        Map map = new HashMap();
        map.put("blogid", blogId);
        map.put("categoryid", categoryId);
        int blogCount = icd.selectCount(map);
        closeSession();
        return blogCount;
    }
    
    public int addComment(CommentEntity ce) {
        Date now = new Date();
        DateFormat d1 = DateFormat.getDateTimeInstance();
        ce.setDatetime(d1.format(now));
        ICommentDao icd = getSession().getMapper(ICommentDao.class);
        int result = icd.insert(ce);
        closeSession();
        return result;
        
    }
    
    
    public int deleteComment(int id, int blogid, int categoryid) {
        ICommentDao icd = getSession().getMapper(ICommentDao.class);
        Map map = new HashMap();
        map.put("id", id);
        map.put("blogid", blogid);
        map.put("categoryid", categoryid);
        int result = icd.delete(map);
        closeSession();
        return result;
    }
}
