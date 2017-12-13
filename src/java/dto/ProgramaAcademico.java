/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Manuel
 */
public class ProgramaAcademico {
    
    private String nombre;
    private String modalidad;
    private String jornada;
    private String semestreQueEntro;
    private String grupoPerteneciente;

    public ProgramaAcademico() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getModalidad() {
        return modalidad;
    }

    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    public String getJornada() {
        return jornada;
    }

    public void setJornada(String jornada) {
        this.jornada = jornada;
    }

    public String getSemestreQueEntro() {
        return semestreQueEntro;
    }

    public void setSemestreQueEntro(String semestreQueEntro) {
        this.semestreQueEntro = semestreQueEntro;
    }

    public String getGrupoPerteneciente() {
        return grupoPerteneciente;
    }

    public void setGrupoPerteneciente(String grupoPerteneciente) {
        this.grupoPerteneciente = grupoPerteneciente;
    }
    
    
    
}
