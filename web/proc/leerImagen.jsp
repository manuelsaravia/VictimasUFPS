<%-- 
    Document   : leerImagen
    Created on : 1/06/2016, 09:40:43 PM
    Author     : Manuel
--%>

<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Path"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletRequestContext"%>
<%@page import="com.oreilly.servlet.multipart.*"%>

<%@page import="com.sun.org.apache.xpath.internal.NodeSet"%>
<%@page import="org.w3c.dom.NodeList"%>
<!DOCTYPE html>
<%@ page import="java.io.*" %> 
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*"
        import="org.apache.commons.fileupload.*"
        import="org.apache.commons.fileupload.servlet.*"
        import="org.apache.commons.fileupload.disk.*"
        import="com.oreilly.servlet.multipart.*"
        import="java.io.*"
        %>
<jsp:useBean id="facade" class="facade.Facade" scope="session"></jsp:useBean>
    <%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
<%
    if (session.getAttribute("idEstudiante") != null) {
        if (!session.getAttribute("tipoAnexo").toString().equals("") && !session.getAttribute("tipoAnexo").toString().equals("n")) {
            String salida = "Imagen cargada: ";
            String ruta = getServletContext().getRealPath("/docs/").replace("./", "/");
            String ruta22 = getServletContext().getContextPath();
            String dir = ruta + "\\";
            System.out.println("la ruta es: " + ruta);
            System.out.println("la ruta2 es: " + ruta22);
            String tipoAnexo = session.getAttribute("tipoAnexo").toString();
            System.out.println(tipoAnexo);
            String idEstudiante = session.getAttribute("idEstudiante").toString();
            System.out.println(idEstudiante);
            String doc = session.getAttribute("documento").toString();
            System.out.println(doc);
            try {
                File destino = new File(ruta);
                ServletRequestContext src = new ServletRequestContext(request);
                String name = "";
                //System.out.println("srccccccc :  " + request.getAttribute("anexo").toString().length());
                System.out.println("src :  " + src.toString());
                File file = null;
                if (ServletFileUpload.isMultipartContent(src)) {
                    System.out.println("dentro del primer if");
                    DiskFileItemFactory factory = new DiskFileItemFactory((10 * 1024 * 1024), destino);
                    System.out.println("nadaa");
                    ServletFileUpload upload = new ServletFileUpload(factory);

                    java.util.List lista = upload.parseRequest(src);

                    java.util.Iterator it = lista.iterator();

                    while (it.hasNext()) {
                        FileItem item = (FileItem) it.next();
                        if (item.isFormField()) {
                            out.println(item.getFieldName() + "<br>");
                            System.out.println("tamaño estandar if: " + file.length());
                        } else {
                            file = new File(item.getName());
                            name = item.getName();
                            item.write(new File(destino, idEstudiante + doc + file.getName()));
                            System.out.println("tamaño estandar: " + file.length());
                        } // end if
                    } // end while
                } // end if

                String cc = getServletContext().getRealPath("/docs/").replace("./", "/");
                System.out.println("la cc es ::: " + cc);
                String s = System.getProperty("file.separator");
                char sep = s.charAt(0);
                if (sep == 92) {
                    s = s + s;
                }
                String c2[] = cc.split(s + "");
                String rutaC = "";
                for (String c3 : c2) {
                    if (!c3.equals("build") && !c3.equals("web") && !c3.equals("docs")) {
                        rutaC += c3 + s;
                    }
                }
                System.out.println("Ruta Copia :: " + rutaC);
                File orig = new File(ruta + s + idEstudiante + doc + name);
                String destinationFile = rutaC + "web" + s + "docs" + s + idEstudiante + doc + name;
                File copy = new File(destinationFile);

                InputStream in = new FileInputStream(orig);
                OutputStream outt = new FileOutputStream(copy);

                byte[] buf = new byte[10 * 1024 * 1024];
                int len;

                while ((len = in.read(buf)) > 0) {
                    outt.write(buf, 0, len);
                }

                in.close();
                outt.flush();
                outt.close();
            //File copy = new File("destino.txt");

                /*
                 System.out.println("sali del iff");
                 boolean rta;
                 com.oreilly.servlet.multipart.MultipartParser mp = new MultipartParser(request, 1024 * 1024); // 10MB    -- 1MB
                 com.oreilly.servlet.multipart.FilePart filePart = null;
                 String cc = getServletContext().getRealPath("/docs/").replace("./", "/");
                 System.out.println("la cc es ::: "+cc);
                 String s = System.getProperty("file.separator");
                 String c2[] = cc.split(s + "");
                 String rutaC = "";
                 for (String c3 : c2) {
                 if (!c3.equals("build") && !c3.equals("web") && !c3.equals("docs")) {
                 rutaC += c3 + s;
                 }
                 }
                 System.out.println("Ruta Copia :: " + rutaC);
                 File wf = new File(rutaC + "web" + s + "docs" + s + idEstudiante + doc + name);
                 com.oreilly.servlet.multipart.Part part;
                 while ((part = mp.readNextPart()) != null) {
                 if (part.isFile()) {
                 filePart = (FilePart) part;
                 //Guardando archivos
                 String fileName = filePart.getFileName();
                 if (fileName != null) {
                 rta = filePart.writeTo(wf) > 0;
                 System.err.println("file: name=" + fileName + " " + rta);
                 } else {
                 System.err.println("file: name=" + fileName + "; EMPTY");
                 }
                 }
                 }
                 /*
            
                 String sourceFile = ruta + s + idEstudiante + doc + name;
                 File inFile = new File(sourceFile);
                 System.out.println(inFile.length() + " ::::::: tamañooo!! ");
                 String destinationFile = System.getProperty("user.dir") + s + "web" + s + "docs" + s + idEstudiante + doc + name;
                 //tem.out.println("Desde: " + sourceFile);
                 // System.out.println("Hacia: " + destinationFile);
                 // System.out.println(getServletContext().getRealPath("/docs/").replace("./", "/"));
                 String cc = getServletContext().getRealPath("/docs/").replace("./", "/");
                 //System.err.println("ruta?  "+cc);
                 //System.err.println("Separador:: "+s);
                 char sep = s.charAt(0);
                 if (sep == 92) {
                 s = s + s;
                 }
                 String c2[] = cc.split(s + "");
                 System.err.println("split");
                 String rutaC = "";
                 for (String c3 : c2) {
                 if (!c3.equals("build") && !c3.equals("web") && !c3.equals("docs")) {
                 rutaC += c3 + s;
                 }
                 }
                 System.out.println("Ruta Copia :: " + rutaC);
                 try {
                 //File inFile = new File(sourceFile);
                 File copiaFile = new File(rutaC+"web" + s + "docs" + s + idEstudiante + doc + name);

                 FileInputStream in = new FileInputStream(inFile);
                 FileOutputStream outt = new FileOutputStream(copiaFile);

                 int c;
                 while ((c = in.read()) != -1) {
                 outt.write(c);
                 }
                
                
                 in.close();
                 outt.flush();
                 outt.close();

                 /*  Path source = ruta + s + idEstudiante + doc + name;
                 Path newdir = rutaC+"web" + s + "docs" + s + idEstudiante + doc + name;
                 Files.copy(source, newdir.resolve(source.getFileName());
                 } catch (IOException e) {
                 System.err.println("Hubo un error de entrada/salida!!!");
                 }
                 System.out.println("name== \"" + name + "\"");*/
                if (!name.equals("")) {

                    dir += name;

                    //session.setAttribute("rutaImagen", dir);
                    String msg2 = facade.subirAnexo(tipoAnexo, name, idEstudiante, doc);
                    System.out.println("devolviendo::::::   " + msg2);
                    //session.setAttribute("mensaje", msg2);
                    if (msg2.equalsIgnoreCase("exito")) {
                        session.setAttribute("alerta", "<div class=\"alerta-verde\">Cargue exitoso de informacion, puede proceder a cargar el siguiente Anexo.</div>");
                    //out.print("<div class=\"alerta-amarilla\">Ha Ocurrido un error, por favor revisar bien el tipo de Anexo y que el Anexo sea en pdf</div>");
                        //out.print("<div class=\"alerta-verde\">Ha Ocurrido un error, por favor revisar bien el tipo de Anexo y que el Anexo sea en pdf</div>");
                        response.sendRedirect("../view/anexarExpediente.jsp");
                    } else {
                        session.setAttribute("alerta", "<div class=\"alerta-roja\">Ha Ocurrido un error, por favor revisar bien el tipo de Anexo y que el Anexo sea en pdf</div>");
                        response.sendRedirect("../view/anexarExpediente.jsp");
                    }

                }

            } catch (Exception e) {
                System.out.println(e.getMessage());
                session.setAttribute("alerta", "<div class=\"alerta-amarilla\">Algo ha sucedido, por favor revisar bien el tipo de Anexo y que el Anexo sea en pdf</div>");
                response.sendRedirect("../view/anexarExpediente.jsp");
            }
        } else {
            session.setAttribute("alerta", "<div class=\"alerta-amarilla\">Algo ha sucedido, por favor revisar bien el tipo de Anexo y que el Anexo sea en pdf</div>");
            response.sendRedirect("../view/anexarExpediente.jsp");
        }
    } else {
        session.setAttribute("alerta", "<div class=\"alerta-morada\">No ha seleccionado usuario para anexar al expediente</div>");
        response.sendRedirect("../view/anexarExpediente.jsp");
    }
%>


