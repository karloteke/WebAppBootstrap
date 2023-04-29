<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@ page import="com.svalero.dao.OrderDAO" %>
<%@ page import="com.svalero.domain.Order" %>
<%@ page import="com.svalero.dao.ProductDAO" %>
<%@ page import="com.svalero.domain.Product" %>
<%@ page import="java.util.List" %>

<%@include file="includes/header.jsp"%>
<main>

<head>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<!DOCTYPE html>
<html lang="es">
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
                             <button type="submit" class="btn btn-dark">Buscar productos</button>
                         </div>
                     </div>
                 </form>
                 <br>
        <h1 class="fw-light">Gestión de productos</h1>
        <br>
        <p>
           <a href="product-form.jsp?action=Registrar" class="btn btn-outline-dark">Registrar nuevo producto</a>
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
                  <a href="product-details.jsp?id=<%= product.getProduct_id() %>" class="btn btn-sm btn-outline-info">Ver detalle del producto</a>
                  <a href="product-form.jsp?id=<%= product.getProduct_id() %>&action=edit&name=<%= product.getName() %>&description=<%= product.getDescription() %>&price=<%= product.getPrice()%>"
                    class="btn btn-sm btn-outline-warning">Editar producto</a>
                  <a href="remove-product?id=<%= product.getProduct_id() %>"
                    class="btn btn-sm btn-outline-danger"
                    onclick="return confirmDelete('<%= product.getName() %> <%= product.getDescription() %>', <%= product.getProduct_id() %>);">Eliminar</a>
                </div>
                 <small class="text-muted">Id <%= product.getProduct_id() %></small>
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

<script>
function confirmDelete(name, productId) {
  swal({
     title: "¿Estás seguro que deseas eliminar el producto " + name + "?",
     text: "Se eliminaran todos los pedidos con ese id de producto",
     icon: "warning",
     buttons: ["Cancelar", "Eliminar"],
     dangerMode: true,
  })
  .then((willDelete) => {
     if (willDelete) {
        window.location.href = "remove-product?id=" + productId;
     }
  });
  return false;
}
</script>

</main>
<%@include file="includes/footer.jsp"%>
