<%-- 
    Document   : cargarEstudiante
    Created on : 23/11/2017, 10:25:17 PM
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
        String doc = new String(request.getParameter("doc").getBytes("ISO-8859-1"), "UTF-8");
        String msg = facade.cargarEstudiante(doc);
        out.print(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
    %>
