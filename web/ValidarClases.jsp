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
        if(request.getParameter("name") == ""){
            %><script>alert("Nombre no puede ser vacio.");</script><%
               }    
        if(request.getParameter("surname") == ""){
                %><script>alert("Apellido no puede ser vacio.");</script><%
               }
        if(request.getParameter("address") == ""){
                %><script>alert("Direccion no puede ser vacio.");</script><%
               }
        if(request.getParameter("address") != ""){
              if(request.getParameter("surname") != ""){
                  if(request.getParameter("name") != ""){
                       newClient.registroCliente();
                       %><script>window.location.href='index.jsp';</script><%
                  }
              }
         } 
        //Todavia no valido nada
        //Realizo la consulta sin validar datos y luego redirecciono al index
        %><script>window.location.href='index.jsp';</script><%
        
       
    
    %>
    
   
</html>
