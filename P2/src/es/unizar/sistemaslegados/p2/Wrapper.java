package es.unizar.sistemaslegados.p2;

import com.sun.istack.internal.NotNull;

import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

public class Wrapper {

    private final PrintWriter in;
    private final Scanner out;
    private final Scanner err;

    public Wrapper(PrintWriter in, Scanner out, Scanner err){
        this.in=in;
        this.out=out;
        this.err=err;
    }

    /**
     *
     * @param name Name
     * @param description Description
     */
    public List<Task> addTask(String name, String description){

        if(name.equals("")){

            System.out.println("Added note in general");
            //TODO: Implement add general task

            return listGeneralTasks();
        } else{

            System.out.println("Added note in specific");
            ///TODO: Implement add specific task

            return listSpecificTasks();
        }
    }

    /**
     *
     * @return A list of General Tasks
     */
    private List<Task> listGeneralTasks(){
        List<Task> list = new ArrayList<>();

        //TODO: Implement list general tasks

        return list;
    }

    /**
     *
     * @return A list of Specific Tasks
     */
    private List<Task> listSpecificTasks(){
        List<Task> list = new ArrayList<>();

        //TODO: Implement list specific tasks

        return list;
    }

    public void exit(){
        //MORE UNCOMPREHEKJBIBAKJHNK STUFF
    }

}
