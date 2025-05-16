package Clases;
import java.io.Serializable;

public class Libros implements Serializable {
    
    String codigo_Libro;
    String nom_Libro;
    String genero_Libro;
    String descripción;
    int año;
    int numero_ejemplar;
    String icono;

    public Libros(String codigo_Libro, String nom_Libro, String genero_Libro, String descripción, int año, int numero_ejemplar, String icono) {
        this.codigo_Libro = codigo_Libro;
        this.nom_Libro = nom_Libro;
        this.genero_Libro = genero_Libro;
        this.descripción = descripción;
        this.año = año;
        this.numero_ejemplar = numero_ejemplar;
        this.icono = icono;
    }

    public String getCodigo_Libro() {
        return codigo_Libro;
    }

    public void setCodigo_Libro(String codigo_Libro) {
        this.codigo_Libro = codigo_Libro;
    }

    public String getNom_Libro() {
        return nom_Libro;
    }

    public void setNom_Libro(String nom_Libro) {
        this.nom_Libro = nom_Libro;
    }

    public String getGenero_Libro() {
        return genero_Libro;
    }

    public void setGenero_Libro(String genero_Libro) {
        this.genero_Libro = genero_Libro;
    }

    public String getDescripción() {
        return descripción;
    }

    public void setDescripción(String descripción) {
        this.descripción = descripción;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    public int getNumero_ejemplar() {
        return numero_ejemplar;
    }

    public void setNumero_ejemplar(int numero_ejemplar) {
        this.numero_ejemplar = numero_ejemplar;
    }

    public String getIcono() {
        return icono;
    }

    public void setIcono(String icono) {
        this.icono = icono;
    }
    
}
