/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.dao;

import com.shenzhe.blog.entity.CommentEntity;
import java.util.List;
import java.util.Map;

/**
 *
 * @author mac
 */
public interface ICommentDao {
    public int insert(CommentEntity comment);

    public int delete(Map map);
    
    public List<CommentEntity> selectList(Map map);
    
    public int selectCount(Map map);
    
    
}
