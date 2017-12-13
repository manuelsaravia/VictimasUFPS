<%-- 
    Document   : cargarTomarLista
    Created on : 29/11/2017, 05:39:59 PM
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
        String msg = facade.cargarActividadesLis();
        System.out.println(msg);
        session.setAttribute("actslis", msg);
        out.print(msg);
        //response.sendRedirect("../view/iniciarActividad.jsp");
    }catch(Exception e){
        System.out.println(e.getMessage());
        //response.sendRedirect("../authError.html");
        out.print("error");
    }
    %>
