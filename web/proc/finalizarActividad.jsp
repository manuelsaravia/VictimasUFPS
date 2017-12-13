<%-- 
    Document   : finalizarActividad
    Created on : 24/11/2017, 04:43:24 PM
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
        String index = new String(request.getParameter("index").getBytes("ISO-8859-1"), "UTF-8");
        String msg = facade.finalizarActividad(index);
        out.print(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
     
    %>