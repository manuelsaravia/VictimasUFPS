<%-- 
    Document   : asistenciasxactividad
    Created on : 13/12/2017, 12:33:11 AM
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
        out.print(facade.asistenciasxactividad());
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
    %>
