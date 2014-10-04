<%-- 
    Document   : ValidarClases
    Created on : 28-ago-2014, 23:05:31
    Author     : Batcave
--%>

<%@page import="Persistencia.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%
        Clientes newClient = new Clientes();
        newClient.setNombre(request.getParameter("name"));
        newClient.setApellido(request.getParameter("surname"));
        newClient.setDireccion(request.getParameter("address"));
       
        //Mejorar esto luego
         newClient.registroCliente();
        //Todavia no valido nada
        //Realizo la consulta sin validar datos y luego redirecciono al index
        %><script>window.location.href='index.jsp';</script><%
        
       
    
    %>
    
   
</html>
