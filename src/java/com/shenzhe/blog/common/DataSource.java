/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.common;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shenzhe
 */
public class DataSource {
//    private static Connection conn;
    
    private DataSource() {
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/j_blog?useUnicode=true&charaterEncoding=utf-8","j_blog","123456");
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DataSource.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DataSource.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }
    
    public static Connection getConn() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/j_blog?useUnicode=true&charaterEncoding=utf-8","root","123456");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataSource.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DataSource.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    
    public static int updateSql(String sql) {
        Statement st = null;
        Connection conn = null;
        int result = 0;
        try {
            conn = getConn();
            st = (Statement) conn.createStatement();
            result = st.executeUpdate(sql);
        } catch (SQLException ex) {
            
        } finally {
             try {
                if(null != st) st.close();
                closeConn(conn);
            } catch (SQLException ex) {
                
            }
        }
        
        return result;
    }
    
    public static void closeConn(Connection conn) {
        if(null != conn) {
            try {
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataSource.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
}
