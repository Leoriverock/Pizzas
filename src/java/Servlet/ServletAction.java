/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Persistencia.Clientes;
import Persistencia.ManejadorBD;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Batcave
 */
@WebServlet(name = "ServletAction", urlPatterns = {"/ServletAction"})
public class ServletAction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
           
      
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ManejadorBD mbd = ManejadorBD.getInstancia();
            //Clientes cliente = new Clientes();
            String usuario = request.getParameter("names");
            ResultSet rs = mbd.ajaxClientes(usuario);
            if(rs!=null){
                try {
                    while(rs.next()){
                        out.println("<div id='suggest-element'><a data='"+rs.getObject(2)+"' id="+rs.getObject(1)+">"+rs.getObject(2)+' '+rs.getString(3)+"</a></div>");
                        System.out.println(rs.getObject(1));
                                }

                } catch (SQLException ex) {
                    //Logger.getLogger(ServletAction.class.getName()).log(Level.SEVERE, null, ex);
                    out.println("<div id='suggest-element'>No Existe</div>");
                }
            }else{
                out.println("<div id='suggest-element'>No Existe</div>");
            }
            /*if(cliente.existeCliente(usuario)){
                out.println("<div id='Success'>Existe </div>");
                }
                else{
                out.println("<div id='Error'>No Existe</div>");
                }*/
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
