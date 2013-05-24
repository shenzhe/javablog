/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.dao;

import com.shenzhe.blog.entity.BlogEntity;
import java.util.List;
import java.util.Map;

/**
 *
 * @author mac
 */
public interface IBlogDao {
    public int insert(BlogEntity blog);
    
    public int update(BlogEntity blog);
    
    public int delete(Map map);
    
    public List<BlogEntity> selectList(Map map);
    
    public BlogEntity selectOne(int id);
    
    public int selectCount(Map map);
    
}
