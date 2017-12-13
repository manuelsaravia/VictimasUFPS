<%-- 
    Document   : cargarActividadesFin
    Created on : 24/11/2017, 04:38:42 PM
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
        String msg = facade.cargarActividadesFin();
        System.out.println(msg);
        session.setAttribute("actsfin", msg);
        response.sendRedirect("../view/finalizarActividad.jsp");
    }catch(Exception e){
        System.out.println(e.getMessage());
        response.sendRedirect("../authError.html");
    }
    %>