  import java.sql.*;
  import java.util.*;


   public class ConnectionManager {

      static Connection con;
      static String url;
            
      public static Connection getConnection()
      {
        
         try{
            String url="jdbc:mysql://localhost/user", user="root", pass="n0m3l0";
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
try
{
 con = DriverManager.getConnection(url, user, pass);     
 }
            
            catch (SQLException ex)
            {
               ex.printStackTrace();
            }
         }

         catch(ClassNotFoundException e)
         {
            System.out.println(e);
         }

      return con;
}
   }
