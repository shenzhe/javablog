/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.model;

import com.shenzhe.blog.dao.ILinkDao;
import com.shenzhe.blog.entity.LinkEntity;
import java.util.Iterator;
import java.util.List;



/**
 *
 * @author shenzhe
 */
public class LinkModel extends ModelBase {
    
    
    
    
    public List getList() {
        
         
        ILinkDao icd = getSession().getMapper(ILinkDao.class);
        
        List<LinkEntity> celist = icd.selectList();
        
        closeSession();
        
        return celist;
        
        
    }
    
    public LinkEntity getLink(int id) {
        
        ILinkDao icd = getSession().getMapper(ILinkDao.class);
        
        LinkEntity ce = icd.selectOne(id);
        
        closeSession();
        
        return ce;
    }
    
    public int addLink(LinkEntity ce) {
        ILinkDao icd = getSession().getMapper(ILinkDao.class);
        
        int result =  icd.insert(ce);
        
        closeSession();
        
        return result;
    }
    
    public int updateLink(LinkEntity ce) {
        ILinkDao icd = getSession().getMapper(ILinkDao.class);
        
        int result =  icd.update(ce);
        
        closeSession();
        
        return result;
    }
    
    public int deleteLink(int id) {
        ILinkDao icd = getSession().getMapper(ILinkDao.class);
        
        int result =  icd.delete(id);
        
        closeSession();
        
        return result;
    }
}
