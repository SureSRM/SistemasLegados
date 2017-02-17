package es.unizar.sistemaslegados.p2;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Arrays;
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

//                String[] screen = getScreen();
//                boolean error = true;
//                for (int i = screen.length-1; i >= 0; i--) {
//                    if (screen[i].contains("GENERAL TASK ASSIGNED")){
//                        error =false;
//                        break;
//                    }
//                }
//                if (error){
//                    System.err.println("> Error: Error creating new task");
//                }

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

//                String[] screen = getScreen();
//                boolean error = true;
//                for (int i = screen.length-1; i >= 0; i--) {
//                    if (screen[i].contains("SPECIFIC TASK ASSIGNED")){
//                        error =false;
//                        break;
//                    }
//                }
//                if (error){
//                    System.err.println("> Error: Possible error creating new task");
//                    enter();
//                }

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

            String[] screen = getScreen();
            if(screen[39].matches("\\?[ ]*") || screen[38].matches("\\?[ ]*")){ //Before single entering we have to manual check if double enter is needed
                log("--Manual check: OK Passing page");
                singleEnter();
                //Now we are in the correct
            }

            boolean lastPage=false;
            boolean taskZoneFound;

            while(!lastPage){

                singleEnter();
                screen = getScreen();
                taskZoneFound=false;
                for (int i = screen.length-1; i >=0; i--) {

                    if (screen[i].startsWith("TASK ")) {
                        taskZoneFound=true;

                        String[] fields = screen[i].split(" ");

//                        int taskNum = Integer.parseInt(fields[1].substring(0,fields[1].length()-1));

                        list.add( new Task(fields[3], fields[5]) );

                    } else if(screen[i].startsWith("TOTAL TASK")) { //Prevents reading a previous TOTAL
                        lastPage = true;
                        taskZoneFound = true;
                    }else if(screen[i].startsWith("MENU PRINCIPAL")){
                        break;
                    } else if (taskZoneFound){ //It allways will be over Tasks list
                        break;
                    }
                }
                if(!taskZoneFound){ //If no tasks found in this page
                    lastPage=true;
                }
            }
            write("3");
            enter();
        }catch (IOException e){
            System.err.println("> Error: IOEXception");
        }

        if(list.isEmpty()){
            System.err.println("Empty List");
        }

        return list;
    }

    /**
     *
     * @return A list of Specific Tasks
     */
    private List<Task> listSpecificTasks(){

        List<Task> list = new ArrayList<>();

        try {
            write("2");
            enter();
            write("2");

            String[] screen = getScreen();
            if(screen[39].matches("\\?[ ]*") || screen[38].matches("\\?[ ]*")){ //Before single entering we have to manual check if double enter is needed
                log("--Manual check: OK Passing page");
                singleEnter();
                //Now we are in the correct
            }

            boolean lastPage=false;
            boolean taskZoneFound;

            while(!lastPage){

                singleEnter();
                screen = getScreen();
                taskZoneFound=false;
                for (int i = screen.length-1; i >=0; i--) {

                    if (screen[i].startsWith("TASK ")) {
                        taskZoneFound=true;

                        String[] fields = screen[i].split(" ");

//                        int taskNum = Integer.parseInt(fields[1].substring(0,fields[1].length()-1));

                        list.add( new Task(fields[3], fields[4], fields[5]) );

                    } else if(screen[i].startsWith("TOTAL TASK")) { //Prevents reading a previous TOTAL
                        lastPage = true;
                        taskZoneFound = true;
                    }else if(screen[i].startsWith("MENU PRINCIPAL")){
                        break;
                    } else if (taskZoneFound){ //It allways will be over Tasks list
                        break;
                    }
                }
                if(!taskZoneFound){ //If no tasks found in this page
                    lastPage=true;
                }
            }
            write("3");
            enter();
        }catch (IOException e){
            System.err.println("> Error: IOEXception");
        }

        if(list.isEmpty()){
            System.err.println("Empty List");
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
//            log("KEYBOARD LOCKED");
            state = this.out.readLine();
        }

        String confirm = this.out.readLine(); //Consume state line
//        log("State: " + state + "\nConfirm: " + confirm + '\n');

        if(!confirm.equals("ok")){
            System.err.println("> Error: Bad Request");
        }
    }

    private void write(String s) throws IOException {
        sleep(100);
        log("> String: " + s);
        this.send("string(\"" + s + "\")");
        sleep(100);
        consumeStateResponse();
    }

    private void singleEnter() throws IOException {
        sleep(100);
        this.send("enter");
        sleep(100);
        consumeStateResponse();
    }

    private void enter() throws IOException {
        sleep(100);
        log("> Enter");
        String[] screen = getScreen();
        if(screen[39].matches("[ ]*")) { //If it is not endpage before ENTER, we single enter
            log("  -Single enter");
            singleEnter();

            screen = getScreen();
            if(!screen[39].matches("[ ]*") && !screen[39].matches("\\?[ ]*") ) { //It it is endpage after ENTER, we ENTER again
                log("  -Endpage after enter. Doing second enter");
                singleEnter();
            }
        } else { //If it is endpage before ENTER, we double enter
            log("  -Double enter");
            singleEnter();
            singleEnter();
        }

    }

    private String[] getScreen() throws IOException {
        this.send("ascii");
        String screen[] = new String[43];
        String line;

        for (int i=0; i < screen.length; i++) {
            line = this.out.readLine();
            screen[i] = line.substring(6);
        }

        consumeStateResponse();

        logScreen(screen);
        return screen;
    }

    //Dev Utils

    private void logScreen(String[] screen){
        if (verbose) {
            for (String s: screen) {
                log("                 |" + s + "|");
            }
            log("\n");
        }
    }

    private void log(String s){
        if (verbose){
            System.out.println(s);
        }
    }

    private void sleep(int i){
        try {
            Thread.sleep(i);
        } catch (InterruptedException e) {
        }
    }
}
