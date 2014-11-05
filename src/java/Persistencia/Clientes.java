/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Persistencia;
import Persistencia.ManejadorBD;
import javax.sql.*;
/**
 *
 * @author Batcave
 */
public class Clientes {

    public static void add(Clientes persona) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private String Nombre;
    private String Apellido;
    private String Direccion;
    
    ManejadorBD mbd = ManejadorBD.getInstancia();
    
    public void setNombre(String nombre) {
        this.Nombre = nombre;
    }
    public String getNombre(){
        return this.Nombre;
    }
    public void setApellido(String apellido){
        this.Apellido = apellido;
    }
    public String getApellido(){
        return this.Apellido;
    }
    public void setDireccion(String direccion){
        this.Direccion = direccion;
    }
    public String getDireccion(){
        return this.Direccion;
    }
    
    public void registroCliente(){
        mbd.registroCliente(this.getNombre(),this.getApellido(),this.getDireccion());
    }
    
    public boolean existeCliente(String name){
       return mbd.existeCliente(name);
    }
}
