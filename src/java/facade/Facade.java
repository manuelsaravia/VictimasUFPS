/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import controller.Controler;
import dto.Actividad;
import dto.Estudiante;

/**
 *
 * @author j_saravia
 */
public class Facade {
    
    public String iniciarSesion(String user, String pass){
        Controler c = new Controler();
        return c.iniciarSesion(user,pass);
    }
    
    public String cargarRegistroEstudiante(){
        Controler c = new Controler();
        return c.cargarRegistroEstudiante();
    }
    public String registrarEstudiante(Estudiante e){
        Controler c = new Controler();
        return c.registrarEstudiante(e);
    }
    
    public String crearSemestre(String fecha){
        Controler c = new Controler();
        return c.crearSemestre(fecha);
    }
    
    public String registrarActividad(Actividad a){
        Controler c = new Controler();
        return c.registrarActividad(a);
    }
    
    public String cargarEstudiante(String doc){
        Controler c=new Controler();
        return c.cargarEstudiante(doc);
    }
    
    public String cargarEstudiante2(String doc){
        Controler c=new Controler();
        return c.cargarEstudiante2(doc);
    }
    
    public String cargarEstudiante3(String doc){
        Controler c=new Controler();
        return c.cargarEstudiante3(doc);
    }
    
    public String cargarActividades(){
        Controler c = new Controler();
        return c.cargarActividades();
    }
    public String cargarActividadesFin(){
        Controler c = new Controler();
        return c.cargarActividadesFin();
    }
    public String cargarActividadesHis(){
        Controler c = new Controler();
        return c.cargarActividadesHis();
    }
    public String cargarActividadesLis(){
        Controler c = new Controler();
        return c.cargarActividadesLis();
    }
    
    public String iniciarActividad(String index){
        Controler c = new Controler();
        return c.iniciarActividad(index);
    }
    public String finalizarActividad(String index){
        Controler c = new Controler();
        return c.finalizarActividad(index);
    }
    
    public String subirAnexo(String tipo, String nombre, String idEstudiante,String doc){
        Controler c = new Controler();
        return c.subirAnexo(tipo,nombre,idEstudiante,doc);  
    }
     public String actualizarEstudiante(String doc, String campo, String valor){
        Controler c = new Controler();
        return c.actualizarEstudiante(doc,campo,valor);  
    }
     
     public String cargarListado(String index){
         Controler c = new Controler();
         return c.cargarListado(index);
     }
     
     public String guardarListado(String est, String id){
         Controler c = new Controler();
         return c.guardarListado(est, id);
     }
     
     public String guardarAcompanamiento(String doc, String id){
          Controler c = new Controler();
         return c.guardarAcompanamiento(doc, id);
     }
     
     public String cargarSemestres(){
          Controler c = new Controler();
         return c.cargarSemestres();
     }
     public String guardarSemestres(String sems){
          Controler c = new Controler();
         return c.guardarSemestres(sems);
     }
     
     public String cargarEstudiantesSemestreNew(){
         Controler c = new Controler();
         return c.cargarEstudiantesSemestreNew();
     }
     
     public String guardarEstudiantesSemestreNew(String est, String id){
         Controler c = new Controler();
         return c.guardarEstudiantesSemestresNew(est, id);
     }
     
     public String cargarSeguimiento(String id){
         Controler c = new Controler();
         return c.cargarSeguimiento(id);
     }
     
     public String guardarSeguimiento(String txt){
         Controler c = new Controler();
         return c.guardarSeguimiento(txt);
     }
     
     public String cargarAprobados(){
         Controler c = new Controler();
         return c.cargarAprobados();
     }
     
     public String asistenciasxactividad(){
         Controler c = new Controler();
         return c.asistenciasxactividad();
     }
     
     public String asistenciasxactividadHis(){
         Controler c = new Controler();
         return c.asistenciasxactividadHis();
     }
     
      public String actividadesxsemestre(){
         Controler c = new Controler();
         return c.actividadesxsemestre();
     }
     
      public String estudiantesxsemestre(){
         Controler c = new Controler();
         return c.estudiantesxsemestre();
     }
      
      public String listadoEstudiantes(){
         Controler c = new Controler();
         return c.listadoEstudiantes();
     }
      
       public String listadoEstudiantesAct(){
         Controler c = new Controler();
         return c.listadoEstudiantesAct();
     }
}
