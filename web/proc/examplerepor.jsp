<%-- 
Document : examplerepor
Created on : 11/12/2017## 09:09:21 AM
Author : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
<%
//String x = "Mushrooms##3#-#Onions##1#-#Olive##1#-#Zucchini##1#-#Pepperoni##2#-#";
//out.print(x);

 String y = "2004/05##165##938##522##998##450##614.6#-#2005/06##135##1120##599##1268##288##682#-#2006/07##157##1167##587##807##397##623#-#2007/08##139##1110##615##968##215##609.4#-#2008/09##136##691##629##1026##366##569.6#.#";
 out.print(y);
%>
