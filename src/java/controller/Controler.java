/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AdministradorDao;
import dto.Actividad;
import dto.Estudiante;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Conexion;

/**
 *
 * @author j_saravia
 */
public class Controler {
    
    private Conexion c;
    private Connection co;

    /**
     * Metodo que establece la conexion con la base de datos
     */
    private void conectar() {
        //String bd = "reinouni_0001";
        this.c = new Conexion();
        //this.c.setDireccion();
        //this.c.setBaseDatos(bd);
        this.c.conectar();
        this.co = this.c.getConexion();
        System.out.println("Conecto");

    }

    /**
     * Metodo que finaliza la conexion con la base de datos
     */
    private void desconectar() {
        try {
            this.co.close();
            this.co = null;
            this.c.desconectar();
            System.out.println("desconecto");
        } catch (SQLException ex) {
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public String iniciarSesion(String user, String pass) {
        String mensaje = "";
        System.out.println(user);
        System.out.println(pass);
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.iniciarSesion(user,pass);
        System.out.println(mensaje + "controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String cargarRegistroEstudiante() {
       String mensaje = "";
       
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarRegistroEstudiante();
        System.out.println(mensaje + "controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    
    public String registrarEstudiante(Estudiante e) {
       String mensaje = "";
       
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.registrarEstudiante(e);
        System.out.println(mensaje + "controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    public String crearSemestre(String fecha) {
        String mensaje = "";
       
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.crearSemestre(fecha);
        System.out.println(mensaje + "controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String registrarActividad(Actividad a) {
        String mensaje = "";
       
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.registrarActividad(a);
        System.out.println(mensaje + "controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String cargarEstudiante(String doc) {
       String mensaje = "";
       
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarEstudiante(doc);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    
    public String cargarEstudiante2(String doc) {
       String mensaje = "";
       
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarEstudiante22(doc);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    
     public String cargarEstudiante3(String doc) {
       String mensaje = "";
       
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarEstudiante3(doc);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String cargarActividades() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarActividades();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String iniciarActividad(String index) {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.iniciarActividad(index);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String cargarActividadesFin() {
         String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarActividadesFin();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String finalizarActividad(String index) {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.finalizarActividad(index);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String cargarActividadesHis() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarActividadesHis();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    
    public String cargarActividadesLis() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarActividadesListado();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String subirAnexo(String tipo, String nombre, String idEstudiante,String doc) {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.subirAnexo(tipo,nombre,idEstudiante,doc);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String actualizarEstudiante(String doc, String campo, String valor) {
        String mensaje = "";
       
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.actualizarEstudiante(doc,campo,valor);
        System.out.println(mensaje + "controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    
    public String cargarListado(String index){
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarListado(index);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String guardarListado(String est, String id) {
         String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.guardarListado(est, id);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String guardarAcompanamiento(String doc, String id) {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.guardarAcompanamiento(doc, id);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String cargarSemestres() {
         String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarSemestres();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String guardarSemestres(String sems) {
         String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.guardarSemestres(sems);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String cargarEstudiantesSemestreNew() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarEstudiantesSemestreNew();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String guardarEstudiantesSemestresNew(String est, String id) {
       String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.guardarEstudiantesSemestreNew(est, id);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String cargarSeguimiento(String id) {
         String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarSeguimiento(id);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String guardarSeguimiento(String txt) {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.guardarSeguimiento(txt);
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String cargarAprobados() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.cargarAprobados();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String asistenciasxactividad() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.asistenciasxactividad();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    
     public String asistenciasxactividadHis() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.asistenciasxactividadHis();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    
    public String actividadesxsemestre() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.actividadesxsemestre();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    
    public String estudiantesxsemestre() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.estudiantesxsemestre();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }

    public String listadoEstudiantes() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.listadoEstudiantes();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
    
    public String listadoEstudiantesAct() {
        String mensaje = "";
        this.conectar();
        try {
            this.co.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("mensajeeeeeeeeeeeeee:     "+ex.getMessage());
            Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
        }
        AdministradorDao ud = new AdministradorDao(this.co);
        mensaje = ud.listadoEstudiantesAct();
        System.out.println(mensaje + "  controlller");
        if (mensaje.equals("error")) {
            try {
                co.rollback();
                mensaje = "error";
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                co.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Controler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.desconectar();

        return mensaje;
    }
}
