/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Batcave
 */
public class ManejadorBD {
    private final static String driver = "com.mysql.jdbc.Driver";
    private final static String bd = "jdbc:mysql://localhost:3306/imperium";
    private final static String usuario = "root";
    private final static String password = "root";
    
    private Connection conexion;
    private java.sql.Statement st;
    private static ManejadorBD instancia = null;
    
    public static ManejadorBD getInstancia(){
        if(instancia == null){
            instancia = new ManejadorBD();
        }
        return instancia;
    }
    
    private ManejadorBD() {
        try{
            Class.forName(driver);
            conexion = DriverManager.getConnection(bd, usuario, password);
            st = conexion.createStatement();
            System.out.println("Conexion exitosa");
        }
        catch(Exception ex){
            System.out.println("Error de conexion: "+ex.toString());
        }
    }
    public java.sql.Statement getStatement(){
        return st;
    }
    
    //Insert de clientes
    public void registroCliente(String nombre, String apellido, String direccion){
         try {
            st.executeUpdate("insert into clientes (nombre, apellido, direccion) values ('"+nombre+"','"+apellido+"','"+direccion+"')");
            
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
    }
    //Select de clientes
    public ResultSet listarClientes(){
        try {
            ResultSet rs = st.executeQuery("select * FROM clientes");
             return rs;
        } catch (SQLException ex) {
            System.out.println("No hay clientes aun");
            return null;
        }
    }
    //Ajax function clientes autocompleta
    public ResultSet ajaxClientes(String name){
        ResultSet rs = null;
        try {
             rs = st.executeQuery("select * from clientes where nombre_cliente like '"+name+"%'");
             if(rs==null) rs=null;            
             
        } catch (SQLException ex) {
            Logger.getLogger(ManejadorBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
        
    
    }
    //Chequeo si cliente existe - prueba ajax blur
    public boolean existeCliente(String name){
        boolean flag = false;
        try {
            ResultSet rs = st.executeQuery("select * from clientes where nombre_cliente like '"+name+"%'");
            while(rs.next()){
              if(rs!=null)
                  flag = true;
              else
                  flag = false;
            } 
        } catch (SQLException ex) {
             Logger.getLogger(Clientes.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("showtime: "+flag);
        return flag;
       
    }
    //Select gustos
    public ResultSet listarGustos(){
        try {
            ResultSet rs = st.executeQuery("select * FROM gustos");
             return rs;
        } catch (SQLException ex) {
            System.out.println("No hay gustos aun");
            return null;
        }
    }
    //Listar productos simples y compuestos
    public ResultSet listarProductos(){
        try {
            ResultSet rs = st.executeQuery("select * FROM productos_simples UNION select * FROM productos_compuestos");
             return rs;
        } catch (SQLException ex) {
            System.out.println("No hay productos aun");
            return null;
        }
    }
    
}
