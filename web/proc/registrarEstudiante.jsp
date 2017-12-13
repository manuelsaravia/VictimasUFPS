<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.InformacionLaboral"%>
<%@page import="dto.Discapacidad"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="estudiante" class="dto.Estudiante" scope="page"></jsp:useBean>
<jsp:useBean id="discapacidad" class="dto.Discapacidad" scope="page"></jsp:useBean>
<jsp:useBean id="acudiente" class="dto.Acudiente" scope="page"></jsp:useBean>
<jsp:useBean id="responsable" class="dto.Responsable" scope="page"></jsp:useBean>
<jsp:useBean id="laboral" class="dto.InformacionLaboral" scope="page"></jsp:useBean>
<jsp:useBean id="nucleo" class="dto.NucleoFamiliar" scope="page"></jsp:useBean>
<jsp:useBean id="programa" class="dto.ProgramaAcademico" scope="page"></jsp:useBean>
<jsp:useBean id="facade" class="facade.Facade" scope="session"></jsp:useBean>
    <%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
<%
    try {
        System.out.println("llego a registrar");
        //estudiante
        String nombres = new String(request.getParameter("nombres").getBytes("ISO-8859-1"), "UTF-8");
        String apellidos = new String(request.getParameter("apellidos").getBytes("ISO-8859-1"), "UTF-8");
        String codigo = new String(request.getParameter("codigo").getBytes("ISO-8859-1"), "UTF-8");
        String documento = new String(request.getParameter("documento").getBytes("ISO-8859-1"), "UTF-8");
        String lugarExpedicion = new String(request.getParameter("lugarExpedicion").getBytes("ISO-8859-1"), "UTF-8");
        String fechaNac = new String(request.getParameter("fechaNac").getBytes("ISO-8859-1"), "UTF-8");
        String municipioNacimiento = new String(request.getParameter("municipioNacimiento").getBytes("ISO-8859-1"), "UTF-8");
        String direccionResidencia = new String(request.getParameter("direccionResidencia").getBytes("ISO-8859-1"), "UTF-8");
        String municipioResidencia = new String(request.getParameter("municipioResidencia").getBytes("ISO-8859-1"), "UTF-8");
        String estrato = new String(request.getParameter("estrato").getBytes("ISO-8859-1"), "UTF-8");
        String estadoCivil = new String(request.getParameter("estadoCivil").getBytes("ISO-8859-1"), "UTF-8");
        String numeroHijos = new String(request.getParameter("numeroHijos").getBytes("ISO-8859-1"), "UTF-8");
        String grupoEtnico = new String(request.getParameter("grupoEtnico").getBytes("ISO-8859-1"), "UTF-8");
        String email = new String(request.getParameter("email").getBytes("ISO-8859-1"), "UTF-8");
        String telefono = new String(request.getParameter("telefono").getBytes("ISO-8859-1"), "UTF-8");
        String mujerCabeza = new String(request.getParameter("mujerCabeza").getBytes("ISO-8859-1"), "UTF-8");
        estudiante.setNombre(nombres);
        estudiante.setApellido(apellidos);
        estudiante.setCodigo(Integer.parseInt(codigo));
        estudiante.setDocumento(documento);
        estudiante.setLugarExpedicion(lugarExpedicion);
        estudiante.setFechaNac(fechaNac);
        estudiante.setMunicipioNacimiento(municipioNacimiento);
        estudiante.setDireccionResidencia(direccionResidencia);
        estudiante.setMunicipioResidencia(municipioResidencia);
        estudiante.setEstrato(Integer.parseInt(estrato));
        estudiante.setEstadoCivil(estadoCivil);
        estudiante.setNumeroHijos(Integer.parseInt(numeroHijos));
        estudiante.setGrupoEtnico(Boolean.parseBoolean(grupoEtnico));
        estudiante.setEmail(email);
        estudiante.setTelefono(telefono);
        estudiante.setMujerCabeza(Boolean.parseBoolean(mujerCabeza));
        
        
        //discapacidades
        String sordera = new String(request.getParameter("sordera").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d1 = new Discapacidad("sordera",Boolean.parseBoolean(sordera));
        String neuromuscular = new String(request.getParameter("neuromuscular").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d2 = new Discapacidad("neuromuscular",Boolean.parseBoolean(neuromuscular));
        
        System.out.println("antes de");
        System.out.println(d2.getNombre() +"  "+ d2.isValor());
        System.out.println("despues de");
        String audicion = new String(request.getParameter("audicion").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d3 = new Discapacidad("audicion",Boolean.parseBoolean(audicion));
        String autismo = new String(request.getParameter("autismo").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d4 = new Discapacidad("autismo",Boolean.parseBoolean(autismo));
        String vision = new String(request.getParameter("vision").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d5 = new Discapacidad("vision",Boolean.parseBoolean(vision));
        String retardo = new String(request.getParameter("retardo").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d6 = new Discapacidad("retardo",Boolean.parseBoolean(retardo));
        String ceguera = new String(request.getParameter("ceguera").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d7 = new Discapacidad("ceguera",Boolean.parseBoolean(ceguera));
        String down = new String(request.getParameter("down").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d8 = new Discapacidad("down",Boolean.parseBoolean(down));
        String mudez = new String(request.getParameter("mudez").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d9 = new Discapacidad("mudez",Boolean.parseBoolean(mudez));
        String cerebral = new String(request.getParameter("cerebral").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d10 = new Discapacidad("cerebral",Boolean.parseBoolean(cerebral));
        String fisica = new String(request.getParameter("fisica").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d11 = new Discapacidad("fisica",Boolean.parseBoolean(fisica));
        String noAplica = new String(request.getParameter("noAplica").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d12 = new Discapacidad("noAplica",Boolean.parseBoolean(noAplica));
        System.out.println(d12.getNombre());
        System.out.println(d12.isValor() + "");
        
        String noReporta = new String(request.getParameter("noReporta").getBytes("ISO-8859-1"), "UTF-8");
        Discapacidad d13 = new Discapacidad("noReporta",Boolean.parseBoolean(noReporta));
        estudiante.add(d1);
        estudiante.add(d2);
        estudiante.add(d3);
        estudiante.add(d4);
        estudiante.add(d5);
        estudiante.add(d6);
        estudiante.add(d7);
        estudiante.add(d8);
        estudiante.add(d9);
        estudiante.add(d10);
        estudiante.add(d11);
        estudiante.add(d12);
        estudiante.add(d13);
        System.out.println("ok discapacidades");
        
        //programa academico
        String programaAcademico = new String(request.getParameter("programaAcademico").getBytes("ISO-8859-1"), "UTF-8");
        String modalidad = new String(request.getParameter("modalidad").getBytes("ISO-8859-1"), "UTF-8");
        String semestreQueEntro = new String(request.getParameter("semestreQueEntro").getBytes("ISO-8859-1"), "UTF-8");
        String jornada = new String(request.getParameter("jornada").getBytes("ISO-8859-1"), "UTF-8");
        String hechoVictimizante = new String(request.getParameter("hechoVictimizante").getBytes("ISO-8859-1"), "UTF-8");
        String acuerdo = new String(request.getParameter("acuerdo").getBytes("ISO-8859-1"), "UTF-8");
        String grupoPerteneciente = new String(request.getParameter("grupoPerteneciente").getBytes("ISO-8859-1"), "UTF-8");
        String estadoActivo = "F";//new String(request.getParameter("estadoActivo").getBytes("ISO-8859-1"), "UTF-8");
        programa.setNombre(programaAcademico);
        programa.setModalidad(modalidad);
        programa.setSemestreQueEntro(semestreQueEntro);
        programa.setJornada(jornada);
        estudiante.setHechoVictimizante(hechoVictimizante);
        estudiante.setAcuerdo(acuerdo);
        programa.setGrupoPerteneciente(grupoPerteneciente);
        estudiante.setEstadoActivo(Boolean.parseBoolean(estadoActivo));
        estudiante.setPrograma(programa);
        
        //acudiente
        String nombresAcudiente = new String(request.getParameter("nombresAcudiente").getBytes("ISO-8859-1"), "UTF-8");
        String apellidosAcudiente = new String(request.getParameter("apellidosAcudiente").getBytes("ISO-8859-1"), "UTF-8");
        String telefonoAcudiente = new String(request.getParameter("telefonoAcudiente").getBytes("ISO-8859-1"), "UTF-8");
        String direccionResidenciaAcudiente = new String(request.getParameter("direccionResidenciaAcudiente").getBytes("ISO-8859-1"), "UTF-8");
        String municipioResidenciaAcudiente = new String(request.getParameter("municipioResidenciaAcudiente").getBytes("ISO-8859-1"), "UTF-8");
        acudiente.setNombre(nombresAcudiente);
        acudiente.setApellido(apellidosAcudiente);
        acudiente.setTelefono(telefonoAcudiente);
        acudiente.setDireccionResidencia(direccionResidenciaAcudiente);
        acudiente.setMunicipioResidencia(municipioResidenciaAcudiente);
        estudiante.setAcudiente(acudiente);
        
        //responsable
        String nombresResponsable = new String(request.getParameter("nombresResponsable").getBytes("ISO-8859-1"), "UTF-8");
        String apellidosResponsable = new String(request.getParameter("apellidosResponsable").getBytes("ISO-8859-1"), "UTF-8");
        String telefonoResponsable = new String(request.getParameter("telefonoResponsable").getBytes("ISO-8859-1"), "UTF-8");
        String direccionResidenciaResponsable = new String(request.getParameter("direccionResidenciaResponsable").getBytes("ISO-8859-1"), "UTF-8");
        String municipioResidenciaResponsable = new String(request.getParameter("municipioResidenciaResponsable").getBytes("ISO-8859-1"), "UTF-8");
        String cargoResponsable = new String(request.getParameter("cargoResponsable").getBytes("ISO-8859-1"), "UTF-8");
        String emailResponsable = new String(request.getParameter("emailResponsable").getBytes("ISO-8859-1"), "UTF-8");
        responsable.setNombre(nombresResponsable);
        responsable.setApellido(apellidosResponsable);
        responsable.setTelefono(telefonoResponsable);
        responsable.setDireccionResidencial(direccionResidenciaResponsable);
        responsable.setMunicipioResidencial(municipioResidenciaResponsable);
        responsable.setCargoResponsable(cargoResponsable);
        responsable.setEmailResponsable(emailResponsable);
        estudiante.setResponsable(responsable);
        
        //nucleo familiar
        String numeroHermanos = new String(request.getParameter("numeroHermanos").getBytes("ISO-8859-1"), "UTF-8");
        String posicionHermanos = new String(request.getParameter("posicionHermanos").getBytes("ISO-8859-1"), "UTF-8");
        String direccionResidenciaFamiliar = new String(request.getParameter("direccionResidenciaFamiliar").getBytes("ISO-8859-1"), "UTF-8");
        String municipioResidenciaFamiliar = new String(request.getParameter("municipioResidenciaFamiliar").getBytes("ISO-8859-1"), "UTF-8");
        String tipoViviendaFamiliar = new String(request.getParameter("tipoViviendaFamiliar").getBytes("ISO-8859-1"), "UTF-8");
        String estratoFamiliar = new String(request.getParameter("estratoFamiliar").getBytes("ISO-8859-1"), "UTF-8");
        String zonaUbicacionFamiliar = new String(request.getParameter("zonaUbicacionFamiliar").getBytes("ISO-8859-1"), "UTF-8");
        String tendenciaFamiliar = new String(request.getParameter("tendenciaFamiliar").getBytes("ISO-8859-1"), "UTF-8");
        String telefonoFamiliar = new String(request.getParameter("telefonoFamiliar").getBytes("ISO-8859-1"), "UTF-8");
        String permanenciaVivienda = new String(request.getParameter("permanenciaVivienda").getBytes("ISO-8859-1"), "UTF-8");
        nucleo.setNumeroHermanos(Integer.parseInt(numeroHermanos));
        nucleo.setPosicionHermanos(Integer.parseInt(posicionHermanos));
        nucleo.setDireccionResidencia(direccionResidenciaFamiliar);
        nucleo.setMunicipioResidencia(municipioResidenciaFamiliar);
        nucleo.setTipoVivienda(tipoViviendaFamiliar);
        nucleo.setEstratoFamiliar(Integer.parseInt(estratoFamiliar));
        nucleo.setZonaUbicacion(zonaUbicacionFamiliar);
        nucleo.setTendenciaFamiliar(tendenciaFamiliar);
        nucleo.setTelefonoFamiliar(telefonoFamiliar);
        nucleo.setPermanenciaVivienda(permanenciaVivienda);
        estudiante.setNucleo(nucleo);
        
        
        //informacion laboral
        String nombresLaboral1 = new String(request.getParameter("nombresLaboral1").getBytes("ISO-8859-1"), "UTF-8");
        String parentescoLaboral1 = new String(request.getParameter("parentescoLaboral1").getBytes("ISO-8859-1"), "UTF-8");
        String fechaNacLaboral1 = new String(request.getParameter("fechaNacLaboral1").getBytes("ISO-8859-1"), "UTF-8");
        String ocupacionLaboral1 = new String(request.getParameter("ocupacionLaboral1").getBytes("ISO-8859-1"), "UTF-8");
        String ingresosLaboral1 = new String(request.getParameter("ingresosLaboral1").getBytes("ISO-8859-1"), "UTF-8");
        //ingresos adicionales
        String ingresosAdicionales = new String(request.getParameter("ingresosAdicionales").getBytes("ISO-8859-1"), "UTF-8");
        estudiante.addLaboral(nombresLaboral1, parentescoLaboral1, fechaNacLaboral1, ocupacionLaboral1, ingresosLaboral1);
        System.out.println(ingresosAdicionales+ "     jsp");
        if(!ingresosAdicionales.isEmpty()){
        estudiante.addLaboral2(ingresosAdicionales);
        }
        
        
        //sostenimiento 
        String trabaja = new String(request.getParameter("trabaja").getBytes("ISO-8859-1"), "UTF-8");
        String lugarTrabajo = new String(request.getParameter("lugarTrabajo").getBytes("ISO-8859-1"), "UTF-8");
        String presupuestoMensual = new String(request.getParameter("presupuestoMensual").getBytes("ISO-8859-1"), "UTF-8");
        String comoSostiene = new String(request.getParameter("comoSostiene").getBytes("ISO-8859-1"), "UTF-8");
        String observaciones = new String(request.getParameter("observaciones").getBytes("ISO-8859-1"), "UTF-8");
        estudiante.setTrabaja(Boolean.parseBoolean(trabaja));
        estudiante.setPresupuestoMensual(Double.parseDouble(presupuestoMensual));
        estudiante.setLugarTrabajo(lugarTrabajo);
        estudiante.setComoSostiene(comoSostiene);
        estudiante.setObservaciones(observaciones);
        
        //caracterizacion
        String situacionPsicologica = new String(request.getParameter("situacionPsicologica").getBytes("ISO-8859-1"), "UTF-8");
        String riesgosPermanencia = new String(request.getParameter("riesgosPermanencia").getBytes("ISO-8859-1"), "UTF-8");
        estudiante.setSituacionPsicologica(situacionPsicologica);
        estudiante.setRiesgosPermanencia(riesgosPermanencia);
        
        System.out.println(estudiante.toString());
        
        String msg = facade.registrarEstudiante(estudiante);
        System.out.println(msg);
        out.print(msg);
    }
    catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }

%>