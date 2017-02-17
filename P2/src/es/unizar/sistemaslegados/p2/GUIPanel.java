package es.unizar.sistemaslegados.p2;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;

public class GUIPanel extends JFrame{

    //Wraper
    private Wrapper wrapper;

    private Boolean isGeneral;

    // Organizadores del interfaces
    private JFrame principal;
        private JMenuBar barraMenu;
            private JMenu menu;
            private JMenuItem item;
        private JPanel muestraNotas;
            private JPanel parteNotasGenerales;
                private JLabel tituloPanelGeneral;
                private JTextArea notasGeneral;
            private JPanel parteNotasEspecificas;
                private JLabel tituloPanelEspecifico;
                private JTextArea notasEspecifica;
        private JPanel muestraFormulario;
            private JPanel ordenacionFormulario;
                private JPanel destinatarioPanel;
                    private JLabel labelTextoDestino;
                    private JTextField cajaTextoDestino;
                private JPanel tipoDeNotaPanel;
                    private JLabel tipoDeNotaNueva;
                    private JComboBox<String> tipoNota;
                private JPanel descriptionPanel;
                    private JLabel labelTextoDescripcion;
                    //private JTextField cajaTextoDescripcion;
                    private JTextArea cajaTextoDescripcion;
            private JButton botonEnviar;


    // Constructor que crea la ventana
    public GUIPanel(Wrapper wrapper){
        super();                    // usamos el contructor de la clase padre JFrame

        this.wrapper = wrapper;

        this.setTitle("Ventana Legados            Sergio,Alvaro y Santiago");   // colocamos titulo a la ventana
        // Para determinar un tamaño apropiado, adaptado a todos los monitores
        int ancho = Toolkit.getDefaultToolkit().getScreenSize().width;
        int alto = Toolkit.getDefaultToolkit().getScreenSize().height;
        this.setBounds((ancho / 2) - (this.getWidth() / 2), (alto / 2) - (this.getHeight() / 2), 500, 500);
        this.setExtendedState(MAXIMIZED_BOTH);                  // Al crear la ventana la creara maximizada
        this.setResizable(true);                                // hacemos que la ventana sea redimiensionable
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);    // hacemos que cuando se cierre la ventana termina todo proceso

        muestraNotas = new JPanel();
        muestraFormulario = new JPanel();
        ordenacionFormulario = new JPanel();
        destinatarioPanel = new JPanel();
        descriptionPanel = new JPanel();
        tipoDeNotaPanel = new JPanel();
        tipoDeNotaNueva= new JLabel();
        notasGeneral = new JTextArea(20, 30);           // Cuadro de texto para mostrar las notas Generales, con un tamaño predefinido
        tituloPanelGeneral = new JLabel();
        notasEspecifica = new JTextArea(20, 30);        // Cuadro de texto para mostrar las notas Especificas, con un tamaño predefinido
        tituloPanelEspecifico = new JLabel();
        labelTextoDestino = new JLabel();
        cajaTextoDestino = new JTextField(20);          // Cuadro de texto para indicar destino de la nota, se limita a 20 catacteres
        labelTextoDescripcion = new JLabel();
        //cajaTextoDescripcion = new JTextField(150);  // Cuadro de texto para indicar la descripcioin de la nota, se limita a 150 caracteres
        cajaTextoDescripcion = new JTextArea(10, 50);  // Cuadro de texto para indicar la descripcioin de la nota, se limita a 150 caracteres
        botonEnviar = new JButton();              // boton para enviar la nota

        /********************************************************
         ******************** Parte del Menu ********************
         ********************************************************/

