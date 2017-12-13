<%-- 
    Document   : cargarActividadesHis
    Created on : 24/11/2017, 05:48:31 PM
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
        String msg = facade.cargarActividadesHis();
        System.out.println(msg);
        session.setAttribute("actshis", msg);
        out.print(msg);
        //response.sendRedirect("../view/iniciarActividad.jsp");
    }catch(Exception e){
        System.out.println(e.getMessage());
        //response.sendRedirect("../authError.html");
        out.print("error");
    }
    %>