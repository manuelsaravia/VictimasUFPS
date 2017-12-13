/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.ArrayList;

/**
 *
 * @author Manuel
 */
public class Estudiante {
    
    private String nombre;
    private String apellido;
    private int codigo;
    private String documento;
    private String lugarExpedicion;
    private String fechaNac;
    private String municipioNacimiento;
    private String direccionResidencia;
    private String municipioResidencia;
    private int estrato;
    private String estadoCivil;
    private int numeroHijos;
    private boolean grupoEtnico;
    private String email;
    private String telefono;
    private boolean mujerCabeza;
    private ArrayList<Discapacidad> discapacidades = new ArrayList();
    private boolean estadoActivo;
    private ProgramaAcademico programa;
    private Acudiente acudiente;
    private Responsable responsable;
    private NucleoFamiliar nucleo;
    private ArrayList<InformacionLaboral> informacionLaboral = new ArrayList();
    private Acuerdo acuedo;
    private boolean trabaja;
    private String lugarTrabajo;
    private double presupuestoMensual;
    private String comoSostiene;
    private String observaciones;
    private String situacionPsicologica;
    private String riesgosPermanencia;
    private String hechoVictimizante;
    private String acuerdo;
    

    public Estudiante() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getHechoVictimizante() {
        return hechoVictimizante;
    }

    public String getLugarExpedicion() {
        return lugarExpedicion;
    }

    public void setLugarExpedicion(String lugarExpedicion) {
        this.lugarExpedicion = lugarExpedicion;
    }

    public void setHechoVictimizante(String hechoVictimizante) {
        this.hechoVictimizante = hechoVictimizante;
    }

    public String getAcuerdo() {
        return acuerdo;
    }

