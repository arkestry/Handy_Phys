/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ivan
 */
public class getHTML {
   protected static Connection con;
    getHTML(){
        con = sql.conectar();
    }
    public static String obtenerURL(String correoQueLoPublico, String titulo, String fecha) throws SQLException{
        con = sql.conectar();
        String url ="";
        String finalUrl ="";
        int idUsuario = getIdUsuario(con, correoQueLoPublico);
        int tipo = 0;
        PreparedStatement ps = con.prepareStatement("call obtenDatosArt(?,?,?);");
        ps.setInt(1, idUsuario);
        ps.setString(2, titulo);
        ps.setString(3, fecha);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
           tipo = (int)rs.getObject("idTipoCont");
           url = (String)rs.getObject("url");
        }
        if(tipo == 1){
            finalUrl = "../articulos/"+url;
        }else{
            if(tipo == 2){
                finalUrl = "../preguntas/"+url;
            }
        }
        return finalUrl;
    }
    public static String obtenerURL(int idUsuarioQueLoPublico, String titulo, String fecha) throws SQLException{
        con = sql.conectar();
        String url ="";
        String finalUrl ="";
        int idUsuario = idUsuarioQueLoPublico;
        int tipo = 0;
        PreparedStatement ps = con.prepareStatement("call obtenDatosArt(?,?,?);");
        ps.setInt(1, idUsuario);
        ps.setString(2, titulo);
        ps.setString(3, fecha);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
           tipo = (int)rs.getObject("idTipoCont");
           url = (String)rs.getObject("url");
        }
        if(tipo == 1){
            finalUrl = "../articulos/"+url;
        }else{
            if(tipo == 2){
                finalUrl = "../preguntas/"+url;
            }
        }
        return finalUrl;
    }
    public static String obtenerURL(int idArticulo) throws SQLException{
        con = sql.conectar();
        String url ="";
        String finalUrl ="";
        
        int tipo = 0;
        PreparedStatement ps = con.prepareStatement("call obtenDatosArtConID(?)");
        ps.setInt(1, idArticulo);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
           tipo = (int)rs.getObject("idTipoCont");
           url = (String)rs.getObject("url");
        }
        if(tipo == 1){
            finalUrl = "../articulos/"+url;
        }else{
            if(tipo == 2){
                finalUrl = "../preguntas/"+url;
            }
        }
        return finalUrl;
    }
    public static int getIdUsuario(Connection con, String correo) throws SQLException{
        int id = 0;
        PreparedStatement ps = con.prepareStatement("call obtenIdUsuario(?);");
        ps.setString(1, correo);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            id = (int)rs.getObject("idUsuario");
        }
        return id;
    }
}   
