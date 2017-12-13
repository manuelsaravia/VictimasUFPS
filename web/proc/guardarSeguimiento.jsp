<%-- 
    Document   : guardarSeguimiento
    Created on : 10/12/2017, 08:13:09 PM
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
    try {
        String txt = new String(request.getParameter("txt").getBytes("ISO-8859-1"), "UTF-8");
        String id = session.getAttribute("idEstudiante").toString();
        if (!id.isEmpty()) {
            String msg = facade.guardarSeguimiento(txt);
            System.out.println(msg + "-");
            out.println(msg);
        } else {
            out.print("vacio");
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
        out.print("error");
    }
%>
