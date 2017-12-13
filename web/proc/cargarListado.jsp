<%-- 
    Document   : cargarListado
    Created on : 29/11/2017, 06:58:15 PM
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
        String msg = facade.cargarListado(index);
        session.setAttribute("listEst", msg.split("#-#")[0]);
        session.setAttribute("cantidadEst", msg.split("#-#")[1]);
        session.setAttribute("indexAct", msg.split("#-#")[2]);
        out.print(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
     
    %>
