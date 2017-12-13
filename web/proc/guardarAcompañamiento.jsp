<%-- 
    Document   : guardarAcompañamiento
    Created on : 5/12/2017, 07:34:44 PM
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
        String doc = new String(request.getParameter("acom").getBytes("ISO-8859-1"), "UTF-8");
        System.out.println(doc);
        String msg = facade.guardarAcompanamiento(doc, session.getAttribute("idEstudiante").toString());
        //session.setAttribute("idEstudiante", msg.split("#-#")[0]);
        //session.setAttribute("nombreEstudiante", msg.split("#-#")[1]);
        //session.setAttribute("documento",doc);
        out.print(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
    %>