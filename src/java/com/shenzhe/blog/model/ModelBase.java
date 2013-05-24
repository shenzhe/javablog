/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.model;

import com.shenzhe.blog.common.DataBatisSource;
import org.apache.ibatis.session.SqlSession;

/**
 *
 * @author mac
 */
public class ModelBase {
    protected SqlSession session = null;
    
    protected ModelBase(){
        setSession(DataBatisSource.getConn());
    }
    
    /**
     * @return the session
     */
    protected SqlSession getSession() {
        if(session == null) {
            setSession(DataBatisSource.getConn());
        }
        return session;
    }

    /**
     * @param session the session to set
     */
    private void setSession(SqlSession session) {
        this.session = session;
    }
    
    protected void closeSession(){
        DataBatisSource.closeConn(getSession());
        session = null;
    }
    
}
