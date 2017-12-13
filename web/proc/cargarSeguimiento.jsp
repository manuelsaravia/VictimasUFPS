<%-- 
    Document   : cargarSeguimiento
    Created on : 10/12/2017, 05:25:05 PM
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
        String id = session.getAttribute("idEstudiante").toString();
        
        String msg = facade.cargarSeguimiento(id);
        System.out.println(msg+"-");
        if(msg.equals("vacio") || msg.equals("error")){
            session.setAttribute("idEstudiante", "");
            session.setAttribute("nombreEstudiante", "");
            session.setAttribute("documento", "");
            session.setAttribute("materiasEstudiante", "");
        }
        else{
            session.setAttribute("materiasEstudiante", msg);
        }
        
        out.println(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
    %>
