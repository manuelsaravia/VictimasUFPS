/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author Manuel
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here 1094270060;Rubiela Alejandra Andrade;alejandrandrade7@gmail.com
//        Conexion c = new Conexion();
//        c.conectar();
//        c.desconectar();
        ServicioEmail e = new ServicioEmail("VICTIUFPS@GMAIL.COM","victimas2017*");
        e.enviarEmail("manuel.saravia.bulla@gmail.com", "Prueba", "Desde aplicativo web");
    }
    
}
