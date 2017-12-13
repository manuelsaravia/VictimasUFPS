<%-- 
    Document   : actualizarEstudiante
    Created on : 28/11/2017, 11:46:11 PM
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
        System.out.println("jsp");
        String doc = new String(request.getParameter("doc").getBytes("ISO-8859-1"), "UTF-8");
        String campo = new String(request.getParameter("campo").getBytes("ISO-8859-1"), "UTF-8");
        String valor = new String(request.getParameter("valor").getBytes("ISO-8859-1"), "UTF-8");
        
        String msg = facade.actualizarEstudiante(doc,campo,valor);
        out.print(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
    %>
