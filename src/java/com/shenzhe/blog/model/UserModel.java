/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.model;

import com.shenzhe.blog.common.DataBatisSource;
import com.shenzhe.blog.entity.UserEntity;
import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

/**
 *
 * @author shenzhe
 */
public class UserModel {
    
    public UserEntity getUser(String username) {
        SqlSession session = null;
        session = DataBatisSource.getConn();
        Map searchMap = new HashMap();
        searchMap.put("username", username);
        UserEntity user = (UserEntity) session.selectOne("selectUser", searchMap);
        if(null != session) {
            session.close();
        }
        return user;
    }
    
    public String verify(String username, String password) {
        String result = "ERROR";
        UserEntity user = getUser(username);
        if(null == user) {
            result = "NOUSER";
        }else if(user.getId() == 0) {
            result = "NOUSER";
        } else if(password.equals(user.getPassword())) {
            result = "OK";
        } else {
            result = "PWDERROR";
        }
        
        return result;
    }
    
    public static void main(String[] args) {
		// TODO Auto-generated method stub
        String result=new UserModel().verify("shenzhe1", "1234567");
        System.out.println(result);
    }
}
