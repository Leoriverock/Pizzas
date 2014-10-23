<%-- 
    Document   : Validar
    Created on : 10-oct-2014, 19:31:30
    Author     : Batcave
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Persistencia.ManejadorBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        <%    ManejadorBD mbd = ManejadorBD.getInstancia();
        %>
    </head>
    <body>
         <% 
             String producto = request.getParameter("Prod");
             //System.out.println("fuckuo"+producto);
             ResultSet gustos = mbd.listarGustos();
             while(gustos.next()){
                out.println("<div class=6u><input type=checkbox value=1>"+gustos.getObject("nombre_gusto")+"</div>");
             }
             
          %>   
        
         
    </body>
</html>
