<%-- 
    Document   : crearSemestre
    Created on : 22/11/2017, 11:04:11 AM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="facade" class="facade.Facade" scope="session"></jsp:useBean>
    <%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
<%
    try{
    String fecha = new String(request.getParameter("fecha").getBytes("ISO-8859-1"), "UTF-8");
        String msg = facade.crearSemestre(fecha);
        out.print(msg);
    }
    catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
    %>
