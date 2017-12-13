/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

    
/**
 * Clase que permite enviar correo electrónico a través de los servidores de gmail
 * @author Marco Adarme
 * @version 2.0
 */
public class ServicioEmail {
    
    //Dirección del servidor smtp, puede cambiarlo a su servidor de su cuenta particular, en el caso de gmail es smtp.gmail.com
    private final String direccionServidorEmail="smtp.gmail.com";
    //Numéro del puerto del servidor smtp, en el caso de gmail es el 587
    private final String puertoServidor="587";
    private Properties props = new Properties();
    //Dirección del email del usario que envía el mensaje
    private String emailUsuarioEmisor;
    //Contraseña del usuario que envía el correo electrónico
    private String claveEmailUsuarioEmisor;//http://tucomunidadcolombia.co:2095/webmaillogout.cgi

    /**
     * 
     * Crea un objeto para enviar correo electrónico
     * a través de los servidores de gmail
     * @param emailUsuarioEmisor dirección email del usuario que envía el mensaje
     * @param claveEmailUsuarioEmisor contraseña del usuario que envía el mensaje
     */
    
    public ServicioEmail(String emailUsuarioEmisor, String claveEmailUsuarioEmisor) {
        
        this.emailUsuarioEmisor = emailUsuarioEmisor;
        this.claveEmailUsuarioEmisor = claveEmailUsuarioEmisor;
        inicializarPropiedades();
                
    }
    
    
    /**
     * Inicia las propiedades del servicio de correo
     */    
    private void inicializarPropiedades() {
        
        props.setProperty("mail.smtp.host", this.direccionServidorEmail);
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.port", this.puertoServidor);
        props.setProperty("mail.smtp.user", this.emailUsuarioEmisor);
        props.setProperty("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.trust", this.direccionServidorEmail);
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    }
    
    /**
     * Método que permite enviar un correo electrónico en texto plano
     * @param receptor dirección email del usuario a quien se le envía el mensaje
     * @param asunto asunto del correo electrónico
     * @param cuerpoMensaje  cuerpo del mensaje del correo electrónico
     */    
    public void enviarEmail(String receptor, String asunto, String cuerpoMensaje) {
        
        try {
            
            Session session = Session.getDefaultInstance(props);
            // Construimos el mensaje
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(this.emailUsuarioEmisor));
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(receptor));
            message.setSubject(asunto);
            message.setText(cuerpoMensaje);
            Transport t = session.getTransport("smtp");
            
            t.connect(this.emailUsuarioEmisor, this.claveEmailUsuarioEmisor);
            System.out.println("conecto");
            t.sendMessage(message, message.getAllRecipients());
            System.out.println("envio");
            t.close();
            System.out.println("envio el correo");
        } catch (Exception e) {
            System.out.println("no lo envio");
            System.err.println(e.getMessage());
            
        }
    }
    
    public void enviarMensajeAdjunto(String mensaje, String titulo, String destinatario) {
        try {
            BodyPart texto = new MimeBodyPart();
            texto.setText(mensaje);
            
            BodyPart adjunto = new MimeBodyPart();
            adjunto.setDataHandler(new DataHandler(new FileDataSource(System.getProperty("user.dir")+"/build/web/diseno/images/hoja_de_prematricula.pdf")));
            adjunto.setFileName("material.pdf");
            
            MimeMultipart multiParte = new MimeMultipart("related");
            multiParte.addBodyPart(texto);
            multiParte.addBodyPart(adjunto);
            
            Session session = Session.getDefaultInstance(props);
            // Construimos el mensaje
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(this.emailUsuarioEmisor));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            message.setSubject(titulo);
            message.setContent(multiParte);
            
            Transport t = session.getTransport("smtp");
            t.connect(this.emailUsuarioEmisor, this.claveEmailUsuarioEmisor);
            System.out.println("conecto");
            t.sendMessage(message, message.getAllRecipients());
            System.out.println("envio");
            t.close();
            System.out.println("envio el correo");
            
        } catch (MessagingException ex) {
            System.out.println(ex.getMessage());
            System.out.println(ex.toString());
        }
    }
    
    /**
     * Método get que retona la clave del email
     * @return un tipo String que contiene la clave del email
     */
    public String getClaveEmailUsuarioEmisor() {
        
        return claveEmailUsuarioEmisor;
        
    }
    
    /**
     * Método set que modifica la clave del email
     * @param claveEmailUsuarioEmisor es de tipo String y contiene la nueva clave
     */
    public void setClaveEmailUsuarioEmisor(String claveEmailUsuarioEmisor) {
        
        this.claveEmailUsuarioEmisor = claveEmailUsuarioEmisor;
        
    }
    
    /**
     * Método get que retorna el email
     * @return un tipo String que ocntiene el email
     */
    public String getEmailUsuarioEmisor() {
        
        return emailUsuarioEmisor;
        
    }
    
    /**
     * Método set que modifica el email
     * @param emailUsuarioEmisor es de tipo String y contiene el nuevo email
     */
    public void setEmailUsuarioEmisor(String emailUsuarioEmisor) {
        
        this.emailUsuarioEmisor = emailUsuarioEmisor;
        
    }
    
}//Fin de la Clase 

