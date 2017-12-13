<%-- 
    Document   : registrarActividad
    Created on : 22/11/2017, 05:28:57 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="facade.Facade" scope="session"></jsp:useBean>
<jsp:useBean id="actividad" class="dto.Actividad" scope="session"></jsp:useBean>
    <%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
<%
    try{
        String nombre = new String(request.getParameter("nombre").getBytes("ISO-8859-1"), "UTF-8");
        String fecha = new String(request.getParameter("fecha").getBytes("ISO-8859-1"), "UTF-8");
        String lugar = new String(request.getParameter("lugar").getBytes("ISO-8859-1"), "UTF-8");
        String obligatoriedad = new String(request.getParameter("obligatoriedad").getBytes("ISO-8859-1"), "UTF-8");
        String hora = new String(request.getParameter("hora").getBytes("ISO-8859-1"), "UTF-8");
        actividad.setNombre(nombre);
        actividad.setFecha(fecha);
        actividad.setLugar(lugar);
        actividad.setObligatoriedad(obligatoriedad);
        actividad.setHora(hora);
        String msg = facade.registrarActividad(actividad);
        out.print(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
    %>
