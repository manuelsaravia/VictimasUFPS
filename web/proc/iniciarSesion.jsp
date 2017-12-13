<%-- 
    Document   : iniciarSesion
    Created on : 30/10/2017, 09:49:58 AM
    Author     : j_saravia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="f" class="facade.Facade" scope="session"></jsp:useBean>
    <%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
<%
    String user = new String(request.getParameter("user").getBytes("ISO-8859-1"), "UTF-8");
    String pass = new String(request.getParameter("pass").getBytes("ISO-8859-1"), "UTF-8");
    System.out.println(user);
    System.out.println(pass);
    String msg = f.iniciarSesion(user,pass);
    if(!msg.equals("vacio") && !msg.equals("error")){
        session.setAttribute("idAdministrador", msg.split("##")[0]);
    }
    out.print(msg);
    
    %>