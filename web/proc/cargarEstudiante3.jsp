<%-- 
    Document   : cargarEstudiante3
    Created on : 4/12/2017, 10:24:01 PM
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
        String msg = facade.cargarEstudiante3(doc);
        if(!msg.equals("vacio") && !msg.equals("error")){
        session.setAttribute("idEstudiante", msg.split("#-#")[0]);
        session.setAttribute("nombreEstudiante", msg.split("#-#")[1]);
        session.setAttribute("documento",doc);
        out.print(msg);
        }
        else{
            out.print(msg);
        }
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
    %>
