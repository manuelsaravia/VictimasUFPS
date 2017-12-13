<%-- 
    Document   : cerrarSesion
    Created on : 24/11/2017, 06:04:33 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
<%
    session.setAttribute("idAdministrador", "");
    session.invalidate();
    response.sendRedirect("../index.jsp");
    %>
