<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@ page import="com.svalero.dao.OrderDAO" %>
<%@ page import="com.svalero.domain.Order" %>
<%@ page import="com.svalero.dao.ProductDAO" %>
<%@ page import="com.svalero.domain.Product" %>


<%@ page import="java.util.List" %>

<!–– Incluimos el header de la página (No va a cambiar) = header.jsp -->
<%@include file="includes/header.jsp"%>
<main>

<!doc type html>
<html lang="es">
  <head>
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
                 <form action="search-product" method="GET" class="mb-3">
                     <div class="row">
                         <div class="col">
                             <input type="text" name="name" class="form-control" placeholder="Nombre">
                         </div>
                         <div class="col">
                             <input type="text" name="description" class="form-control" placeholder="Descripción">
                         </div>
                         <div class="col-auto">
                             <button type="submit" class="btn btn-primary">Buscar</button>
                         </div>
                     </div>
                 </form>
        </br>
        <h1 class="fw-light">Gestión de productos</h1>
        <p>
          <a href="product-form.jsp?action=register" class="btn btn-outline-info">Registrar nuevo producto</a>
        </p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-body-tertiary">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
           <%
              Class.forName("com.mysql.cj.jdbc.Driver");
              Database.connect();
              List<Product> productList = Database.jdbi.withExtension(ProductDAO.class, ProductDAO::getProducts);
              for (Product product : productList) {
           %>

        <div class="col">
          <div class="card shadow-sm">
            <img src="../tienda_data/<%= product.getImage() %>" class="bd-placeholder-img card-img-top"/>
            <div class="card-body">
              <p class="card-text"><%= product.getName() %> <%= product.getDescription() %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="product-details.jsp?id=<%= product.getProduct_id() %>" class="btn btn-sm btn-outline-primary">Ver detalle del producto</a>
                  <a href="product-form.jsp?id=<%= product.getProduct_id() %>&action=edit&name=<%= product.getName() %>&description=<%= product.getDescription() %>&price=<%= product.getPrice()%>"
                     class="btn btn-sm btn-outline-secondary">Editar producto</a>
                  <a href="remove-product?id=<%= product.getProduct_id() %>" class="btn btn-sm btn-outline-warning">Eliminar</a>
                </div>
                 <small class="text-muted"><%= product.getPrice() %></small>
                  </div>
                 </div>
               </div>
             </div>
             <%
                }
             %>
           </div>
         </div>
       </div>

</main>

<!–– Incluimos el footer de la página (No va a cambiar) = footer.jsp -->

<%@include file="includes/footer.jsp"%>
