<%-- 
    Document   : guardarSemestres
    Created on : 5/12/2017, 11:08:28 PM
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
        System.out.println("llegooo hpta");
        String sems = new String(request.getParameter("sems").getBytes("ISO-8859-1"), "UTF-8");
        String msg = facade.guardarSemestres(sems);
        out.print(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
     
    %>
