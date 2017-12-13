<%-- 
    Document   : cargarEstudiantesSemestreNew
    Created on : 6/12/2017, 05:41:58 PM
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
    try{//session.getAttribute("idSemAnt").toString()
        String msg = facade.cargarEstudiantesSemestreNew();
        System.out.println(msg);
        session.setAttribute("cantidadEst",msg.split("#-#")[1]);
        session.setAttribute("estudiantesSemestre", msg.split("#-#")[0]);
        out.print(msg);
        //response.sendRedirect("../view/iniciarActividad.jsp");
    }catch(Exception e){
        System.out.println(e.getMessage());
        //response.sendRedirect("../authError.html");
        out.print("error");
    }
    %>
