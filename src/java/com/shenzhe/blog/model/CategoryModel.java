/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.model;

import com.shenzhe.blog.dao.ICategoryDao;
import com.shenzhe.blog.entity.CategoryEntity;
import java.util.Iterator;
import java.util.List;



/**
 *
 * @author shenzhe
 */
public class CategoryModel extends ModelBase {
    
    
    
    
    public List getList() {
        
         
        ICategoryDao icd = getSession().getMapper(ICategoryDao.class);
        
        List<CategoryEntity> celist = icd.selectList();
        
        closeSession();
        
        return celist;
        
        
    }
    
    public CategoryEntity getCategory(int id) {
        
        ICategoryDao icd = getSession().getMapper(ICategoryDao.class);
        
        CategoryEntity ce = icd.selectOne(id);
        
        closeSession();
        
        return ce;
    }
    
    public int addCategory(CategoryEntity ce) {
        ICategoryDao icd = getSession().getMapper(ICategoryDao.class);
        
        int result =  icd.insert(ce);
        
        closeSession();
        
        return result;
    }
    
    public int updateCategory(CategoryEntity ce) {
        ICategoryDao icd = getSession().getMapper(ICategoryDao.class);
        
        int result =  icd.update(ce);
        
        closeSession();
        
        return result;
    }
    
    public int deleteCategory(int id) {
        ICategoryDao icd = getSession().getMapper(ICategoryDao.class);
        
        int result =  icd.delete(id);
        
        closeSession();
        
        return result;
    }
    
    public String getTitleById(List categoryList, int id) {
        Iterator itr = categoryList.iterator();
        while (itr.hasNext()) {
            CategoryEntity ce = (CategoryEntity) itr.next();
            if( id == ce.getId()) {
                return ce.getTitle();
            }
        }
        return "null";
    }
}
