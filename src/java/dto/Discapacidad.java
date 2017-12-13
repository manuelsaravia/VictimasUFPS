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
public class Discapacidad {
    
    private String nombre;
    private boolean valor;

    public Discapacidad() {
    }

    public Discapacidad(String nom, boolean val) {
        this.nombre = nom;
        this.valor = val;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isValor() {
        return valor;
    }

    public void setValor(boolean valor) {
        this.valor = valor;
    }
    
    
    
}
