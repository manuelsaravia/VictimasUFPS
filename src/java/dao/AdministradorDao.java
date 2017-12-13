/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Actividad;
import dto.Estudiante;
import dto.InformacionLaboral;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ServicioEmail;

/**
 *
 * @author j_saravia
 */
public class AdministradorDao {

    private Connection co;
    private ResultSet rs;
    private PreparedStatement ps;
    private Map<String, String> hm = new HashMap();

    public AdministradorDao(Connection c) {
        co = c;
        hm.put("1", "nombres");
        hm.put("2", "apellidos");
        hm.put("3", "codigo");
        hm.put("4", "direccionResidencia");
        hm.put("5", "municipioResidencia");
        hm.put("6", "estrato");
        hm.put("7", "estadoCivil");
        hm.put("8", "numeroHijos");
        hm.put("9", "sorderaProfunda");
        hm.put("10", "lesionMuscular");
        hm.put("11", "Hipoacusia");
        hm.put("12", "autismo");
        hm.put("13", "bajaVision");
        hm.put("14", "retraso");
        hm.put("15", "ceguera");
        hm.put("16", "down");
        hm.put("17", "mudez");
        hm.put("18", "paralisisCerebral");
        hm.put("19", "paralisisFisica");
        hm.put("20", "noAplica");
        hm.put("21", "noInforma");
        hm.put("22", "email");
        hm.put("23", "telefono");
        hm.put("24", "programaAcademico");
        hm.put("25", "grupoVictima");
        hm.put("26", "nombreAcudiente");
        hm.put("27", "telefonoAcudiente");
        hm.put("28", "direccionAcudiente");
        hm.put("29", "municipioAcudiente");
        hm.put("30", "funcionarioResponsable");
        hm.put("31", "telefonoFuncionario");
        hm.put("32", "direccionResidenciaResponsable");
        hm.put("33", "municipioResidenciaResponsable");
        hm.put("34", "cargoFuncionario");
        hm.put("35", "emailFuncionario");
        hm.put("36", "numeroHermanos");
        hm.put("37", "posicionHermanos");
        hm.put("38", "direccionFamiliar");
        hm.put("39", "municipioFamiliar");
        hm.put("40", "tipoViviendaFamiliar");
        hm.put("41", "estratoFamiliar");
        hm.put("42", "zonaViviendaFamiliar");
        hm.put("43", "tendenciaFamiliar");
        hm.put("44", "telefonoFamiliar");
        hm.put("45", "tiempoPermanenciaFamiliar");
        hm.put("46", "trabaja");
        hm.put("47", "lugarTrabajo");
        hm.put("48", "presupuestoMensual");
        hm.put("49", "sostiene");
        hm.put("50", "observacionesSostenimiento");
        hm.put("51", "situacionPsicologica");
        hm.put("52", "riesgosPermanencia");
    }

