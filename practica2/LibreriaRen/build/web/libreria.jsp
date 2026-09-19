<%-- 
    Document   : libreria
    Created on : Sep 16, 2026, 11:09:35 AM
    Author     : renmess
--%>

<%@page import="java.util.List, model.Book" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilos.css">
        <title>Librería Ren</title>
    </head>
    <body class="contenedor_centro">
        
        <header class="encabezado-libreria">
            <div class="contenido-encabezado">
                <h1><img src="https://images.vexels.com/media/users/3/271649/isolated/preview/3a1938ea55f27c31d53b585fcebdcd5e-icono-de-dibujos-animados-de-libro-abierto.png" class="icono_libreria" alt="logo_libros"> Librería de Ren</h1>
                <p>Explora el catálogo o registra tus libros favoritos.</p>
            </div>
        </header>
        
        <div class="contenedor_formulario">
            <div class="encabezado_caja">
                <h3>Agregar nuevo libro</h3>
                <p>Ingresa los detalles para registrarlo en el catálogo.</p>
            </div>
            <form action="libros" method="POST">
                <input type="hidden" name="accion" value="agregar">
                <div class="fila-inputs">
                    <div class="campo">
                        <label for="titulo_texto">Título:</label>
                        <input type="text" id="titulo_texto" name="titulo" required>
                    </div>
                    <div class="campo">
                        <label for="autor_texto">Autor:</label>
                        <input type="text" id="autor_texto" name="autor" required>
                    </div>
                    <div class="campo">
                        <label for="precio_texto">Precio:</label>
                        <input type="number" step="0.01" id="precio_texto" name="precio" required>
                    </div>
                    <div class="campo-boton">
                        <input type="submit" value="Agregar Libro">
                    </div>
                </div>
            </form>
        </div>
        
        <div class="contenedor_formulario">
            <div class="encabezado_caja">
                <h3>Consultar catálogo</h3>
                <p>Filtra por título o autor para encontrar libros específicos.</p>
            </div>
            <form action="libros" method="GET">
                <input type="hidden" name="accion" value="buscar">
                <div class="fila-inputs">
                    <div class="campo">
                        <label for="criterio">Buscar por:</label>
                        <select name="criterio" id="criterio">
                            <option value="titulo">Título</option>
                            <option value="autor">Autor</option>
                        </select>
                    </div>
                    <div class="campo termino-campo">
                        <label for="termino_busqueda">Término:</label>
                        <input type="text" id="termino_busqueda" name="termino">
                    </div>
                    <div class="campo-boton">
                        <input type="submit" value="Buscar">
                    </div>
                </div>
            </form>
        </div>
        
        <table>
            <tr>
                <th>Título</th>
                <th>Autor</th>
                <th>Precio</th>
            </tr>

            <!--Insertams tabla-->
            <%
                List<Book> lista = (List<Book>) request.getAttribute("bookList");
                if (lista != null) {
                    for (Book b : lista) {
            %>
                        <tr>
                            <td><%= b.getTitulo() %></td>
                            <td><%= b.getAutor() %></td>
                            <td>$<%= b.getPrecio() %></td>
                        </tr>
            <%
                    }
                }
            %>
            </table>
        
        
    </body>
</html>
