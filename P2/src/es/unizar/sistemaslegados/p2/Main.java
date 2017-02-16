package es.unizar.sistemaslegados.p2;

import java.io.*;
import java.util.Scanner;

public class Main {

    private static Process process = null;
    private static BufferedWriter in;
    private static BufferedReader out;


    public static void main(String[] args) {
        try {
            process = Runtime.getRuntime().exec("/usr/local/bin/s3270 155.210.152.51:101");
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Get descriptors
        in =new BufferedWriter(new OutputStreamWriter( process.getOutputStream()));
        out = new BufferedReader( new InputStreamReader(process.getInputStream()));

        GUIPanel Window = new GUIPanel( new Wrapper(in, out) );
//        GUIPanel Window = new GUIPanel( new Wrapper() );
        Window.setVisible(true);
    }
}
