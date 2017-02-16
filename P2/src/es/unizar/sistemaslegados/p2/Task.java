package es.unizar.sistemaslegados.p2;

public class Task {

    private String date;
    private String name;
    private String description;
    private boolean isGeneral;

    public Task(String date, String description){
        this.date=date;
        this.name="";
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

    @Override
    public String toString() {

        return ' ' + date + ' ' + name + ' ' + description + '\n';
    }
}
