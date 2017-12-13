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
public class InformacionLaboral {
    
    private String nombre;
    private String parentesco;
    private String fechaNac;
    private String ocupacion;
    private String ingresos;

    public InformacionLaboral() {
    }

    public InformacionLaboral(String nombre, String parentesco, String fechaNac, String ocupacion, String ingresos) {
        this.nombre = nombre;
        this.parentesco = parentesco;
        this.fechaNac = fechaNac;
        this.ocupacion = ocupacion;
        this.ingresos = ingresos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getIngresos() {
        return ingresos;
    }

    public void setIngresos(String ingresos) {
        this.ingresos = ingresos;
    }

    @Override
    public String toString() {
        return "InformacionLaboral{" + "nombre=" + nombre + ", parentesco=" + parentesco + ", fechaNac=" + fechaNac + ", ocupacion=" + ocupacion + ", ingresos=" + ingresos + '}';
    }
    
    
    
}
