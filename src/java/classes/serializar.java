/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

/**
 *
 * @author ivan-hdz
 */
public class serializar implements Serializable
{
    public static Object getObject(FileInputStream archivo) throws IOException, ClassNotFoundException{
        ObjectInputStream in = new ObjectInputStream(archivo);
        return in.readObject();
    }
    public static void saveObject(FileOutputStream archivo, Object objeto) throws IOException{
        ObjectOutputStream out = new ObjectOutputStream(archivo);
        out.writeObject(objeto);
    }
}
