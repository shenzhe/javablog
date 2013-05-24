/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.dao;

import com.shenzhe.blog.entity.CategoryEntity;
import java.util.List;

/**
 *
 * @author mac
 */
public interface ICategoryDao {
    public int insert(CategoryEntity category);
    
    public int update(CategoryEntity category);
    
    public int delete(int id);
    
    public List<CategoryEntity> selectList();
    
    public CategoryEntity selectOne(int id);
   
}
