<%-- 
    Document   : Validar
    Created on : 10-oct-2014, 19:31:30
    Author     : Batcave
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <% 
             for(int i=1;i<5;i++){
                out.println("<div class=6u><input type=checkbox value=1>Gusto"+i+"</div>");
             }
          %>   
        
         
    </body>
</html>
