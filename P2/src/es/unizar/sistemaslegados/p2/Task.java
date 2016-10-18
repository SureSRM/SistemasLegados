package es.unizar.sistemaslegados.p2;

/**
 * Created by sergio on 18/10/16.
 */
public class Task {

    private String date;
    private String name;
    private String description;
    private boolean isGeneral;

    public Task(String date, String description){
        this.date=date;
        this.name=null;
        this.description=description;
        this.isGeneral=true;
    }

    public Task(String date, String name, String description){
        this.date=date;
        this.name=name;
        this.description=description;
        this.isGeneral=false;
    }

    public String getDate() {
        return date;
    }

    public String getName() {
        return name;
    }
    public String getDescription() {
        return description;
    }

    public boolean isGeneral() {
        return isGeneral;
    }
}
