<%-- 
    Document   : cargarEstudiante2
    Created on : 26/11/2017, 06:20:54 PM
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
        String msg = facade.cargarEstudiante2(doc);
        session.setAttribute("idEstudiante", msg.split("#-#")[0]);
        session.setAttribute("nombreEstudiante", msg.split("#-#")[1]);
        session.setAttribute("documento",doc);
        out.print(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
    %>
