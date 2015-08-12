/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.File;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ivan-hdz
 */
public class Upload {
    public static String uploadImage(HttpServletRequest request, ServletConfig config, String path) throws FileUploadException, Exception{
        String url = "";
        String imgDir = config.getServletContext().getRealPath(path)+"/";
        File dir = new File(imgDir);
        dir.mkdirs();
        System.out.println("PasaPorAqui2");
        DiskFileItemFactory fabrica = new DiskFileItemFactory();
        fabrica.setSizeThreshold(1024);
        fabrica.setRepository(dir);
        
        ServletFileUpload upload = new ServletFileUpload(fabrica);
        List<FileItem> partes = upload.parseRequest(request);
        
        
        for(FileItem item : partes)
        {
            System.out.println("Subiendo");
            File archivo = new File(imgDir, item.getName());
            item.write(archivo);
            url = item.getName();
        }
        return url;
    }
}
