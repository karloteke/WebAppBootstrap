<%@ page import="java.util.List" %>
<%@ page import="com.svalero.domain.Product" %>

<%@ include file="includes/header.jsp" %>
<main>
<br>

<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<div class="container">
   <h1>Producto</h1>
      <table class="table">
          <thread>
            <tr>
                <th>Id producto</th>
                <th>Nombre y descripción</th>
                <th>Precio</th>
            </tr>
          </thread>
    <body>
        <% for (Product product : (List<Product>)request.getAttribute("products")) { %>
            <tr>
                <td><%= product.getProduct_id() %></td>
                <td><%= product.getName() %> <%= product.getDescription() %></td>
                <td><%= product.getPrice() %></td>
            </tr>
        <% } %>
    </body>
</table>
</div>
</html>

