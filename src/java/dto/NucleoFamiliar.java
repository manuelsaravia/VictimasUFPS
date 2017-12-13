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
public class NucleoFamiliar {
    
    private int numeroHermanos;
    private int posicionHermanos;
    private String direccionResidencia;
    private String municipioResidencia;
    private int estratoFamiliar;
    private String tipoVivienda;
    private String tendenciaFamiliar;
    private String telefonoFamiliar;
    private String permanenciaVivienda;
    private String zonaUbicacion;

    public NucleoFamiliar() {
    }

    public int getNumeroHermanos() {
        return numeroHermanos;
    }

    public void setNumeroHermanos(int numeroHermanos) {
        this.numeroHermanos = numeroHermanos;
    }

    public String getTipoVivienda() {
        return tipoVivienda;
    }   

    public String getZonaUbicacion() {
        return zonaUbicacion;
    }

    public void setZonaUbicacion(String zonaUbicacion) {
        this.zonaUbicacion = zonaUbicacion;
    }

    public void setTipoVivienda(String tipoVivienda) {
        this.tipoVivienda = tipoVivienda;
    }

    public String getTelefonoFamiliar() {
        return telefonoFamiliar;
    }

    public void setTelefonoFamiliar(String telefonoFamiliar) {
        this.telefonoFamiliar = telefonoFamiliar;
    }

    public int getPosicionHermanos() {
        return posicionHermanos;
    }

    public void setPosicionHermanos(int posicionHermanos) {
        this.posicionHermanos = posicionHermanos;
    }

    public String getDireccionResidencia() {
        return direccionResidencia;
    }

    public void setDireccionResidencia(String direccionResidencia) {
        this.direccionResidencia = direccionResidencia;
    }

    public String getMunicipioResidencia() {
        return municipioResidencia;
    }

    public void setMunicipioResidencia(String municipioResidencia) {
        this.municipioResidencia = municipioResidencia;
    }

    public int getEstratoFamiliar() {
        return estratoFamiliar;
    }

    public void setEstratoFamiliar(int estratoFamiliar) {
        this.estratoFamiliar = estratoFamiliar;
    }

    public String getTendenciaFamiliar() {
        return tendenciaFamiliar;
    }

    public void setTendenciaFamiliar(String tendenciaFamiliar) {
        this.tendenciaFamiliar = tendenciaFamiliar;
    }

    public String getPermanenciaVivienda() {
        return permanenciaVivienda;
    }

    public void setPermanenciaVivienda(String permanenciaVivienda) {
        this.permanenciaVivienda = permanenciaVivienda;
    }

   
    
    
}