    public String iniciarSesion(String user, String pass) {
        String msg = "";
        System.out.println(user);
        System.out.println(pass);
        try {
            this.ps = this.co.prepareStatement("select idAdministrador,nombre from administrador where email=? and contrasenia=?;");
            this.ps.setString(1, user);
            this.ps.setString(2, pass);

            this.rs = this.ps.executeQuery();
            if (this.rs.next()) {
                msg = this.rs.getString(1) + "##";
                msg += this.rs.getString(2);
            } else {
                msg = "vacio";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            msg = "error";
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarRegistroEstudiante() {
        String msg = "";
        try {
            String semestres = "vacio";
            this.ps = this.co.prepareStatement("SELECT idSemestre, indicativo FROM semestre;");
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                if (semestres.equals("vacio")) {
                    semestres = "";
                }
                semestres += "<option value=\"" + this.rs.getString(1) + "\">" + this.rs.getString(2) + "</option>";
            }
            this.ps.clearParameters();
            this.ps = this.co.prepareStatement("SELECT idAcuerdo, nombre, ano FROM acuerdo;");
            ResultSet rrr = this.ps.executeQuery();
            String acuerdos = "vacio";
            while (rrr.next()) {
                if (acuerdos.equals("vacio")) {
                    acuerdos = "";
                }
                acuerdos += "<option value=\"" + rrr.getString(1) + "\">" + rrr.getString(2) + " del " + rrr.getString(3) + "</option>";
            }

            msg = semestres + "#-#" + acuerdos;
        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String registrarEstudiante(Estudiante e) {
        String msg = "";
        System.out.println("llego aca");
        try {
            this.ps = this.co.prepareStatement("INSERT INTO estudiante (nombres, apellidos, documento, "
                    + "fechaNac, municipioNac, direccionResidencia, municipioResidencia, estrato, estadoCivil, numeroHijos, grupoEtnico,"
                    + "mujerCabeza, sorderaProfunda, lesionMuscular, Hipoacusia, autismo, bajaVision, retraso, ceguera, down, mudez, paralisisCerebral,"
                    + "paralisisFisica, noAplica, noInforma, email, telefono, programaAcademico, modalidad, semestreEntro, codigo, jornada,"
                    + "hechoVictimizante, grupoVictima, nombreAcudiente, telefonoAcudiente, direccionAcudiente, municipioAcudiente, funcionarioResponsable,"
                    + "telefonoFuncionario, cargoFuncionario, emailFuncionario, numeroHermanos,posicionHermanos, direccionFamiliar, municipioFamiliar, estratoFamiliar, "
                    + "tipoViviendaFamiliar, zonaViviendaFamiliar, tendenciaFamiliar, tiempoPermanenciaFamiliar, trabaja, lugarTrabajo, presupuestoMensual,"
                    + "sostiene, observacionesSostenimiento, situacionPsicosocial, riesgosPermanencia, municipioExpDocumento, estadoActivo, direccionResidenciaResponsable,"
                    + "municipioResidenciaResponsable, telefonoFamiliar, idAcuerdo) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
            this.ps.setString(1, e.getNombre().toUpperCase());
            this.ps.setString(2, e.getApellido().toUpperCase());
            this.ps.setString(3, e.getDocumento() + "".toUpperCase());
            this.ps.setString(4, e.getFechaNac().toUpperCase());
            this.ps.setString(5, e.getMunicipioNacimiento().toUpperCase());
            this.ps.setString(6, e.getDireccionResidencia().toUpperCase());
            this.ps.setString(7, e.getMunicipioResidencia().toUpperCase());
            this.ps.setString(8, e.getEstrato() + "".toUpperCase());
            this.ps.setString(9, e.getEstadoCivil().toUpperCase());
            this.ps.setString(10, e.getNumeroHijos() + "".toUpperCase());
            this.ps.setString(11, e.getGrupoEtnico().toUpperCase());
            this.ps.setString(12, e.getMujerCabeza().toUpperCase());
            this.ps.setString(13, e.getValorDiscapacidad("sordera").toUpperCase());
            this.ps.setString(14, e.getValorDiscapacidad("neuromuscular").toUpperCase());
            this.ps.setString(15, e.getValorDiscapacidad("audicion").toUpperCase());
            this.ps.setString(16, e.getValorDiscapacidad("autismo").toUpperCase());
            this.ps.setString(17, e.getValorDiscapacidad("vision").toUpperCase());
            this.ps.setString(18, e.getValorDiscapacidad("retardo").toUpperCase());
            this.ps.setString(19, e.getValorDiscapacidad("ceguera").toUpperCase());
            this.ps.setString(20, e.getValorDiscapacidad("down").toUpperCase());
            this.ps.setString(21, e.getValorDiscapacidad("mudez").toUpperCase());
            this.ps.setString(22, e.getValorDiscapacidad("cerebral").toUpperCase());
            this.ps.setString(23, e.getValorDiscapacidad("fisica").toUpperCase());
            this.ps.setString(24, e.getValorDiscapacidad("noAplica").toUpperCase());
            this.ps.setString(25, e.getValorDiscapacidad("noReporta").toUpperCase());
            this.ps.setString(26, e.getEmail().toUpperCase());
            this.ps.setString(27, e.getTelefono() + "".toUpperCase());
            this.ps.setString(28, e.getPrograma().getNombre().toUpperCase());
            this.ps.setString(29, e.getPrograma().getModalidad().toUpperCase());
            this.ps.setString(30, e.getPrograma().getSemestreQueEntro().toUpperCase());
            this.ps.setString(31, e.getCodigo() + "".toUpperCase());
            this.ps.setString(32, e.getPrograma().getJornada().toUpperCase());
            this.ps.setString(33, e.getHechoVictimizante().toUpperCase());
            this.ps.setString(34, e.getPrograma().getGrupoPerteneciente().toUpperCase());
            this.ps.setString(35, e.getAcudiente().getNombre().toUpperCase() + "#-.-#" + e.getAcudiente().getApellido().toUpperCase());
            this.ps.setString(36, e.getAcudiente().getTelefono().toUpperCase());
            this.ps.setString(37, e.getAcudiente().getDireccionResidencia().toUpperCase());
            this.ps.setString(38, e.getAcudiente().getMunicipioResidencia().toUpperCase());
            this.ps.setString(39, e.getResponsable().getNombre().toUpperCase() + "#-.-#" + e.getResponsable().getApellido().toUpperCase());
            this.ps.setString(40, e.getResponsable().getTelefono().toUpperCase());
            this.ps.setString(41, e.getResponsable().getCargoResponsable().toUpperCase());
            this.ps.setString(42, e.getResponsable().getEmailResponsable().toUpperCase());
            this.ps.setString(43, e.getNucleo().getNumeroHermanos() + "".toUpperCase());
            this.ps.setString(44, e.getNucleo().getPosicionHermanos() + "".toUpperCase());
            this.ps.setString(45, e.getNucleo().getDireccionResidencia().toUpperCase());
            this.ps.setString(46, e.getNucleo().getMunicipioResidencia().toUpperCase());
            this.ps.setString(47, e.getNucleo().getEstratoFamiliar() + "".toUpperCase());
            this.ps.setString(48, e.getNucleo().getTipoVivienda().toUpperCase());
            this.ps.setString(49, e.getNucleo().getZonaUbicacion().toUpperCase());
            this.ps.setString(50, e.getNucleo().getTendenciaFamiliar().toUpperCase());
            this.ps.setString(51, e.getNucleo().getPermanenciaVivienda().toUpperCase());
            this.ps.setString(52, e.getTrabaja().toUpperCase());
            this.ps.setString(53, e.getLugarTrabajo().toUpperCase());
            this.ps.setString(54, e.getPresupuestoMensual() + "".toUpperCase());
            this.ps.setString(55, e.getComoSostiene().toUpperCase());
            this.ps.setString(56, e.getObservaciones().toUpperCase());
            this.ps.setString(57, e.getSituacionPsicologica().toUpperCase());
            this.ps.setString(58, e.getRiesgosPermanencia().toUpperCase());
            this.ps.setString(59, e.getLugarExpedicion().toUpperCase());
            this.ps.setString(60, "F");
            this.ps.setString(61, e.getResponsable().getDireccionResidencial().toUpperCase());
            this.ps.setString(62, e.getResponsable().getMunicipioResidencial().toUpperCase());
            this.ps.setString(63, e.getNucleo().getTelefonoFamiliar().toUpperCase());
            this.ps.setString(64, e.getAcuerdo());

            System.out.println("va a registrar");
            int resp = this.ps.executeUpdate();
            System.out.println("registro");
            if (resp > 0) {
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT idEstudiante FROM estudiante WHERE documento = ?");
                this.ps.setString(1, e.getDocumento() + "");
                System.out.println("va a consultar");
                this.rs = this.ps.executeQuery();
                if (this.rs.next()) {

                    System.out.println("informacion financiera");
                    for (InformacionLaboral n : e.getInformacionLaboral()) {
                        System.out.println(n.toString());
                        this.ps.clearParameters();
                        this.ps = this.co.prepareStatement("INSERT INTO situacionlaboralfamiliar (idEstudiante, nombre, parentesco, fechaNac, ocupacion, ingresos) VALUES (?,?,?,?,?,?);");
                        this.ps.setInt(1, Integer.parseInt(this.rs.getString("idEstudiante")));
                        this.ps.setString(2, n.getNombre().toUpperCase());
                        this.ps.setString(3, n.getParentesco().toUpperCase());
                        this.ps.setString(4, n.getFechaNac().toUpperCase());
                        this.ps.setString(5, n.getOcupacion().toUpperCase());
                        this.ps.setString(6, n.getIngresos().toUpperCase());
                        System.out.println(n.getIngresos() + "        dao".toUpperCase());
                        resp = this.ps.executeUpdate();
                    }
                    if (resp > 0) {
                        msg = "REGISTRO EXITOSO";
                        ServicioEmail se = new ServicioEmail("victiufps@gmail.com","victimas2017*");
                        se.enviarEmail(e.getEmail(), "REGISTRO SISTEMA DE VICTIMAS", "Bienvenido, ha sido registrado correctamente en el sistema de control de victimas de la UFPS");
                    } else {
                        msg = "error";
                    }
                } else {
                    msg = "error";
                }
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String crearSemestre(String fecha) {
        String msg = "";
        System.out.println(fecha);
        try {
            this.ps = this.co.prepareStatement("INSERT INTO semestre (fecha,indicativo,estado) VALUES (?,?,?);");
            this.ps.setString(1, fecha);
            String f[] = fecha.split("-");
            String dig = "1";
            if (Integer.parseInt(f[1]) >= 6) {
                dig = "2";
            }
            this.ps.setString(2, f[0] + "-" + dig);
            this.ps.setString(3, "0");

            int q = this.ps.executeUpdate();
            if (q > 0) {
                msg = "EXITO";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String registrarActividad(Actividad a) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("INSERT INTO actividad (nombre,fecha,lugar,obligatoriedad,estado,hora,idSemestre) VALUES (?,?,?,?,?,?,(SELECT idSemestre FROM semestre WHERE estado='1'));");
            this.ps.setString(1, a.getNombre());
            this.ps.setString(2, a.getFecha());
            this.ps.setString(3, a.getLugar());
            this.ps.setString(4, a.getObligatoriedad());
            this.ps.setString(5, "1");
            this.ps.setString(6, a.getHora());

            //enviar un correo a todos los estudiantes Activos que se ha creado una actividad
            int q = this.ps.executeUpdate();
            if (q > 0) {
                msg = "EXITO";
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT email FROM estudiante WHERE estadoActivo='T';");
                ResultSet ss = this.ps.executeQuery();
                ServicioEmail se = new ServicioEmail("victiufps@gmail.com","victimas2017*");
                while(ss.next()){
                    String ac = "";
                    if(a.getObligatoriedad().equals("1")){
                        ac = "REUNION";
                    }
                    else{
                        ac="ACTIVIDAD";
                    }
                    se.enviarEmail(ss.getString(1), "CREACION DE ACTIVIDAD", "SE HA CREADO LA "+ac+": "+a.getNombre()+", para el dia "+a.getFecha()+" a las "+a.getHora() +" en "+a.getLugar());
                }
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarEstudiante(String doc) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT * FROM estudiante WHERE documento=?;");
            this.ps.setString(1, doc);

            this.rs = this.ps.executeQuery();
            if (this.rs.next()) {
                msg += this.rs.getString("nombres") + "#-#";
                msg += this.rs.getString("apellidos") + "#-#";
                msg += this.rs.getString("documento") + "#-#";
                msg += this.rs.getString("municipioExpDocumento") + "#-#";
                msg += this.rs.getString("fechaNac") + "#-#";
                msg += this.rs.getString("municipioNac") + "#-#";
                msg += this.rs.getString("direccionResidencia") + "#-#";
                msg += this.rs.getString("municipioResidencia") + "#-#";
                msg += this.rs.getString("estrato") + "#-#";
                msg += this.rs.getString("estadoCivil") + "#-#";
                msg += this.rs.getString("numeroHijos") + "#-#";
                msg += this.rs.getString("grupoEtnico") + "#-#";
                msg += this.rs.getString("mujerCabeza") + "#-#";
                msg += this.rs.getString("sorderaProfunda") + "#-#";
                msg += this.rs.getString("lesionMuscular") + "#-#";
                msg += this.rs.getString("Hipoacusia") + "#-#";
                msg += this.rs.getString("autismo") + "#-#";
                msg += this.rs.getString("bajaVision") + "#-#";
                msg += this.rs.getString("retraso") + "#-#";
                msg += this.rs.getString("ceguera") + "#-#";
                msg += this.rs.getString("down") + "#-#";
                msg += this.rs.getString("mudez") + "#-#";
                msg += this.rs.getString("paralisisCerebral") + "#-#";
                msg += this.rs.getString("paralisisFisica") + "#-#";
                msg += this.rs.getString("noAplica") + "#-#";
                msg += this.rs.getString("noInforma") + "#-#";
                msg += this.rs.getString("email") + "#-#";
                msg += this.rs.getString("telefono") + "#-#";
                msg += this.rs.getString("programaAcademico") + "#-#";
                msg += this.rs.getString("modalidad") + "#-#";
                msg += this.rs.getString("semestreEntro") + "#-#";
                msg += this.rs.getString("codigo") + "#-#";
                msg += this.rs.getString("jornada") + "#-#";
                msg += this.rs.getString("hechoVictimizante") + "#-#";
                msg += this.rs.getString("grupoVictima") + "#-#";
                msg += this.rs.getString("nombreAcudiente") + "#-#";
                msg += this.rs.getString("telefonoAcudiente") + "#-#";
                msg += this.rs.getString("direccionAcudiente") + "#-#";
                msg += this.rs.getString("municipioAcudiente") + "#-#";
                msg += this.rs.getString("funcionarioResponsable") + "#-#";
                msg += this.rs.getString("telefonoFuncionario") + "#-#";
                msg += this.rs.getString("cargoFuncionario") + "#-#";
                msg += this.rs.getString("emailFuncionario") + "#-#";
                msg += this.rs.getString("direccionResidenciaResponsable") + "#-#";
                msg += this.rs.getString("municipioResidenciaResponsable") + "#-#";
                msg += this.rs.getString("numeroHermanos") + "#-#";
                msg += this.rs.getString("posicionHermanos") + "#-#";
                msg += this.rs.getString("direccionFamiliar") + "#-#";
                msg += this.rs.getString("municipioFamiliar") + "#-#";
                msg += this.rs.getString("estratoFamiliar") + "#-#";
                msg += this.rs.getString("tipoViviendaFamiliar") + "#-#";
                msg += this.rs.getString("zonaViviendaFamiliar") + "#-#";
                msg += this.rs.getString("tendenciaFamiliar") + "#-#";
                msg += this.rs.getString("tiempoPermanenciaFamiliar") + "#-#";
                msg += this.rs.getString("telefonoFamiliar") + "#-#";
                msg += this.rs.getString("trabaja") + "#-#";
                msg += this.rs.getString("lugarTrabajo") + "#-#";
                msg += this.rs.getString("presupuestoMensual") + "#-#";
                msg += this.rs.getString("sostiene") + "#-#";
                msg += this.rs.getString("observacionesSostenimiento") + "#-#";
                msg += this.rs.getString("situacionPsicosocial") + "#-#";
                msg += this.rs.getString("riesgosPermanencia") + "#-#";
                msg += this.rs.getString("estadoActivo") + "#-#";

                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT a.nombre FROM acuerdo a, acuerdoestudiante ac, estudiante e WHERE a.idAcuerdo = ac.idAcuerdo and ac.idEstudiante = e.idEstudiante and e.documento = ? ORDER BY idAcuerdoEstudiante DESC;");
                this.ps.setString(1, doc);
                ResultSet rr = this.ps.executeQuery();
                String acu = "";
                if (rr.next()) {
                    acu = rr.getString(1);
                }
                msg += acu + "#-#";
                System.out.println(msg + ":: 1");
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT s.nombre, s.parentesco, s.fechaNac, s.ocupacion, s.ingresos FROM situacionlaboralfamiliar s, estudiante e WHERE s.idEstudiante = e.idEstudiante and e.documento = ?");
                this.ps.setString(1, doc);
                ResultSet rrr = this.ps.executeQuery();
                String laboral = "";

                while (rrr.next()) {
                    laboral += "<tr><td><div class=\"input-field col s12\"><i class=\"material-icons prefix\">account_circle</i><input type=\"text\" class=\"validate\" placeholder=\" \" value=\"" + rrr.getString(1) + "\"><label class=\"active\">Nombres</label></div></td>";
                    laboral += "<td><div class=\"input-field col s12\"><i class=\"material-icons prefix\">account_circle</i><input type=\"text\" class=\"validate\" placeholder=\" \" value=\"" + rrr.getString(2) + "\"><label class=\"active\">Parentesco</label></div></td>";
                    laboral += "<td><div class=\"input-field col s12\"><i class=\"material-icons prefix\">account_circle</i><input type=\"text\" class=\"validate\" placeholder=\" \" value=\"" + rrr.getString(3) + "\"><label class=\"active\">Fecha Nacimiento</label></div></td>";
                    laboral += "<td><div class=\"input-field col s12\"><i class=\"material-icons prefix\">account_circle</i><input type=\"text\" class=\"validate\" placeholder=\" \" value=\"" + rrr.getString(4) + "\"><label class=\"active\">Ocupacion</label></div></td>";
                    laboral += "<td><div class=\"input-field col s12\"><i class=\"material-icons prefix\">account_circle</i><input type=\"text\" class=\"validate\" placeholder=\" \" value=\"" + rrr.getString(5) + "\"><label class=\"active\">Ingresos</label></div></td></tr><br>";
                }
                msg += laboral + "#-#";
                System.out.println(laboral + ":: laboral");
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT a.nombre, a.tipoAnexo FROM anexoestudiante a, estudiante e WHERE a.idEstudiante = e.idEstudiante and e.documento = ?");
                this.ps.setString(1, doc);
                ResultSet rrrr = this.ps.executeQuery();
                String anexos = "";
                int i = 0;
                while (rrrr.next()) {
                    if (i == 0) {
                        anexos += "<div class=\"row\"><div class=\"col m3\" align=\"center\"><table><tbody><tr><td class=\"dere\"><div class=\"row\"><div class=\"col s6 dere\"><a>" + rrrr.getString(2) + "</a></div><div class\"col s4\"><a href=\"../docs/" + rrrr.getString(1) + "\" target=\"_blank\"><div align=\"left\"><i class=\"material-icons prefix\">picture_as_pdf</i></div></a></div></div></td></tr></tbody></table><div class=\"embed-responsive embed-responsive-16by9\" style=\"height: 450px\"><iframe class=\"embed-responsive-item\" src=\"../docs/" + rrrr.getString(1) + "\" allowfullscreen=\"\" style=\"height: 450px\"></iframe></div><br></div>";
                    } else {
                        anexos += "<div class=\"col m3\" align=\"center\"><table><tbody><tr><td class=\"dere\"><div class=\"row\"><div class=\"col s6 dere\"><a>" + rrrr.getString(2) + "</a></div><div class\"col s4\"><a href=\"../docs/" + rrrr.getString(1) + "\" target=\"_blank\"><div align=\"left\"><i class=\"material-icons prefix\">picture_as_pdf</i></div></a></div></div></td></tr></tbody></table><div class=\"embed-responsive embed-responsive-16by9\" style=\"height: 450px\"><iframe class=\"embed-responsive-item\" src=\"../docs/" + rrrr.getString(1) + "\" allowfullscreen=\"\" style=\"height: 450px\"></iframe></div><br></div>";
                    }
                    //anexos+= "<tr><td><input type=\"text\" class=\"validate\" placeholder=\" \" value=\""+rrrr.getString(2)+"\"></td>";
                    //anexos+= "<td><a href=\"../docs/"+rrrr.getString(1)+"\" target=\"_blank\"><div align=\"center\"><i class=\"material-icons prefix\">picture_as_pdf</i></div></a></td></tr><br>";
                    i++;
                    if (i == 4) {
                        i = 0;
                        anexos += "</div><div class=\"linea\"></div>";
                    }
                }

                msg += anexos + "#-#";
                System.out.println(anexos + ":: anexos");
                String acom = "";
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT * FROM acompañamientoestudiante a, estudiante e WHERE a.idEstudiante = e.idEstudiante AND e.documento = ?");
                this.ps.setString(1, doc);
                ResultSet rrrrr = this.ps.executeQuery();
                while (rrrrr.next()) {
                    acom += "<div class=\"row\" style=\"margin-top: 20px;\">"
                            + "<div class=\"input-field col s4\"><i class=\"material-icons prefix\">account_circle</i>"
                            + "<input id=\"actividad" + "\" type=\"text\" class=\"validate\" value=\"" + rrrrr.getString(4) + "\" placeholder=\" \" disabled>"
                            + "<label for=\"actividad" + "\" class=\"active\">Actividad</label></div>"
                            + "<div class=\"input-field col s4\"><i class=\"material-icons prefix\">account_circle</i>"
                            + "<input id=\"dependencia" + "\" type=\"text\" class=\"validate\" value=\"" + rrrrr.getString(5) + "\" placeholder=\" \" disabled>"
                            + "<label for=\"dependencia" + "\" class=\"active\">Dependencia Responsable</label>"
                            + "</div><div class=\"input-field col s4\"><i class=\"material-icons prefix\">account_circle</i>"
                            + "<input id=\"persona" + "\" type=\"text\" class=\"validate\" value=\"" + rrrrr.getString(6) + "\" placeholder=\" \" disabled>"
                            + "<label for=\"persona" + "\" class=\"active\">Persona Responsable</label></div></div>"
                            + "<div class=\"row\"><div class=\"input-field col s6\"><i class=\"material-icons prefix\">mode_edit</i>"
                            + "<textarea id=\"aspectos" + "\" class=\"materialize-textarea\" maxlength=\"150\" data-length=\"150\" placeholder=\" \" disabled>"
                            + rrrrr.getString(3) + "</textarea><label for=\"aspectos" + "\" class=\"active\">Aspectos a Mejorar (Academicos, Psicosociales)</label></div>"
                            + "<div class=\"input-field col s6\"><i class=\"material-icons prefix\">account_circle</i>"
                            + "<textarea id=\"resultados" + "\" class=\"materialize-textarea\" maxlength=\"150\" data-length=\"150\" rows=\"5\" placeholder=\" \" disabled>"
                            + rrrrr.getString(7) + "</textarea><label for=\"resultados" + "\" class=\"active\">Resultados Obtenidos</label></div></div><div class=\"linea\"></div></div>";
                }
                msg += acom + "#-#";
                System.out.println(acom + ":: acompañamiento");
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT s.materia,s.primerCorte,s.segundoCorte,s.tercerCorte,s.cuartoCorte,s.observaciones,se.indicativo FROM seguimientoEstudiante s, estudiante e, semestre se WHERE e.documento=? AND e.idEstudiante=s.idEstudiante AND se.idSemestre = s.idSemestre");
                this.ps.setString(1, doc);
                ResultSet rrrrrr = this.ps.executeQuery();
                String tabla = "<table class=\"striped centered bordered\" id=\"myTablaSegui\">\n"
                        + "                                    <thead>\n"
                        + "                                        <tr>\n"
                        + "                                            <th>Semestre</th>\n"
                        + "                                            <th>Materia</th>\n"
                        + "                                            <th>Primer Corte</th>\n"
                        + "                                            <th>Segundo Corte</th>\n"
                        + "                                            <th>Tercer Corte</th>\n"
                        + "                                            <th>Cuarto Corte</th>\n"
                        + "                                            <th>Observaciones</th>\n"
                        + "                                        </tr>\n"
                        + "                                    </thead>\n"
                        + "                                    \n"
                        + "                                    <tbody>\n";
                int ii = 1;
                while (rrrrrr.next()) {
                    if (!rrrrrr.getString(1).isEmpty()) {
                        tabla += "<tr>";

                        tabla += "<td>" + rrrrrr.getString(7) + "</td>";
                        tabla += "<td>" + rrrrrr.getString(1) + "</td>";

                        tabla += "<td>" + rrrrrr.getString(2) + "</td>";

                        tabla += "<td>" + rrrrrr.getString(3) + "</td>";

                        tabla += "<td>" + rrrrrr.getString(4) + "</td>";

                        tabla += "<td>" + rrrrrr.getString(5) + "</td>";

                        tabla += "<td>" + rrrrrr.getString(6) + "</td>";
                        tabla += "</tr>";
                        ii++;
                    }
                }
                tabla += "</tbody></table>";

                msg += tabla + "#-#";
                System.out.println(tabla + ":: seguimiento");
                this.ps.clearParameters();
                String sems = "<table class=\"striped centered bordered\" id=\"myTablaSems\">\n"
                        + "                                    <thead>\n"
                        + "                                        <tr>\n"
                        + "                                            <th>Semestre</th>\n"
                        + "                                            <th>Acuerdo</th>\n"
                        + "                                        </tr>\n"
                        + "                                    </thead>\n"
                        + "                                    \n"
                        + "                                    <tbody>\n";
                this.ps = this.co.prepareStatement("SELECT s.indicativo, a.nombre, a.ano FROM estudiante e, acuerdo a, semestre s, acuerdoestudiante ac "
                        + "WHERE e.documento=? AND e.idEstudiante=ac.idEstudiante AND s.idSemestre=ac.idSemestre AND a.idAcuerdo=ac.idAcuerdo;");
                this.ps.setString(1, doc);
                ResultSet sr = this.ps.executeQuery();
                while (sr.next()) {
                    sems += "<tr><td>" + sr.getString(1) + "</td>";
                    sems += "<td>" + sr.getString(2) + " del " + sr.getString(3) + "</td></tr>";
                }
                sems += "</tbody></table>";

                msg += sems + "#-#";
                System.out.println(sems + ":: semestres");
                this.ps.clearParameters();
                String acts = "<table class=\"striped centered bordered\" id=\"myTablaActs\">\n"
                        + "                                    <thead>\n"
                        + "                                        <tr>\n"
                        + "                                            <th>Tipo</th>\n"
                        + "                                            <th>Nombre</th>\n"
                        + "                                            <th>Fecha</th>\n"
                        + "                                            <th>Asistencia</th>\n"
                        + "                                        </tr>\n"
                        + "                                    </thead>\n"
                        + "                                    \n"
                        + "                                    <tbody>\n";
                this.ps = this.co.prepareStatement("SELECT a.obligatoriedad, a.nombre,a.fecha, ae.asistencia FROM estudiante e, actividad a, actividadestudiante ae "
                        + "WHERE e.documento=? AND e.idEstudiante=ae.idEstudiante AND a.idActividad=ae.idActividad;");
                this.ps.setString(1, doc);
                ResultSet srr = this.ps.executeQuery();
                while (srr.next()) {
                    if (srr.getString(1).equals("1")) {
                        acts += "<tr><td>" + "REUNION" + "</td>";
                    } else {
                        acts += "<tr><td>" + "ACTIVIDAD" + "</td>";
                    }
                    acts += "<td>" + srr.getString(2) + "</td>";
                    acts += "<td>" + srr.getString(3) + "</td>";
                    if (srr.getString(4).equals("T")) {
                        acts += "<td><div class=\"switch\"><label>No<input type=\"checkbox\" id=\"valor" + i + "\" checked=\"true\" disabled><span class=\"lever\"></span>Si</label></div></td></tr>";
                    } else {
                        acts += "<td><div class=\"switch\"><label>No<input type=\"checkbox\" id=\"valor" + i + "\" disabled><span class=\"lever\"></span>Si</label></div></td></tr>";
                    }

                }
                acts += "</tbody></table>";

                msg += acts + "#-#";
                System.out.println(acts + ":: actividades");
            } else {
                msg = "vacio";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            msg = "error";
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarEstudiante2(String doc) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT * FROM estudiante WHERE documento=? and estadoActivo = 'T';");
            this.ps.setString(1, doc);

            this.rs = this.ps.executeQuery();
            if (this.rs.next()) {
                msg += this.rs.getString("idEstudiante") + "#-#";
                msg += this.rs.getString("nombres");
            } else {
                msg = "vacio";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            msg = "error";
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }
    
    public String cargarEstudiante22(String doc) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT * FROM estudiante WHERE documento=?");
            this.ps.setString(1, doc);

            this.rs = this.ps.executeQuery();
            if (this.rs.next()) {
                msg += this.rs.getString("idEstudiante") + "#-#";
                msg += this.rs.getString("nombres");
            } else {
                msg = "vacio";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            msg = "error";
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarEstudiante3(String doc) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT * FROM estudiante WHERE documento=?;");
            this.ps.setString(1, doc);

            this.rs = this.ps.executeQuery();
            if (this.rs.next()) {
                msg += this.rs.getString("idEstudiante") + "#-#";
                msg += this.rs.getString("nombres") + " " + this.rs.getString("apellidos");
            } else {
                msg = "vacio";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            msg = "error";
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarActividades() {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT idActividad,nombre,fecha,lugar,obligatoriedad,estado FROM actividad WHERE estado <> '2';");
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                msg += "<tr>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(2) + "</a></div></td>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(3) + "</a></div></td>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(4) + "</a></div></td>";
                if (this.rs.getString(5).equals("1")) {
                    msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "REUNION" + "</a></div></td>";
                } else {
                    msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "ACTIVIDAD" + "</a></div></td>";
                }
                if (this.rs.getString(6).equals("1")) {
                    msg += "<td><div class=\"col s12\"><a class=\"waves-effect waves-yellow btn green lighten-1\" onclick=\"iniciarActividad('" + this.rs.getString(1) + "')\">Iniciar</a></div></td>";
                    msg += "<td><div class=\"col s12\"><a class=\"waves-effect waves-yellow btn red lighten-1\" onclick=\"finalizarActividad('" + this.rs.getString(1) + "')\" disabled>Finalizar</a></div></td>";
                    msg += "<td><div class=\"col s12\"><a class=\"waves-effect waves-yellow btn blue lighten-1\" onclick=\"cargarListado('" + this.rs.getString(1) + "')\" disabled>Asistencia</a></div></td>";
                } else if (this.rs.getString(6).equals("3")) {
                    msg += "<td><div class=\"col s12\"><a class=\"waves-effect waves-yellow btn green lighten-1\" onclick=\"iniciarActividad('" + this.rs.getString(1) + "')\" disabled>Iniciar</a></div></td>";
                    msg += "<td><div class=\"col s12\"><a class=\"waves-effect waves-yellow btn red lighten-1\" onclick=\"finalizarActividad('" + this.rs.getString(1) + "')\">Finalizar</a></div></td>";
                    msg += "<td><div class=\"col s12\"><a class=\"waves-effect waves-yellow btn blue lighten-1\" onclick=\"tomarLista('" + this.rs.getString(1) + "')\">Asistencia</a></div></td>";

                }
                msg += "</tr>";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String iniciarActividad(String index) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("UPDATE actividad set estado = 3 WHERE idActividad = ?");
            this.ps.setString(1, index);

            int q = this.ps.executeUpdate();
            if (q > 0) {
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT nombre, fecha, hora, lugar, obligatoriedad FROM actividad WHERE idActividad=?;");
                this.ps.setString(1, index);
                ResultSet r = this.ps.executeQuery();
                r.next(); 
                    
                
                System.out.println("va con los estudiantes");
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT idEstudiante, email FROM estudiante WHERE estadoActivo = 'T'");
                this.rs = this.ps.executeQuery();
                while (this.rs.next()) {
                    System.out.println("uno");
                    this.ps.clearParameters();
                    this.ps = this.co.prepareStatement("INSERT INTO actividadestudiante (idEstudiante, idActividad, asistencia) VALUES (?,?,?)");
                    this.ps.setString(1, this.rs.getString(1));
                    this.ps.setString(2, index);
                    this.ps.setString(3, "F");
                    this.ps.execute();
                    
                    ServicioEmail se = new ServicioEmail("victiufps@gmail.com","victimas2017*");
                    String ac = "";
                    if(r.getString(5).equals("1")){
                        ac = "REUNION";
                    }
                    else{
                        ac="ACTIVIDAD";
                    }
                    se.enviarEmail(rs.getString(2), "INICIO DE ACTIVIDAD", "SE HA INICIADO LA "+ac+": "+r.getString(1)+", para el dia "+r.getString(2)+" a las "+r.getString(3) +" en "+r.getString(4));
                
                    //enviar un correo a los estudiantes avisando que la actividad se ha iniciado
                }
                msg = "EXITO";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarActividadesFin() {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT idActividad,nombre,fecha,lugar,obligatoriedad FROM actividad WHERE estado='3';");
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                msg += "<tr>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(2) + "</a></div></td>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(3) + "</a></div></td>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(4) + "</a></div></td>";
                if (this.rs.getString(5).equals("1")) {
                    msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "REUNION" + "</a></div></td>";
                } else {
                    msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "ACTIVIDAD" + "</a></div></td>";
                }
                msg += "<td><div class=\"col s12\"><a class=\"waves-effect waves-yellow btn red lighten-1\" onclick=\"finalizarActividad('" + this.rs.getString(1) + "')\">Finalizar</a></div></td>";
                msg += "</tr>";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String finalizarActividad(String index) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("UPDATE actividad set estado = 2 WHERE idActividad = ?");
            this.ps.setString(1, index);
            //enviar un correo a los estudiantes informando que la actividad ya finalizo.
            int q = this.ps.executeUpdate();
            if (q > 0) {
                this.ps = this.co.prepareStatement("SELECT nombre, fecha, hora, lugar, obligatoriedad FROM actividad WHERE idActividad=?;");
                this.ps.setString(1, index);
                ResultSet r = this.ps.executeQuery();
                r.next(); 
                System.out.println("va con los estudiantes");
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT idEstudiante, email FROM estudiante WHERE estadoActivo = 'T'");
                this.rs = this.ps.executeQuery();
                while (this.rs.next()) {
                    System.out.println("uno");
                    this.ps.clearParameters();
                    
                    ServicioEmail se = new ServicioEmail("victiufps@gmail.com","victimas2017*");
                    String ac = "";
                    if(r.getString(5).equals("1")){
                        ac = "REUNION";
                    }
                    else{
                        ac="ACTIVIDAD";
                    }
                    se.enviarEmail(rs.getString(2), "FIN DE ACTIVIDAD", "SE HA FINALIZADO LA "+ac+": "+r.getString(1)+", para el dia "+r.getString(2)+" a las "+r.getString(3) +" en "+r.getString(4));
                
                    //enviar un correo a los estudiantes avisando que la actividad se ha iniciado
                }
                msg = "exito";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarActividadesHis() {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT a.idActividad,a.nombre,a.fecha,a.lugar,a.obligatoriedad,a.estado,s.indicativo FROM actividad a,semestre s WHERE a.idSemestre=s.idSemestre ORDER BY idActividad DESC;");
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                msg += "<tr>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(2) + "</a></div></td>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(3) + "</a></div></td>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(4) + "</a></div></td>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(6) + "</a></div></td>";
                if (this.rs.getString(5).equals("1")) {
                    msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "REUNION" + "</a></div></td>";
                } else {
                    msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "ACTIVIDAD" + "</a></div></td>";
                }
                if (this.rs.getString(6).equals("1")) {
                    msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "CREADA" + "</a></div></td>";
                } else {
                    if (this.rs.getString(6).equals("2")) {
                        msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "FINALIZADA" + "</a></div></td>";
                    } else {
                        msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "INICIADA" + "</a></div></td>";
                    }
                }
                //msg += "<td><div class=\"col s12\"><a class=\"waves-effect waves-yellow btn red lighten-1\" onclick=\"finalizarActividad('"+this.rs.getString(1)+"')\">Finalizar</a></div></td>";
                msg += "</tr>";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String subirAnexo(String tipo, String nombre, String idEstudiante, String doc) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("INSERT INTO anexoEstudiante (tipoAnexo,idEstudiante,nombre) VALUES (?,?,?);");
            this.ps.setString(1, tipo);
            this.ps.setString(2, idEstudiante);
            this.ps.setString(3, idEstudiante + doc + nombre);

            int q = this.ps.executeUpdate();
            if (q > 0) {
                msg = "exito";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String actualizarEstudiante(String doc, String campo, String valor) {
        String msg = "";
        try {
            String cam = this.hm.get(campo);
            System.out.println("el campo es: " + cam);
            this.ps = this.co.prepareStatement("UPDATE estudiante set " + cam + " = ? WHERE documento = ?");
            this.ps.setString(1, valor.toUpperCase());
            this.ps.setString(2, doc);

            int q = this.ps.executeUpdate();
            if (q > 0) {

                msg = "exito";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarActividadesListado() {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT idActividad,nombre,fecha,lugar,obligatoriedad FROM actividad WHERE estado='3';");
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                msg += "<tr>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(2) + "</a></div></td>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(3) + "</a></div></td>";
                msg += "<td><div class=\"col s12\"><a class=\"noa\">" + this.rs.getString(4) + "</a></div></td>";
                if (this.rs.getString(5).equals("1")) {
                    msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "REUNION" + "</a></div></td>";
                } else {
                    msg += "<td><div class=\"col s12\"><a class=\"noa\">" + "ACTIVIDAD" + "</a></div></td>";
                }
                msg += "<td><div class=\"col s12\"><a class=\"waves-effect waves-yellow btn blue lighten-1\" onclick=\"tomarLista('" + this.rs.getString(1) + "')\">Tomar Lista</a></div></td>";
                msg += "</tr>";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarListado(String idActividad) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT e.nombres,e.documento,ae.asistencia FROM actividad a, actividadestudiante ae, estudiante e WHERE ae.idActividad = a.idActividad AND ae.idEstudiante = e.idEstudiante AND a.idActividad=?;");
            this.ps.setString(1, idActividad);
            this.rs = this.ps.executeQuery();

            this.ps.clearParameters();
            this.ps = this.co.prepareStatement("SELECT COUNT(idActividadEstudiante) FROM actividadestudiante WHERE idActividad=?");
            this.ps.setString(1, idActividad);
            ResultSet rr = this.ps.executeQuery();
            rr.next();
            String cantidad = rr.getString(1);
            String tabla = "";
            int i = 1;
            while (this.rs.next()) {
                tabla += "<tr><td><div class=\"col s12\" id=\"nombre" + i + "\"><a class=\"noa\">" + this.rs.getString(1) + "</a></div></td>";
                tabla += "<td><div class=\"col s12\"><a class=\"noa\"  id=\"documento" + i + "\">" + this.rs.getString(2) + "</a></div></td>";
                if (this.rs.getString(3).equals("T")) {
                    tabla += "<td><div class=\"col s12\"><div class=\"switch\"><label>No<input type=\"checkbox\" id=\"valor" + i + "\" checked=\"true\"><span class=\"lever\"></span>Si</label></div></div></td></tr>";
                } else {
                    tabla += "<td><div class=\"col s12\"><div class=\"switch\"><label>No<input type=\"checkbox\" id=\"valor" + i + "\"><span class=\"lever\"></span>Si</label></div></div></td></tr>";
                }
                i++;
            }
            tabla += "#-#" + cantidad + "#-#" + idActividad;
            msg = tabla;

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String guardarListado(String est, String id) {
        String msg = "";
        boolean sw = false;
        try {
            String vec[] = est.split("#-#");
            for (String x : vec) {
                String ee[] = x.split("##");
                this.ps = this.co.prepareStatement("UPDATE actividadestudiante a, estudiante e SET a.asistencia=? WHERE e.idEstudiante=a.idEstudiante AND a.idActividad=? AND e.documento=?;");
                if (ee[1].equals("true")) {
                    this.ps.setString(1, "T");
                } else {
                    this.ps.setString(1, "F");
                }
                this.ps.setString(2, id);
                this.ps.setString(3, ee[0]);
                int res = this.ps.executeUpdate();
                this.ps.clearParameters();

                if (res > 0) {
                    sw = true;
                } else {
                    sw = false;
                }
            }

            if (sw) {
                msg = "ok";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String guardarAcompanamiento(String doc, String id) {
        String msg = "";
        boolean sw = false;
        try {
            String vec[] = doc.split("#-#");
            for (String x : vec) {
                String ee[] = x.split("##");
                this.ps = this.co.prepareStatement("INSERT INTO acompañamientoestudiante (actividad, dependenciaResponsable, personaResponsable, aspectoMejorar, resultadosObtenidos, idEstudiante, fechaRealizacion) VALUES (?,?,?,?,?,?,CURDATE());");
                this.ps.setString(1, ee[0]);
                this.ps.setString(2, ee[1]);
                this.ps.setString(3, ee[2]);
                this.ps.setString(4, ee[3]);
                this.ps.setString(5, ee[4]);
                this.ps.setString(6, id);
                int res = this.ps.executeUpdate();
                this.ps.clearParameters();

                if (res > 0) {
                    sw = true;
                } else {
                    sw = false;
                }
            }

            if (sw) {
                msg = "ok";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarSemestres() {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT idSemestre, indicativo, estado FROM semestre ORDER BY fecha DESC;");

            this.rs = this.ps.executeQuery();

            String idSem = "";
            String tabla = "";
            int i = 1;
            while (this.rs.next()) {
                tabla += "<tr><a class=\"hiddendiv\" id=\"index" + i + "\">" + this.rs.getString(1) + "</a><td><div class=\"col s12\" id=\"nombre" + i + "\"><a class=\"noa\">" + this.rs.getString(2) + "</a></div></td>";
                if (this.rs.getString(3).equals("1")) {
                    idSem = this.rs.getString(1);
                    tabla += "<td><div class=\"col s12\"><div class=\"switch\"><label>No<input type=\"checkbox\" id=\"valor" + i + "\" checked=\"true\" onclick=\"unitario(this);\"><span class=\"lever\"></span>Si</label></div></div></td></tr>";
                } else {
                    tabla += "<td><div class=\"col s12\"><div class=\"switch\"><label>No<input type=\"checkbox\" id=\"valor" + i + "\" onclick=\"unitario(this);\"><span class=\"lever\"></span>Si</label></div></div></td></tr>";
                }
                i++;
            }
            tabla += "#-#" + (i - 1) + "#-#" + idSem;
            msg = tabla;

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String guardarSemestres(String sems) {
        String msg = "";
        boolean sw = false;
        try {
            String vec[] = sems.split("#-#");
            for (String x : vec) {
                System.out.println(x);
                String ee[] = x.split("##");
                this.ps = this.co.prepareStatement("UPDATE semestre SET estado=? WHERE idSemestre=?;");
                if (ee[1].equals("true")) {
                    this.ps.setString(1, "1");
                } else {
                    this.ps.setString(1, "0");
                }
                this.ps.setString(2, ee[0]);
                int res = this.ps.executeUpdate();
                this.ps.clearParameters();

                if (res > 0) {
                    sw = true;
                } else {
                    sw = false;
                }
            }

            if (sw) {
                msg = "ok";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarEstudiantesSemestreNew() {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT e.nombres,e.documento FROM estudiante e");

            this.rs = this.ps.executeQuery();

            this.ps.clearParameters();
            this.ps = this.co.prepareStatement("SELECT COUNT(idEstudiante) FROM estudiante");
            ResultSet rr = this.ps.executeQuery();
            rr.next();
            String cantidad = rr.getString(1);

            this.ps.clearParameters();
            this.ps = this.co.prepareStatement("SELECT idAcuerdo, nombre, ano FROM acuerdo");
            ResultSet rrr = this.ps.executeQuery();
            String acuerdos = "";
            while (rrr.next()) {
                acuerdos += "<option value=\"" + rrr.getString(1) + "\">" + rrr.getString(2) + " del " + rrr.getString(3) + "</option>";
            }
            String tabla = "";
            int i = 1;
            while (this.rs.next()) {
                tabla += "<tr><td><div class=\"col s12\" id=\"nombre" + i + "\"><a class=\"noa\">" + this.rs.getString(1) + "</a></div></td>";
                tabla += "<td><div class=\"col s12\"><a class=\"noa\"  id=\"documento" + i + "\">" + this.rs.getString(2) + "</a></div></td>";
                tabla += "<td><div class=\"col s12\"><div class=\"switch\"><label>No<input type=\"checkbox\" id=\"valor" + i + "\"><span class=\"lever\"></span>Si</label></div></div></td>";
                tabla += "<td><div class=\"input-field col s12\"><select id=\"acuerdo" + i + "\"><option value=\"n\" disabled selected>Acuerdo</option>" + acuerdos + "</select><label>Acuerdo</label></div></td></tr>";
                i++;
            }
            tabla += "#-#" + cantidad;
            msg = tabla;

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String guardarEstudiantesSemestreNew(String est, String id) {
        String msg = "";
        boolean sw = false;
        try {
            this.ps = this.co.prepareStatement("UPDATE estudiante SET estadoActivo='F';");
            this.ps.execute();
            this.ps.clearParameters();

            this.ps = this.co.prepareStatement("UPDATE actividad SET estado='2';");
            this.ps.execute();
            this.ps.clearParameters();

            String vec[] = est.split("#-#");
            for (String x : vec) {
                String ee[] = x.split("##");
                this.ps = this.co.prepareStatement("INSERT INTO acuerdoestudiante (idEstudiante, idAcuerdo, idSemestre) VALUES ((SELECT idEstudiante FROM estudiante WHERE documento=?),?,(SELECT idSemestre FROM semestre WHERE estado='1'));");
                this.ps.setString(1, ee[0]);
                this.ps.setString(2, ee[2]);
                int res = this.ps.executeUpdate();
                this.ps.clearParameters();

                if (res > 0) {
                    if (ee[1].equals("true")) {
                        this.ps = this.co.prepareStatement("UPDATE estudiante SET estadoActivo=? WHERE documento=?;");
                        this.ps.setString(1, "T");
                        this.ps.setString(2, ee[0]);
                        res = this.ps.executeUpdate();
                        if (res > 0) {
                            int rep = 0;
                            while (rep < 6) {
                                this.ps.clearParameters();
                                this.ps = this.co.prepareStatement("INSERT INTO seguimientoestudiante (idEstudiante, idSemestre, materia, primerCorte, segundoCorte, tercerCorte, cuartoCorte, observaciones, fechaRegistro) "
                                        + "VALUES ((SELECT idEstudiante FROM estudiante WHERE documento=?),(SELECT idSemestre FROM semestre WHERE estado='1'),'','','','','','',CURDATE());");
                                this.ps.setString(1, ee[0]);
                                res = this.ps.executeUpdate();
                                if (res > 0) {

                                    sw = true;
                                } else {
                                    sw = false;
                                    break;
                                }
                                rep++;
                            }
                            this.ps.clearParameters();
                            this.ps = this.co.prepareStatement("INSERT INTO seguimientoestudiante (idEstudiante, idSemestre, materia, primerCorte, segundoCorte, tercerCorte, cuartoCorte, observaciones, fechaRegistro) "
                                    + "VALUES ((SELECT idEstudiante FROM estudiante WHERE documento=?),(SELECT idSemestre FROM semestre WHERE estado='1'),'Beca Trabajo','0','0','0','0','0',CURDATE());");
                            this.ps.setString(1, ee[0]);
                            res = this.ps.executeUpdate();
                        } else {
                            sw = false;
                            break;
                        }
                        this.ps.clearParameters();
                    }
                } else {
                    sw = false;
                }
            }

            if (sw) {
                msg = "ok";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarSeguimiento(String id) {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT * FROM seguimientoEstudiante s, estudiante e WHERE s.idEstudiante=? AND e.idEstudiante=s.idEstudiante AND e.estadoActivo='T' AND s.idSemestre=(SELECT idSemestre FROM semestre WHERE estado='1') ORDER BY s.idSeguimientoEstudiante DESC;");
            this.ps.setString(1, id);
            this.rs = this.ps.executeQuery();
            String tabla = "";
            int i = 1;
            if (this.rs.next()) {
                this.rs.beforeFirst();
                while (this.rs.next()) {
                    tabla += "<tr>";
                    if (!this.rs.getString(4).equals("Beca Trabajo")) {
                        if (this.rs.getString(4).isEmpty()) {
                            tabla += "<td><input id=\"materia" + i + "\" name=\"" + this.rs.getString(1) + "\" placeholder=\"Materia\" maxlength=\"40\"></td>";
                        } else {
                            tabla += "<td><input id=\"materia" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + this.rs.getString(4) + "\" style=\"color: black;\" disabled></td>";
                        }
                        if (this.rs.getString(5).isEmpty()) {
                            tabla += "<td><input id=\"primero" + i + "\" name=\"" + this.rs.getString(1) + "\" placeholder=\"Primer Corte\" maxlength=\"4\"></td>";
                        } else {
                            tabla += "<td><input id=\"primero" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + this.rs.getString(5) + "\" style=\"color: black;\" disabled></td>";
                        }
                        if (this.rs.getString(6).isEmpty()) {
                            tabla += "<td><input id=\"segundo" + i + "\" name=\"" + this.rs.getString(1) + "\" placeholder=\"Segundo Corte\" maxlength=\"4\"></td>";
                        } else {
                            tabla += "<td><input id=\"segundo" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + this.rs.getString(6) + "\" style=\"color: black;\" disabled></td>";
                        }
                        if (this.rs.getString(7).isEmpty()) {
                            tabla += "<td><input id=\"tercero" + i + "\" name=\"" + this.rs.getString(1) + "\" placeholder=\"Tercer Corte\" maxlength=\"4\"></td>";
                        } else {
                            tabla += "<td><input id=\"tercero" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + this.rs.getString(7) + "\" style=\"color: black;\" disabled></td>";
                        }
                        if (this.rs.getString(8).isEmpty()) {
                            tabla += "<td><input id=\"cuarto" + i + "\" name=\"" + this.rs.getString(1) + "\" placeholder=\"Cuarto Corte\" maxlength=\"4\"></td>";
                        } else {
                            tabla += "<td><input id=\"cuarto" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + this.rs.getString(8) + "\" style=\"color: black;\" disabled></td>";
                        }
                    } else {
                        tabla += "<td><input id=\"materia" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + this.rs.getString(4) + "\" style=\"color: black;\" disabled></td>";
                        tabla += "<td><input id=\"primero" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + " " + "\" style=\"color: black;\" disabled></td>";
                        tabla += "<td><input id=\"segundo" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + " " + "\" style=\"color: black;\" disabled></td>";
                        tabla += "<td><input id=\"tercero" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + " " + "\" style=\"color: black;\" disabled></td>";
                        tabla += "<td><input id=\"cuarto" + i + "\" name=\"" + this.rs.getString(1) + "\" value=\"" + " " + "\" style=\"color: black;\" disabled></td>";
                    }
                    System.out.println("obs:: " + this.rs.getString("observaciones"));
                    tabla += "<td><textarea id=\"observaciones" + i + "\" name=\"" + this.rs.getString(1) + "\" style=\"margin: 0px; width: 229px; height: 78px;\">" + this.rs.getString("observaciones") + "</textarea></td>";
                    tabla += "</tr>";
                    i++;

                }
                msg = tabla;

            } else {
                msg = "vacio";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String guardarSeguimiento(String txt) {
        String msg = "";
        boolean sw = false;
        try {
            String vec[] = txt.split("#-#");
            for (String x : vec) {
                System.out.println(x);
                String ee[] = x.split("#_#");
                this.ps = this.co.prepareStatement("UPDATE seguimientoestudiante SET primerCorte=?, segundoCorte=?, tercerCorte=?, cuartoCorte=?, observaciones=?, materia=? WHERE idSeguimientoEstudiante=?;");
                this.ps.setString(1, ee[1]);
                this.ps.setString(2, ee[2]);
                this.ps.setString(3, ee[3]);
                this.ps.setString(4, ee[4]);
                this.ps.setString(5, ee[5]);
                this.ps.setString(6, ee[6]);
                this.ps.setString(7, ee[0]);
                int res = this.ps.executeUpdate();
                this.ps.clearParameters();

                if (res > 0) {
                    sw = true;
                } else {
                    sw = false;
                    break;
                }
            }

            if (sw) {
                msg = "ok";
            } else {
                msg = "error";
            }

        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String cargarAprobados() {
        String msg = "";
        boolean sw = false;
        ArrayList<ArrayList<String>> mat = new ArrayList();
        try {
            String idSem = "";
            this.ps = this.co.prepareStatement("SELECT idSemestre FROM semestre WHERE estado='1'");
            ResultSet r = this.ps.executeQuery();
            if (r.next()) {
                idSem = r.getString(1);
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT e.idEstudiante, e.nombres, e.documento FROM estudiante e WHERE e.estadoActivo='T';");
                this.rs = this.ps.executeQuery();
                String bt = "0";
                String at = "0";
                while (this.rs.next()) {
                    String horas = "0";
                    this.ps.clearParameters();
                    this.ps = this.co.prepareStatement("SELECT observaciones FROM seguimientoestudiante WHERE materia=? AND idEstudiante=? AND idSemestre=?");
                    this.ps.setString(1, "Beca Trabajo");
                    this.ps.setString(2, this.rs.getString(1));
                    this.ps.setString(3, idSem);
                    ResultSet r2 = this.ps.executeQuery();
                    if(r2.next()){
                        horas = r2.getString(1);
                    }
                    this.ps.clearParameters();
                    this.ps = this.co.prepareStatement("SELECT COUNT(idActividadEstudiante) FROM actividadestudiante ae, actividad a, estudiante e, semestre s \n" +
                                                        "WHERE e.idEstudiante = ae.idEstudiante AND ae.idActividad=a.idActividad AND a.idSemestre=s.idSemestre AND s.idSemestre=? AND e.idEstudiante=? AND ae.asistencia='T';");
                    this.ps.setString(1, idSem);
                    this.ps.setString(2, this.rs.getString(1));
                    ResultSet r3 = this.ps.executeQuery();
                    String cantActs = "0";
                    if(r3.next()){
                        cantActs = r3.getString(1);
                        System.out.println("cantidad::: "+cantActs);
                    }
                    ArrayList<String> est = new ArrayList();
                    est.add(this.rs.getString(1));
                    est.add(this.rs.getString(2));
                    est.add(this.rs.getString(3));
                    est.add(horas);
                    est.add(cantActs);
                    mat.add(est);
                }
                
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT * FROM aceptacion");
                ResultSet ac = this.ps.executeQuery();
                String res = "";
                while(ac.next()){
                    res += ac.getString(3) + "##";
                }
                bt = res.split("##")[0];
                at = res.split("##")[1];
                
                String ht = "0";
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT COUNT(idActividad) FROM actividad WHERE idSemestre=?");
                this.ps.setString(1, idSem);
                ResultSet hh = this.ps.executeQuery();
                if(hh.next()){
                    ht = hh.getString(1);
                }
                
                for(ArrayList aux: mat){
                    msg += aux.get(1) + "##";
                    msg += aux.get(2) + "##";
                    msg += aux.get(3) + "##";
                    msg += aux.get(4) + "##";
                    System.out.println(bt + "  -  "+ aux.get(3).toString()+"   -   "+ aux.get(4).toString()+"   -    "+ht+"   -   "+at);
                    if(ht.equals(aux.get(4).toString()) && ht.equals("0")){
                        ht = "1";
                        aux.set(4, "1");
                    }
                    if(((Integer.parseInt(bt) - Integer.parseInt(aux.get(3).toString())) < 10) && ((Integer.parseInt(aux.get(4).toString()) * 100)/Integer.parseInt(ht)) > Integer.parseInt(at)){
                        msg += "true#-#";
                    }
                    else{
                        msg += "false#-#";
                    }
                    System.out.println("msg::  "+msg);
                }
            }
        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String asistenciasxactividad() {
        String msg = "";
        try {
            this.ps = this.co.prepareStatement("SELECT idSemestre FROM semestre WHERE estado='1'");
            ResultSet r = this.ps.executeQuery();
            if(r.next()){
                String idSem = r.getString(1);
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT idActividad, nombre, if(obligatoriedad = '1','Reunion','Actividad') FROM actividad WHERE idSemestre="+idSem+";");
                this.rs = this.ps.executeQuery();
                while(this.rs.next()){
                    this.ps.clearParameters();
                    this.ps = this.co.prepareStatement("SELECT COUNT(idActividadEstudiante) FROM actividadestudiante WHERE idActividad=? AND asistencia='T'");
                    this.ps.setString(1, this.rs.getString(1));
                    ResultSet t = this.ps.executeQuery();
                    if(t.next()){
                        msg += this.rs.getString(2)+"("+this.rs.getString(3)+")"+"##"+t.getString(1)+"#-#";
                    }
                }
            }
            else{
                msg = "vacio";
            }
        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }
    
    public String asistenciasxactividadHis() {
        String msg = "vacio";
        try {
            this.ps = this.co.prepareStatement("SELECT idSemestre FROM semestre");
            ResultSet r = this.ps.executeQuery();
            while(r.next()){
                if(msg.equals("vacio")){
                    msg = "";
                }
                String idSem = r.getString(1);
                this.ps.clearParameters();
                this.ps = this.co.prepareStatement("SELECT idActividad, nombre, if(obligatoriedad = '1','Reunion','Actividad') FROM actividad WHERE idSemestre="+idSem+";");
                this.rs = this.ps.executeQuery();
                while(this.rs.next()){
                    this.ps.clearParameters();
                    this.ps = this.co.prepareStatement("SELECT COUNT(idActividadEstudiante) FROM actividadestudiante WHERE idActividad=? AND asistencia='T'");
                    this.ps.setString(1, this.rs.getString(1));
                    ResultSet t = this.ps.executeQuery();
                    if(t.next()){
                        msg += this.rs.getString(2)+"("+this.rs.getString(3)+")"+"##"+t.getString(1)+"#-#";
                    }
                }
            }
        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }
    
    public String actividadesxsemestre() {
        String msg = "vacio";
        try {
            this.ps = this.co.prepareStatement("select s.indicativo, sum(if(a.obligatoriedad='1',1,0)) reunion, sum(if(a.obligatoriedad='2',1,0)) activi FROM actividad a INNER JOIN semestre s ON a.idSemestre=s.idSemestre group by 1;");
            ResultSet r = this.ps.executeQuery();
            while(r.next()){
                if(msg.equals("vacio")){
                    msg = "";
                }
                msg += r.getString(1) + "##" + r.getString(2) + "##" + r.getString(3) + "#-#";
            }
        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }
    
    public String estudiantesxsemestre() {
        String msg = "vacio";
        try {
            this.ps = this.co.prepareStatement("select s.indicativo, count(DISTINCT(a.idEstudiante)) FROM acuerdoestudiante a INNER JOIN semestre s ON a.idSemestre=s.idSemestre group by 1;");
            ResultSet r = this.ps.executeQuery();
            while(r.next()){
                if(msg.equals("vacio")){
                    msg = "";
                }
                msg += r.getString(1) + "##" + r.getString(2) + "#-#";
            }
        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }

    public String listadoEstudiantes() {
        String msg = "vacio";
        try {
            this.ps = this.co.prepareStatement("select nombres, apellidos,documento, estadoActivo from estudiante;");
            ResultSet r = this.ps.executeQuery();
            while(r.next()){
                if(msg.equals("vacio")){
                    msg = "";
                }
                msg += r.getString(1) + "##" + r.getString(2) +"##"+ r.getString(3)+ "##"+r.getString(4)+ "#-#";
            }
        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }
    
    public String listadoEstudiantesAct() {
        String msg = "vacio";
        try {
            this.ps = this.co.prepareStatement("select nombres, apellidos,documento, estadoActivo from estudiante where estadoActivo='T';");
            ResultSet r = this.ps.executeQuery();
            while(r.next()){
                if(msg.equals("vacio")){
                    msg = "";
                }
                msg += r.getString(1) + "##" + r.getString(2) +"##"+ r.getString(3)+ "##"+r.getString(4)+ "#-#";
            }
        } catch (SQLException sq) {
            System.out.println(sq.getMessage());
            if (sq.getMessage().indexOf("Duplicate entry") > -1) {
                msg = "dupli";
            } else {
                msg = "error";
            }
        } finally {
            try {
                this.ps.close();
                this.ps = null;
                this.rs = null;
            } catch (SQLException ex) {
                Logger.getLogger(AdministradorDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return msg;
    }
}
