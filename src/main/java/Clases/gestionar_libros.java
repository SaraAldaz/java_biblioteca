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

public class gestionar_libros {

    private final String rutaArchivo;
    private static ArrayList<Libros> misLibros = new ArrayList<>();

    public gestionar_libros(String rutaArchivo) {
        this.rutaArchivo = rutaArchivo;
        this.misLibros = leerArchivo();
    }

    public void agregarLibro(Libros miLibro) {
        misLibros.add(miLibro);
        guardarArchivo();
    }

    public void actualizarLibro(Libros miLibro) {
        System.out.println("📋 Lista de libros cargados:");
        for (int i = 0; i < misLibros.size(); i++) {
            Libros libro = misLibros.get(i);
            System.out.println("→ Código: " + libro.getCodigo_Libro());
        }

        boolean encontrado = false;
        for (int i = 0; i < misLibros.size(); i++) {
            Libros libro = misLibros.get(i);
            if (libro.getCodigo_Libro().equals(miLibro.getCodigo_Libro())) {
                libro.setGenero_Libro(miLibro.getGenero_Libro());
                libro.setDescripción(miLibro.getDescripción());
                libro.setAño(miLibro.getAño());
                libro.setNumero_ejemplar(miLibro.getNumero_ejemplar());
                libro.setNom_Libro(miLibro.getNom_Libro());
                libro.setIcono(miLibro.getIcono());
                encontrado = true;
                break;
            }
        }
        guardarArchivo();
    }

    public void eliminarLibro(String codigo_Libro) {
        for (int i = 0; i < misLibros.size(); i++) {
            Libros miLibro = misLibros.get(i);
            if (miLibro.getCodigo_Libro().equals(codigo_Libro)) {
                misLibros.remove(i);
                guardarArchivo();
                break;
            }
        }
    }

    public Libros buscar(String codigo_libro) {
        for (Libros miLibro : misLibros) {
            if (miLibro.getCodigo_Libro().equals(codigo_libro)) {
                return miLibro;
            }
        }
        return null;
    }

    private void eliminarIcono(String icono) {
        String ruta = "/target/data/libros.txt";
        File archivo = new File(ruta + File.separator + icono);
        if (archivo.exists()) {
            archivo.delete();
        }
    }

    public ArrayList<Libros> getMisLibros() {
        return new ArrayList<>(misLibros);
    }

    private void guardarArchivo() {
        File archivo = new File(rutaArchivo);
        File carpeta = archivo.getParentFile();

        // Crear la carpeta 'data' si no existe
        if (carpeta != null && !carpeta.exists()) {
            boolean creada = carpeta.mkdirs();
            System.out.println("Carpeta creada: " + creada + " en " + carpeta.getAbsolutePath());
        }

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(archivo, false))) {
            for (Libros miLibro : misLibros) {
                bw.write(String.join(",",
                        miLibro.getCodigo_Libro(),
                        miLibro.getNom_Libro(),
                        miLibro.getGenero_Libro(),
                        miLibro.getDescripción(),
                        String.valueOf(miLibro.getAño()),
                        String.valueOf(miLibro.getNumero_ejemplar()),
                        miLibro.getIcono()
                ));
                bw.newLine();
            }
            System.out.println("Archivo guardado en: " + archivo.getAbsolutePath());
        } catch (IOException e) {
            System.err.println("Error al guardar el archivo: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private ArrayList<Libros> leerArchivo() {
        File archivo = new File(rutaArchivo);
        ArrayList<Libros> lista = new ArrayList<>();
        if (!archivo.exists()) {
            return lista;
        }

        try (BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] campos = linea.split(",");
                if (campos.length >= 7) {
                    Libros miLibro = new Libros(
                            campos[0],
                            campos[1],
                            campos[2],
                            campos[3],
                            Integer.parseInt(campos[4]),
                            Integer.parseInt(campos[5]),
                            campos[6]
                    );
                    lista.add(miLibro);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return lista;
    }

}
