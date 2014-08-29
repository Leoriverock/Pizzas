/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Batcave
 */
public class ManejadorBD {
    private final static String driver = "com.mysql.jdbc.Driver";
    private final static String bd = "jdbc:mysql://localhost:3306/base1";
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
}
