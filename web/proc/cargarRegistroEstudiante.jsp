<%-- 
    Document   : cargarRegistroEstudiante
    Created on : 11/12/2017, 10:47:58 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="facade.Facade" scope="session"></jsp:useBean>
<%
    if (session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()) {
        response.sendRedirect("../index.jsp");
    }

    try {
        String msg = facade.cargarRegistroEstudiante();
        String d[] = msg.split("#-#");
            System.out.println(d[0] + "   sems");
            session.setAttribute("semestres", d[0]);
            System.out.println(d[1] + "    acus");
            session.setAttribute("acuerdos", d[1]);
        

        response.sendRedirect("../view/registroEstudiante.jsp");
    } catch (Exception e) {
        System.out.println(e.getMessage());
        response.sendRedirect("../authError.html");
    }
%>