        /*** configuramos los componentes ***/
        // Menu
        barraMenu = new JMenuBar();
        this.setJMenuBar(barraMenu);
        //Componente de las opciones
        menu = new JMenu("Opciones");
        barraMenu.add(menu);
        // items de las opciones
        item = new JMenuItem("Informacion");
        // Lo que sucede al presionar
        item.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JFrame ventanaAux = new JFrame("Acerca de");
                ventanaAux.setTitle("Acerca de");
                String textoDesarrolladores ="<html><body>+++++++++++++++++++++++++++++++++++++++++++++++++<br>"
                        + "+---------------------------------- CopyRight --------------------------------+<br> "
                        + "+----- Santiago Peralta ---- Alvaro Barrio ---- Sergio Martin -----+<br>"
                        + "+-------------------------- v1.0 Fecha 31/11/2016 -------------------------+<br>"
                        + "++++++++++++++++++++++++++++++++++++++++++++++++++</body></html>";
                ventanaAux.add(new JLabel(textoDesarrolladores));
                ventanaAux.pack();
                ventanaAux.setVisible(true);
            }
        });// Modificar para mostrar la informacion correcta
        menu.add(item);

        /********************************************************
         ************** Parte de mostrar las notas **************
         ********************************************************/

        /*** Muestran las notas ***/
        muestraNotas.setBorder(BorderFactory.createTitledBorder("Notas"));
        parteNotasGenerales = new JPanel();
        parteNotasGenerales.setLayout(new BoxLayout(parteNotasGenerales,BoxLayout.PAGE_AXIS));
        parteNotasEspecificas = new JPanel();
        parteNotasEspecificas.setLayout(new BoxLayout(parteNotasEspecificas,BoxLayout.PAGE_AXIS));
        // Se crean los scroll que seran los encargados de aunmentar sin que aumente el area de texto
        JScrollPane scrollGeneral = new JScrollPane(notasGeneral);
        JScrollPane scrollEspecifica = new JScrollPane(notasEspecifica);

        // Componentes que muestran las notas genearales
        tituloPanelGeneral.setText("Notas Generales");
        tituloPanelGeneral.setVisible(true);
        notasGeneral.setText("<empty list>");    // colocamos un texto a la etiqueta
        notasGeneral.setEditable(false);
        notasGeneral.setVisible(true);
        parteNotasGenerales.add(tituloPanelGeneral, BorderLayout.NORTH);
        parteNotasGenerales.add(scrollGeneral, BorderLayout.SOUTH);

        //Componente que muestra las notas especificas
        tituloPanelEspecifico.setText("Notas Especificas");
        tituloPanelEspecifico.setVisible(true);
        notasEspecifica.setText("<empty list>");    // colocamos un texto a la etiqueta
        notasEspecifica.setEditable(false);
        notasEspecifica.setVisible(true);
        // Coloca las notas con el titulo en su cuadro
        parteNotasEspecificas.add(tituloPanelEspecifico, BorderLayout.NORTH);
        parteNotasEspecificas.add(scrollEspecifica, BorderLayout.SOUTH);

        /********************************************************
         ***************** Parte del Formulario *****************
         ********************************************************/

        muestraFormulario.setBorder(BorderFactory.createTitledBorder("Formulario de nueva nota"));
        ordenacionFormulario.setLayout(new BoxLayout(ordenacionFormulario,BoxLayout.PAGE_AXIS));
        ordenacionFormulario.setVisible(true);

        labelTextoDestino.setText("Destinatario");
        cajaTextoDestino.setText("");
        cajaTextoDestino.setMaximumSize(new Dimension(500,5));

        destinatarioPanel.add(labelTextoDestino);
        destinatarioPanel.add(cajaTextoDestino);

        /*** Caja que muestra las dos opciones posibles del isGeneral de nota ***/

        tipoDeNotaPanel.setLayout(new BoxLayout(tipoDeNotaPanel,BoxLayout.LINE_AXIS));
        tipoDeNotaNueva.setText("Nota general   ");
        tipoDeNotaNueva.setVisible(true);

        JComboBox<Boolean> tipoNota = new JComboBox<Boolean>();
        tipoNota.addItem(new Boolean(true));
        tipoNota.addItem(new Boolean(false));
        tipoNota.setSelectedIndex(0);
        isGeneral = true;
        tipoNota.setVisible(true);


        ActionListener boxActionListener = new ActionListener(){

            //add actionlistner to listen for change
            @Override
            public void actionPerformed(ActionEvent e) {

                isGeneral = (Boolean) tipoNota.getSelectedItem();//get the selected item
//DEBUG
//                if(isGeneral){
//                    System.out.println("TRUE YEEHA");
//                } else {
//                    System.out.println("FALSE NIGGA ");
//                }
            }
        };

        tipoNota.addActionListener( boxActionListener );

        tipoNota.setEnabled(true);
        tipoDeNotaPanel.add(tipoDeNotaNueva);
        tipoDeNotaPanel.add(tipoNota);

        //El label de la descriptionPanel de la nota

        labelTextoDescripcion.setText("Descripcion:   ");
        // El cuadro de texto de la descripciond de la nota
        cajaTextoDescripcion.setText(""); //Descripcion
       // cajaTextoDescripcion.setMaximumSize(new Dimension(1000,5));//setSize(new Dimension(10, 5));

        descriptionPanel.add(labelTextoDescripcion);
        descriptionPanel.add(cajaTextoDescripcion);

        // ordenamos el formulario

        ordenacionFormulario.add(destinatarioPanel, BorderLayout.NORTH);
        ordenacionFormulario.add(tipoDeNotaPanel, BorderLayout.CENTER);
        ordenacionFormulario.add(descriptionPanel, BorderLayout.SOUTH);

        /*** El boton para enviar la informacion de la nota ***/
        botonEnviar.setText("Enviar Nota");   // colocamos un texto al boton
        // Accion que sucede cuando se presiona el boton

        ActionListener buttonActionListener = new ActionListener(){

            //add actionlistner to listen for change
            @Override
            public void actionPerformed(ActionEvent e) {
                // obtenemos el destinatario de la nota
                String nombre = cajaTextoDestino.getText();
                // obtenemos el contenido de la caja de descriptionPanel
                String descripcion = cajaTextoDescripcion.getText();

                if ( descripcion.equals("") ) { //No hay deescripcion
                    JOptionPane.showMessageDialog(principal, "La nota ha de tener descripcion");
                } else {
                    if (isGeneral) { //TODO: Important part
                        if( !nombre.equals("") ){
                            JOptionPane.showMessageDialog(principal, "El tipo de nota GENERAL no admite destinatario");
                        } else {
                            List<Task> newTasks = wrapper.addTask(nombre, descripcion.replace(' ','_')); //Returns the new list

//                            List<Task> newTasks = new ArrayList<Task>(); //Returns the new list
//                            newTasks.add(new Task("5555","description"));
//                            newTasks.add(new Task("6666","description2"));


                            updateGeneralTasks(newTasks);
                            cleanFields();
                        }
                    } else {
                        if( nombre.equals("") ){
                            JOptionPane.showMessageDialog(principal, "Se necesita un destinatario para el tipo de tarea ESPECIFICO");
                        } else {
                            List<Task> newTasks = wrapper.addTask(nombre, descripcion.replace(' ','_')); //Returns the new list

//                            List<Task> newTasks = new ArrayList<Task>(); //Returns the new list
//                            newTasks.add(new Task("5555","author1","description"));
//                            newTasks.add(new Task("6666","author2","description2"));

                            updateSpecificTasks(newTasks);
                            cleanFields();
                        }
                    }
                }
            }
        };

        botonEnviar.addActionListener(buttonActionListener);  // hacemos que el boton tenga una accion y esa accion estara en esta clase


        /********************************************************************************
         ***************** Parte donde se aniaden todos los componentes *****************
         ********************************************************************************/

        // aniade los componentes de mostrar nota
        muestraNotas.add(parteNotasGenerales, BorderLayout.WEST);
        muestraNotas.add(parteNotasEspecificas, BorderLayout.EAST);
        // ordena el formulario

        // aniade los componentes del formulario
        muestraFormulario.add(ordenacionFormulario,BorderLayout.NORTH);
        muestraFormulario.add(botonEnviar, BorderLayout.SOUTH);

        // aniade a la ventana principal
        this.add(muestraNotas, BorderLayout.PAGE_START);
        this.add(muestraFormulario);
       // this.pack();
    }

    private void cleanFields(){
        cajaTextoDestino.setText("");
        cajaTextoDescripcion.setText("");
    }

    private void updateGeneralTasks(List<Task> generalTask ){
        String tasks = "";

        for (Task task:generalTask) {
            tasks+=task.toString();
        }
        notasGeneral.setText(tasks);

    }
    private void updateSpecificTasks(List<Task> specificTask){
        String tasks = "";

        for (Task task:specificTask) {
            tasks+=task.toString();
        }
        notasEspecifica.setText(tasks);
    }

}
