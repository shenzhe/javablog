/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.model;

import com.shenzhe.blog.dao.IBlogDao;
import com.shenzhe.blog.entity.BlogEntity;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *
 * @author shenzhe
 */
public class BlogModel extends ModelBase {
    
    public List getList(int categoryId, int page, int pagerows) {
        IBlogDao ibd = getSession().getMapper(IBlogDao.class);
        Map map = new HashMap();
        map.put("categoryid", categoryId);
        map.put("start", (page - 1) * pagerows);
        map.put("pagerows", pagerows);
        List<BlogEntity> blogList = ibd.selectList(map);
        closeSession();
        return blogList;
    }
    
    public int getBlogCount(int categoryId) {
        IBlogDao ibd = getSession().getMapper(IBlogDao.class);
        HashMap map = new HashMap();
        map.put("categoryid", categoryId);
        int blogCount = ibd.selectCount(map);
        closeSession();
        return blogCount;
        
    }
    
    public BlogEntity getBlog(int id) {
        IBlogDao ibd = getSession().getMapper(IBlogDao.class);
        BlogEntity be = ibd.selectOne(id);
        closeSession();
        return be;
        
    }
    
    
    
    public int addHits(int id) {
        return 1;
        
    }
    
    public int updateBlog(BlogEntity be) {
        IBlogDao ibd = getSession().getMapper(IBlogDao.class);
        int result = ibd.update(be);
        closeSession();
        return result;
    }
    
    public int addBlog(BlogEntity be) {
        Date now = new Date();
        DateFormat d1 = DateFormat.getDateTimeInstance();
        be.setDatetime(d1.format(now));
        be.setHits(0);
        IBlogDao ibd = getSession().getMapper(IBlogDao.class);
        int result = ibd.insert(be);
        closeSession();
        return result;
    }
    
    public int deleteBlog(int id, int categoryid) {
        IBlogDao ibd = getSession().getMapper(IBlogDao.class);
        Map map = new HashMap();
        map.put("id", id);
        map.put("categoryid", categoryid);
        int result = ibd.delete(map);
        closeSession();
        return result;
    }
}
