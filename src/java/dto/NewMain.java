/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;
import java.io.*;
/**
 *
 * @author Manuel
 *
public class NewMain {

    /**
     * @param args the command line arguments
     
    public static void main(String[] args) {
        // TODO code application logic here
        String so = System.getProperty("os.name");
String s = System.getProperty("file.separator");
String separadorr = System.getProperty("user.dir")+s+"web"+s+"docs";

        System.out.println(so);
        System.out.println(s);
        System.out.println(separadorr);
    }
    
    private static void addLaboral2(String ingresos){
        String todos[] = ingresos.split("€€");
        System.out.println(todos.length);
        for(String linea: todos){
            System.out.println(linea);
            String [] per = linea.split("##");
            InformacionLaboral aux = new InformacionLaboral(per[0],per[1], per[2],per[3],per[4]);
            System.out.println(aux.toString());
        }
    }
}
* 
* */
    
    

public class NewMain {
	public NewMain(String sourceFile, String destinationFile) {
		System.out.println("Desde: " + sourceFile);
		System.out.println("Hacia: " + destinationFile);

		try {
			File inFile = new File(sourceFile);
			File outFile = new File(destinationFile);

			FileInputStream in = new FileInputStream(inFile);
			FileOutputStream out = new FileOutputStream(outFile);

			int c;
			while( (c = in.read() ) != -1)
				out.write(c);

			in.close();
			out.close();
		} catch(IOException e) {
			System.err.println("Hubo un error de entrada/salida!!!");
		}
	}

	public static void main(String args[]) {
//		if(args.length == 2)
//			new FileCopy(args[0], args[1]);
//		else
//			System.out.println("Debe ingresar dos parametros");
	}
}
