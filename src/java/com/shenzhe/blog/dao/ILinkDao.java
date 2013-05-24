/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.dao;

import com.shenzhe.blog.entity.LinkEntity;
import java.util.List;

/**
 *
 * @author mac
 */
public interface ILinkDao {
    public int insert(LinkEntity link);
    
    public int update(LinkEntity link);
    
    public int delete(int id);
    
    public List<LinkEntity> selectList();
    
    public LinkEntity selectOne(int id);
   
}
