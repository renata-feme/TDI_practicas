/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import java.util.*;
import model.Book;
import java.sql.*;

/**
 *
 * @author renmess
 */
public class BookDAO {
    String jdbcUrl = "jdbc:mysql://localhost:3306/bookdb";
    String jdbcUsername = "ren";
    String jdbcPassword = "admin";


    String insertar = "INSERT INTO books (title,author,price) VALUES (?,?,?);";
    String listar_todo = "SELECT * FROM books;";
    
    protected Connection getConnection() throws SQLException{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e){
            throw new SQLException(e);
        }   
    }
    
    public List<Book> buscarLibros(String criterio, String termino){
        List<Book> lista_libros = new ArrayList<>();
        
        String sql = "";
        switch (criterio) {
        case "titulo":
            sql = "SELECT * FROM books WHERE title LIKE ?";
            break;
        case "autor":
            sql = "SELECT * FROM books WHERE author LIKE ?";
            break;
        default:
            sql = "SELECT * FROM books";
            break;
        }
        
        try (Connection conn = getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        if (criterio.equals("titulo")|| criterio.equals("autor")) {
            ps.setString(1, "%" + termino + "%");
        }

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String tit = rs.getString("title");
            String aut = rs.getString("author");
            double prec = rs.getDouble("price");
            
            lista_libros.add(new Book(tit, aut, prec));
        }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return lista_libros;
    }
    
    
    public void anadirLibro(Book book){
        
        try (Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(insertar)){
            ps.setString(1, book.getTitulo());
            ps.setString(2, book.getAutor());
            ps.setDouble(3, book.getPrecio());
            
            ps.executeUpdate();
            
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
