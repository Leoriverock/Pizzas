<%-- 
    Document   : ValidarUsuario
    Created on : 07-oct-2014, 23:34:07
    Author     : Batcave
--%>

<%@page import="Persistencia.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <% Clientes cliente = new Clientes();
           String usuario = request.getParameter("name");
       
            if(cliente.existeCliente(usuario)){
                 out.println("<div id=\"Error\">El cliente ya existe</div>");
                                  }
            else{
                out.println("<div id='Success'>El cliente no existe</div>");
            }
         %>   
    </body>
</html>
