/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author renmess
 */
public class Book {
    private String titulo;
    private String autor;
    private Double precio;
    
    public Book(String titulo, String autor, Double precio){
        this.titulo = titulo;
        this.autor = autor;
        this.precio = precio;
    }
    
    public String getTitulo(){
        return this.titulo;
    }
    
    public void setTitulo(String titulo){
        this.titulo = titulo;
    }
    
    public String getAutor(){
        return this.autor;
    }
    
    public void setAutor(String autor){
        this.autor = autor;
    }
    
    public double getPrecio(){
        return this.precio;
    }
    
    public void setPrecio(double precio){
        this.precio = precio;
    }
}
