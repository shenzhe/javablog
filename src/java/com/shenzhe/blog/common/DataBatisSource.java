/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.common;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 *
 * @author shenzhe
 */
public class DataBatisSource {
    
    
    
    private DataBatisSource() {
//        String resource = "com/shenzhe/blog/mappers/configuration.xml";
//        SqlSessionFactory factory = null;
//        
//
//        try {
//            Reader reader = Resources.getResourceAsReader(resource);
//            factory = new SqlSessionFactoryBuilder().build(reader);
//            session = factory.openSession();
//            
//        } catch (IOException e) {
//            e.printStackTrace();
//        } 
    }
    
    public static SqlSession getConn() {
        String resource = "com/shenzhe/blog/mappers/configuration.xml";
        SqlSessionFactory factory = null;
        SqlSession session = null;

        try {
            Reader reader = Resources.getResourceAsReader(resource);
            factory = new SqlSessionFactoryBuilder().build(reader);
            session = factory.openSession();

        } catch (IOException e) {
            e.printStackTrace();
        } 
        
        return session; 
    }
    
    public static void closeConn(SqlSession session) {
        if(session != null) {
            session.close();
        }
    }
    
}
