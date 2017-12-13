<%-- 
    Document   : cargarActividades
    Created on : 24/11/2017, 12:53:11 PM
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
        String msg = facade.cargarActividades();
        System.out.println(msg);
        session.setAttribute("actsini", msg);
        out.print(msg);
        //response.sendRedirect("../view/iniciarActividad.jsp");
    }catch(Exception e){
        System.out.println(e.getMessage());
        //response.sendRedirect("../authError.html");
        out.print("error");
    }
    %>
