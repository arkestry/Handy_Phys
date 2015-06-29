<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
%>


<html>
	<head>
      <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Login Page</title>
	</head>

	<body>
		<form action="LoginServlet">

			Please enter your username 		
			<input type="text" name="un"/><br>		
		
			Please enter your password
			<input type="password" name="pw"/>
			
			<input type="submit" value="submit">			
		
		</form>
	</body>
</html>


<!-- En este caso la base de datos es: 
create database login;
use login;
create table user (FirstName varchar(30), LastName varchar (30), username varchar (30),  password varchar (20));

Solo hay que cambiar de acuerdo a la base de datos de zigma
-->

<!--
Estuve checando esta informaci?n para hacer mejor el login
Explicacion de las clases

La clase UserBean se utiliza para guardar los datos necesarios en la aplicacion (en forma de variables). 
Estos datos son una representaci?n de los datos existentes en la base de datos

La clase UserDAO son objetos responsables de la manipulaci?n de las interacciones con el origen de datos,
a través de la aplicaci?n el mecanismo da acceso requerido para trabajar con la fuente de datos.

Esto sirve para Lectura de los datos de los datos (datos introducidos por el usuario) y comprobar su coherencia con el PP - 
use Getters para obtener valores de las variables del Bean.
Recuperando datos de la DB y guardarlo en el Bean - utilize metodos Setter para establecer valores. 
-->