    public void setAcuerdo(String acuerdo) {
        this.acuerdo = acuerdo;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getMunicipioNacimiento() {
        return municipioNacimiento;
    }

    public void setMunicipioNacimiento(String municipioNacimiento) {
        this.municipioNacimiento = municipioNacimiento;
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

    public int getEstrato() {
        return estrato;
    }

    public void setEstrato(int estrato) {
        this.estrato = estrato;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public int getNumeroHijos() {
        return numeroHijos;
    }

    public void setNumeroHijos(int numeroHijos) {
        this.numeroHijos = numeroHijos;
    }

    public String getGrupoEtnico() {
        if(grupoEtnico)
            return "T";
        return "F";
    }

    public void setGrupoEtnico(boolean grupoEtnico) {
        this.grupoEtnico = grupoEtnico;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getMujerCabeza() {
        if(mujerCabeza)
            return "T";
        return "F";
    }

    public void setMujerCabeza(boolean mujerCabeza) {
        this.mujerCabeza = mujerCabeza;
    }

    public ArrayList<Discapacidad> getDiscapacidades() {
        return discapacidades;
    }

    public void setDiscapacidades(ArrayList<Discapacidad> discapacidades) {
        this.discapacidades = discapacidades;
    }

    public String getEstadoActivo() {
        if(this.estadoActivo){
            return "T";
        }
        return "F";
    }

    public void setEstadoActivo(boolean estadoActivo) {
        this.estadoActivo = estadoActivo;
    }

    public ProgramaAcademico getPrograma() {
        return programa;
    }

    public void setPrograma(ProgramaAcademico programa) {
        this.programa = programa;
    }

    public Acudiente getAcudiente() {
        return acudiente;
    }

    public void setAcudiente(Acudiente acudiente) {
        this.acudiente = acudiente;
    }

    public Responsable getResponsable() {
        return responsable;
    }

    public void setResponsable(Responsable responsable) {
        this.responsable = responsable;
    }

    public NucleoFamiliar getNucleo() {
        return nucleo;
    }

    public void setNucleo(NucleoFamiliar nucleo) {
        this.nucleo = nucleo;
    }

    public ArrayList<InformacionLaboral> getInformacionLaboral() {
        return informacionLaboral;
    }

    public void setInformacionLaboral(ArrayList<InformacionLaboral> informacionLaboral) {
        this.informacionLaboral = informacionLaboral;
    }

    public String getTrabaja() {
        if(trabaja)
            return "T";
        return "F";
    }

    public void setTrabaja(boolean trabaja) {
        this.trabaja = trabaja;
    }

    public String getLugarTrabajo() {
        return lugarTrabajo;
    }

    public void setLugarTrabajo(String lugarTrabajo) {
        this.lugarTrabajo = lugarTrabajo;
    }

    public double getPresupuestoMensual() {
        return presupuestoMensual;
    }

    public void setPresupuestoMensual(double presupuestoMensual) {
        this.presupuestoMensual = presupuestoMensual;
    }

    public String getComoSostiene() {
        return comoSostiene;
    }

    public void setComoSostiene(String comoSostiene) {
        this.comoSostiene = comoSostiene;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getSituacionPsicologica() {
        return situacionPsicologica;
    }

    public void setSituacionPsicologica(String situacionPsicologica) {
        this.situacionPsicologica = situacionPsicologica;
    }

    public String getRiesgosPermanencia() {
        return riesgosPermanencia;
    }

    public void setRiesgosPermanencia(String riesgosPermanencia) {
        this.riesgosPermanencia = riesgosPermanencia;
    }

   
    
    public void addDiscapacidad(String nom, boolean val){
        Discapacidad aux = new Discapacidad(nom, val);
        this.discapacidades.add(aux);
    }
    
    public void addLaboral(String nom, String paren, String nac, String ocu, String ingre){
        InformacionLaboral aux = new InformacionLaboral(nom,paren,nac,ocu,ingre);
        this.informacionLaboral.add(aux);
    }
    
    public void addLaboral2(String ingresos){
        String todos[] = ingresos.split("#-#");
        for(String linea: todos){
            String [] per = linea.split("##");
            System.out.println(per[4] + "        estudiante");
            InformacionLaboral aux = new InformacionLaboral(per[0],per[1], per[2],per[3],per[4]);
            this.informacionLaboral.add(aux);
        }
    }
    
    public String getValorDiscapacidad(String dis){
        String d = "";
        for(Discapacidad dd: this.discapacidades){
            if(dd.getNombre().equals(dis)){
                if(dd.isValor()){
                    d = "T";
                }
                else{
                    d= "F";
                }
            }
        }
        return d;
    }

    @Override
    public String toString() {
        return "Estudiante{" + "nombre=" + nombre + ", apellido=" + apellido + ", codigo=" + codigo + ", documento=" + documento + ", fechaNac=" + fechaNac + ", municipioNacimiento=" + municipioNacimiento + ", direccionResidencia=" + direccionResidencia + ", municipioResidencia=" + municipioResidencia + ", estrato=" + estrato + ", estadoCivil=" + estadoCivil + ", numeroHijos=" + numeroHijos + ", grupoEtnico=" + grupoEtnico + ", email=" + email + ", telefono=" + telefono + ", mujerCabeza=" + mujerCabeza + ", discapacidades=" + discapacidades + ", estadoActivo=" + estadoActivo + ", programa=" + programa + ", acudiente=" + acudiente + ", responsable=" + responsable + ", nucleo=" + nucleo + ", informacionLaboral=" + informacionLaboral + ", trabaja=" + trabaja + ", lugarTrabajo=" + lugarTrabajo + ", presupuestoMensual=" + presupuestoMensual + ", comoSostiene=" + comoSostiene + ", observaciones=" + observaciones + ", situacionPsicologica=" + situacionPsicologica + ", riesgosPermanencia=" + riesgosPermanencia + ", hechoVictimizante=" + hechoVictimizante + ", acuerdo=" + acuerdo + '}';
    }
    
    public void add(Discapacidad d){
        boolean b = this.discapacidades.add(d);
    }
}
