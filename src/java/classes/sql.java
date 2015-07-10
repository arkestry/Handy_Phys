/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ivan
 */
public class sql {
    
public static Connection conectar(String url, String user, String Pass){
    Connection con = null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, Pass);
    }catch(Exception e){
        e.printStackTrace();
    }
    return con;
}
public static Connection conectar(){
    Connection con = null;
    String url = "jdbc:mysql://localhost/zigma";
    String user = "root";
    String Pass = "2014090332";
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, Pass);
    }catch(Exception e){
        e.printStackTrace();
    }
    return con;
}
    
}
