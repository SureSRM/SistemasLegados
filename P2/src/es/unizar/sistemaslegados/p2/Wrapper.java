package es.unizar.sistemaslegados.p2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

public class Wrapper {

    private final BufferedWriter in;
    private final BufferedReader out;

    private boolean verbose = false;

    public Wrapper(BufferedWriter in, BufferedReader out){
        this.in=in;
        this.out=out;
        try {
            access();
        } catch (IOException e){
            System.err.println("> Error: IOEXception");
        }
    }

    public Wrapper(){
        this.in = null;
        this.out = null;
    }
    /**
     *
     * @param name Name
     * @param description Description
     */
    public List<Task> addTask(String name, String description){
        try {
            if (name.equals("")) {

                System.out.println("Added note in general");

                write("1");
                enter();

                write("1");
                enter();

                write("5555");
                enter();

                write(description);
                enter();

                String[] screen = getScreen();
                boolean error = true;
                for (int i = screen.length-1; i >= 0; i--) {
                    if (screen[i].contains("GENERAL TASK ASSIGNED")){
                        error =false;
                        break;
                    }
                }
                if (error){
                    System.err.println("> Error: Error creating new task");
                }

                write("3");
                enter();

                return listGeneralTasks();
            } else {

                System.out.println("Added note in specific");

                write("1");
                enter();
                write("2");
                enter();

                write("5555");
                enter();

                write(name);
                enter();

                write(description);
                enter();

                String[] screen = getScreen();
                boolean error = true;
                for (int i = screen.length-1; i >= 0; i--) {
                    if (screen[i].contains("SPECIFIC TASK ASSIGNED")){
                        error =false;
                        break;
                    }
                }
                if (error){
                    System.err.println("> Error: Possible error creating new task");
                }

                write("3");
                enter();

                return listSpecificTasks();
            }
        } catch (IOException e){
            System.err.println("> Error: IOEXception");
            return null;
        }
    }

    /**
     *
     * @return A list of General Tasks
     */
    private List<Task> listGeneralTasks() {

        List<Task> list = new ArrayList<>();

        try {
            write("2");
            enter();
            write("1");
            enter();
            String[] screen = getScreen();

            boolean lastPage =false;
            while(!lastPage){
                for (int i = 0; i < screen.length; i++) {
                    if (screen[i].startsWith("TASK ")) {

                        String[] fields = screen[i].split(" ");
                        Task t = new Task(fields[3], fields[5] );
                        list.add(t);
                    }
                }
                if(screen[39].matches("[ ]*")){
                    lastPage=true;
                } else{
                    enter();
                    screen = getScreen();
                }
            }
            write("3");
            enter();
        }catch (IOException e){
            System.err.println("> Error: IOEXception");
        }
        return list;
    }

    /**
     *
     * @return A list of Specific Tasks
     */
    private List<Task> listSpecificTasks(){
        List<Task> list = new ArrayList<>();

        try{
            write("2");
            enter();
            write("2");
            enter();
            String[] screen = getScreen();

            boolean lastPage =false;
            while(!lastPage){
                for (int i = 0; i < screen.length; i++) {
                    if (screen[i].startsWith("TASK ")) {

                        String[] fields = screen[i].split(" ");
                        Task t = new Task(fields[3], fields[4], fields[5]);
                        list.add(t);
                    }
                }
                if(screen[39].matches("[ ]*")){
                    lastPage=true;
                } else{
                    enter();
                    screen = getScreen();
                }
            }
            write("3");
            enter();
        }catch (IOException e){
            System.err.println("> Error: IOEXception");
        }
        return list;
    }

    // Control

    public void access() throws IOException {
        sleep(2000);
        enter();
        write("grupo_11");
        enter();

        String[] screen = getScreen();
        if (screen[6].contains("Userid is not authorized")) {
            // Incorrect user
            System.err.println("> Error: User not autorized");
            exit();
        }

        write("secreto6");
        enter();

        screen = getScreen();
        if (screen[6].contains("Password incorrect!")) {
            // Incorrect password
            System.err.println("> Error: Password incorrect");
            exit();
        }

        enter();

        write("TAREAS.C");
        enter();

        sleep(3000);

        screen = getScreen();
        if(!screen[0].contains("Waterloo")){
            log("> Error: Problem loading tareas");
            exit();
        }

    }

    public void exit() throws IOException {
        this.send("quit");
        sleep(200);
        consumeStateResponse();
    }


    //DIRECT ACTIONS
    private void send(String s) throws IOException {
        if (s.endsWith("\n")) {
            this.in.write(s);
            this.in.flush();
        } else {
            this.in.write(s + "\n");
            this.in.flush();
        }
    }

    private void consumeStateResponse() throws IOException {
        //We take the last 2 line (state and confirm)
        String state = this.out.readLine();
        if(state.equals("data: Keyboard locked")){
            log("KEYBOARD LOCKED");
            state = this.out.readLine();
        }

        String confirm = this.out.readLine(); //Consume state line
        log("State: " + state + "\nConfirm: " + confirm + '\n');

        if(!confirm.equals("ok")){
            System.err.println("> Error: Bad Request");
        }
    }

    private void write(String s) throws IOException {
        this.send("string(\"" + s + "\")");
        sleep(200);
        consumeStateResponse();
    }

    private void enter() throws IOException {
        this.send("enter");
        sleep(200);
        consumeStateResponse();

        String[] screen = getScreen();
        if(!screen[41].matches("[ ]*")) { //It's 80 spaces
            this.send("enter");
            sleep(200);
            consumeStateResponse();
        }
    }

    private String[] getScreen() throws IOException {
        this.send("ascii");
        String result[] = new String[43];
        String line;

        for (int i=0; i < result.length; i++) {
            line = this.out.readLine();
            result[i] = line.substring(6);
        }

        consumeStateResponse();
        return result;
    }

    private void log(String s){
        if (verbose){
            System.out.println("> Log: " + s);
        }
    }


    private void sleep(int i){
        try {
            Thread.sleep(i);
        } catch (InterruptedException e) {
        }
    }
}
