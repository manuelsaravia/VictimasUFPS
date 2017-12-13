<%-- 
    Document   : tipoAnexo
    Created on : 26/11/2017, 06:11:23 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
<%
    try{
        String tipoAnexo = new String(request.getParameter("tipoAnexo").getBytes("ISO-8859-1"), "UTF-8");
        System.out.println("tipooooooooooo.::      "+tipoAnexo);
        if(tipoAnexo.equals("n")){
            out.print("error");
        }
        else{
            session.setAttribute("tipoAnexo", tipoAnexo);
        out.print("exito");
        }
        
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.println("error");
    }
    %>