/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.common;

import com.shenzhe.blog.entity.UserEntity;
import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



/**
 *
 * @author shenzhe
 */
public class Mybatis {
    public static void main(String[] args) {
        String resource = "com/shenzhe/blog/mappers/configuration.xml";
        SqlSessionFactory factory = null;
        SqlSession session = null;

        try {
            Reader reader = Resources.getResourceAsReader(resource);
            factory = new SqlSessionFactoryBuilder().build(reader);
            session = factory.openSession();
            Map searchMap = new HashMap();
            searchMap.put("username", "shenzhe");
            searchMap.put("password", "123456");
            UserEntity user = (UserEntity) session.selectOne("selectUser", searchMap);
            System.out.println(user);
            if(user == null) {
                System.out.println("error");
            } else {
                System.out.println("user:"+user.getUsername());
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if( null != session) {
                session.close();
            }
        }
    }
}
