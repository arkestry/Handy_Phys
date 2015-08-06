/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;

/**
 *
 * @author ivan-hdz
 */
public class Simulador implements Serializable{
    private String[] preguntas;
    private String[][] respuestas;
    private String[] correctas;

    /**
     * @return the preguntas
     */
    public String[] getPreguntas() {
        return preguntas;
    }

    /**
     * @param preguntas the preguntas to set
     */
    public void setPreguntas(String[] preguntas) {
        this.preguntas = preguntas;
    }

    /**
     * @return the respuestas
     */
    public String[][] getRespuestas() {
        return respuestas;
    }

    /**
     * @param respuestas the respuestas to set
     */
    public void setRespuestas(String[][] respuestas) {
        this.respuestas = respuestas;
    }

    /**
     * @return the correctas
     */
    public String[] getCorrectas() {
        return correctas;
    }

    /**
     * @param correctas the correctas to set
     */
    public void setCorrectas(String[] correctas) {
        this.correctas = correctas;
    }
}
