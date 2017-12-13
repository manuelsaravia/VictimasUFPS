/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;
import com.mysql.jdbc.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Manuel
 */
public class Conexion {
    /*private String bd = "ufps_10";
    private String direccion="jdbc:mysql://sandbox2.ufps.edu.co:3306/"+bd;
    private String direccion2="jdbc:mysql://localhost:3306/";
    private String user="ufps_10";
    private String password="ufps_g6";
    
    private String bd = "piipsoft_elephant";
    private String direccion="jdbc:mysql://readytoanswer.com:3306/"+bd;
    private String direccion2="jdbc:mysql://localhost:3306/";
    private String user="piipsoft_dumbo";
    private String password="4442414a53";
    */
    
    private String bd = "victimas";
    private String direccion="jdbc:mysql://localhost:3306/"+bd;
    private String direccion2="jdbc:mysql://localhost:3306/";
    private String user="victiufps";
    private String password="victimas";
   
    private java.sql.Connection con;
    
    public Conexion(){}

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion() {
        this.direccion = direccion2;
    }

    public void setBaseDatos() {
        this.direccion = direccion+bd;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void conectar(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
        try {
            this.con=DriverManager.getConnection(direccion, user, password);
            System.out.println("conecto");
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    
    public void desconectar(){
        try {
            this.con.close();
            System.out.println("desconecto");
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public java.sql.Connection getConexion(){
        return con;
    }
    
}
