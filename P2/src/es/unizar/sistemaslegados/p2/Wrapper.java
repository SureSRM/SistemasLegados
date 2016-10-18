package es.unizar.sistemaslegados.p2;

import com.sun.istack.internal.NotNull;
import com.sun.org.apache.xalan.internal.xslt.Process;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

/**
 * Created by sergio on 18/10/16.
 */
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
     * @return A list of General Tasks
     */
    public List<Task> listGeneralTasks(){
        return listSpecificTasks().stream().filter( p -> p.isGeneral()).collect(Collectors.toList());
    }

    /**
     *
     * @return A list of Specific Tasks
     */
    public List<Task> listSpecificTasks(){
        return listSpecificTasks().stream().filter( p -> !p.isGeneral()).collect(Collectors.toList());
    }

    /**
     *
     * @return A list of all Tasks
     */
    private List<Task> listTasks(){
        //STUFF
        return null;
    }

    /**
     *
     * @param date Date
     * @param name Name
     * @param description Description
     */
    public void addTask(@NotNull String date, String name, @NotNull String description){

        if(name==null){
            //MORE STUFF FOR GENERAL


        } else{
            //MORE STUFF FOR SPECIFIC
        }


    }

    public void exit(){
        //MORE UNCOMPREHEKJBIBAKJHNK STUFF
    }

}
