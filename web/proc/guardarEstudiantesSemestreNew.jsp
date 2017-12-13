<%-- 
    Document   : guardarEstudiantesSemestreNew
    Created on : 10/12/2017, 09:45:37 AM
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
        String est = new String(request.getParameter("est").getBytes("ISO-8859-1"), "UTF-8");
        //String id = new String(request.getParameter("idSemAnt").getBytes("ISO-8859-1"), "UTF-8");
        System.out.println("JSPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP :::::::::::::::::      "+est+"            ");
        String id = ""; 
        String msg = facade.guardarEstudiantesSemestreNew(est,id);
        out.print(msg);
    }catch(Exception e){
        System.out.println(e.getMessage());
        out.print("error");
    }
     
    %>