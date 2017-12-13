<%-- 
    Document   : cargarSemestres
    Created on : 5/12/2017, 10:18:33 PM
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
        String msg = facade.cargarSemestres();
        session.setAttribute("semestres",msg.split("#-#")[0]);
        session.setAttribute("cantidad",msg.split("#-#")[1]);
        session.setAttribute("idSemAnt",msg.split("#-#")[2]);
        out.print("OK");
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
     
    %>
