package Clases;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.io.*;

public class gestionar_lectores {

    private final String rutaArchivo;
    private static ArrayList<Lectores> misLectores= new ArrayList<>();

    public gestionar_lectores(String rutaArchivo) {
        this.rutaArchivo = rutaArchivo;
        this.misLectores = leerArchivo(); 
    }

    public void agregarLector(Lectores miLector) {
        misLectores.add(miLector);
        guardarArchivo();
    }

    public void actualizarLector(Lectores miLector) {
        System.out.println("📋 Lista de lectores cargados:");
        for (int i = 0; i < misLectores.size(); i++) {
            Lectores lector = misLectores.get(i);
            System.out.println("→ Identificación: " + lector.getId());
        }
        
        boolean encontrado = false;
        for (int i = 0; i < misLectores.size(); i++) {
            Lectores lector = misLectores.get(i);
            if(lector.getId() == miLector.getId()) {
                lector.setNombre(miLector.getNombre());
                lector.setCorreo(miLector.getCorreo());
                lector.setEdad(miLector.getEdad());
                lector.setTelefono(miLector.getTelefono());
                break;
            }
        }
        guardarArchivo();
    }

    public void eliminarLector(int id) {
        for (int i = 0; i < misLectores.size(); i++) {
            Lectores miLector = misLectores.get(i);
            if (miLector.getId() == id) {
                misLectores.remove(i);
                guardarArchivo();
                break;
            }
        }
    }
    
        public Lectores buscar(int id) {
        for (Lectores miLector : misLectores) {
            if (miLector.getId() == id) {
                return miLector;
            }
        }
        return null;
    }

        private void eliminarFoto(String foto) {
        String ruta = "/target/data/lectores.txt";
        File archivo = new File(ruta + File.separator + foto);
        if (archivo.exists()) {
            archivo.delete();
        }
    }

    public ArrayList<Lectores> getMisLectores() {
        return new ArrayList<>(misLectores);
    }
    
    private void guardarArchivo() {
        File archivo = new File(rutaArchivo);
        File carpeta = archivo.getParentFile();
            
        if (carpeta != null && !carpeta.exists()) {
            boolean creada = carpeta.mkdirs();
            System.out.println("Carpeta creada: " + creada + " en " + carpeta.getAbsolutePath());
        }
        
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(archivo, false))) {
            for (Lectores miLector : misLectores) {
                bw.write(String.join(",",
                        String.valueOf(miLector.getId()),
                        miLector.getNombre(),
                        miLector.getCorreo(),
                        String.valueOf(miLector.getEdad()),
                        String.valueOf(miLector.getTelefono()),
                        miLector.getFoto()
                ));
                bw.newLine();
            }
            System.out.println("Archivo guardado en: " + archivo.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("Error al guardar el archivo: " + e.getMessage());
            e.printStackTrace();
        }  
    }

    private ArrayList<Lectores> leerArchivo() {
       File archivo = new File(rutaArchivo);
        ArrayList<Lectores> lista = new ArrayList<>();
        if (!archivo.exists()) {
            return lista;
        } 
        
        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] campos = linea.split(",");
                if (campos.length >= 6) {
                    Lectores miLector = new Lectores(
                            Integer.parseInt(campos[0]),
                            campos[1],
                            campos[2],
                            Integer.parseInt(campos[3]),
                            Integer.parseInt(campos[4]),
                            campos[5]
                    );
                    lista.add(miLector);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lista;
    }

}
