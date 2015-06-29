
   import java.text.*;
   import java.util.*;
   import java.sql.*;
public class UserDAO 	
   {
  
      static Connection currentCon = null;
      static ResultSet rs = null;  
	
	
	
      public static UserBean login(UserBean bean) {
	
         //Preparando objetos para la conexion
         Statement stmt = null;    
	
         String username = bean.getUsername();    
         String password = bean.getPassword();   
	    
         String searchQuery =
               "select * from users where username='"
                        + username
                        + "' AND password='"
                        + password
                        + "'";
	    
      // 
      System.out.println("Tu nombre es  " + username);          
      System.out.println("Tu contraseña es " + password);
      System.out.println("Query: "+searchQuery);
	    
      try 
      {
         //conectar a base de datos
         currentCon = ConnectionManager.getConnection();
         stmt=currentCon.createStatement();
         rs = stmt.executeQuery(searchQuery);	        
         boolean more = rs.next();
	       
         // Si el usuario no existe estableces la variable isValid para que se convierta en falso
         if (!more) 
         {
            System.out.println("Sorry, Aun no te has regitrado! Por favor registrate primero");
            bean.setValid(false);
         } 
	        
         //Si el usuario existe en necesario estableces la variable isValid para que se convierta en verdadero
         else if (more) 
         {
            String firstName = rs.getString("FirstName");
            String lastName = rs.getString("LastName");
	     	
            System.out.println("Welcome " + firstName);
            bean.setFirstName(firstName);
            bean.setLastName(lastName);
            bean.setValid(true);
         }
      } 

      catch (Exception ex) 
      {
         System.out.println("Logeo fallido. Una excepcion ha ocurrido! " + ex);
      } 
	    
      //Algunas excepciones
      finally 
      {
         if (rs != null)	{
            try {
               rs.close();
            } catch (Exception e) {}
               rs = null;
            }
	
         if (stmt != null) {
            try {
               stmt.close();
            } catch (Exception e) {}
               stmt = null;
            }
	
         if (currentCon != null) {
            try {
               currentCon.close();
            } catch (Exception e) {
            }

            currentCon = null;
         }
      }

return bean;
	
      }	
   }