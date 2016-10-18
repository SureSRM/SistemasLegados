package es.unizar.sistemaslegados.p2;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Scanner;

public class Main {

    private static Process process = null;
    private static PrintWriter in;
    private static Scanner out;
    private static Scanner err;

    private static void connect(){

        try {
            process = Runtime.getRuntime().exec("/usr/local/bin/s3270 155.152.XXXXXXXXXXX");
        } catch (IOException e) {
            e.printStackTrace();
        }

        //Get descriptors
        in = new PrintWriter( new OutputStreamWriter( process.getOutputStream() ) );
        out = new Scanner(process.getInputStream());
        err = new Scanner(process.getErrorStream());

    }

    private static void access(){

    }
    private static void startGUI(){
        new Wrapper(in, out, err);
    }

    public static void main(String[] args) {
        connect();
        access();
        startGUI();
    }
}
