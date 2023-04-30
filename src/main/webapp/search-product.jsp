<%@ page import="java.util.List" %>
<%@ page import="com.svalero.domain.Product" %>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>
<body class="custom-gradient">
  <div class="container pt-25">
    <div class="row justify-content-center">
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

