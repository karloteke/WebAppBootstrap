<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@ page import="com.svalero.dao.OrderDAO" %>
<%@ page import="com.svalero.domain.Order" %>
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
                 <form action="search-customer" method="GET" class="mb-3">
                     <div class="row">
                         <div class="col">
                             <input type="text" name="firstName" class="form-control" placeholder="Nombre">
                         </div>
                         <div class="col">
                             <input type="text" name="lastName" class="form-control" placeholder="Apellido">
                         </div>
                         <div class="col-auto">
                             <button type="submit" class="btn btn-primary">Buscar</button>
                         </div>
                     </div>
                 </form>
        </br>
        <h1 class="fw-light">Gestión de clientes</h1>
        </br>
        <p>
          <a href="customer-form.jsp?action=Registrar" class="btn btn-outline-info">Registrar nuevo cliente</a>
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
              List<Customer> customerList = Database.jdbi.withExtension(CustomerDAO.class, CustomerDAO::getCustomers);
              for (Customer customer : customerList) {
           %>

        <div class="col">
          <div class="card shadow-sm card card img">
            <img src="../tienda_data/<%= customer.getImage() %>" class="bd-placeholder-img card-img-top"/>
            <div class="card-body">
              <p class="card-text"><%= customer.getFirstName() %> <%= customer.getLastName() %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <a href="view-details.jsp?id=<%= customer.getCustomer_id() %>" class="btn btn-sm btn-outline-primary">Ver detalles del cliente</a>
                  <a href="customer-form.jsp?id=<%= customer.getCustomer_id() %>&action=edit&firstName=<%= customer.getFirstName() %>&lastName=<%= customer.getLastName() %>&adress=<%= customer.getAdress() %>&phone=<%= customer.getPhone() %>"
                     class="btn btn-sm btn-outline-secondary">Editar cliente</a>
             <!-- <a href="remove-customer?id=<%= customer.getCustomer_id() %>" class="btn btn-sm btn-outline-warning">Eliminar</a>-->
                  <a href="remove-customer?id=<%= customer.getCustomer_id() %>" onclick="return confirm('¿Estás seguro de que quieres eliminar a <%= customer.getFirstName() %> <%= customer.getLastName() %>? Se eliminaran todos los pedidos con ese id de cliente.')">
                     <button class="btn btn-sm btn-outline-danger">Eliminar</button></a>
                </div>
                 <small class="text-muted">Id <%= customer.getCustomer_id() %></small>
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

       <!-- PAGINACIÓN REVISAR PUNTO EXTRA -->
       <nav aria-label="Page navigation example">
         <ul class="pagination">
           <li class="page-item"><a class="page-link" href="#">Previous</a></li>
           <li class="page-item"><a class="page-link" href="#">1</a></li>
           <li class="page-item"><a class="page-link" href="#">2</a></li>
           <li class="page-item"><a class="page-link" href="#">3</a></li>
           <li class="page-item"><a class="page-link" href="#">Next</a></li>
         </ul>
       </nav>

</main>

<!–– Incluimos el footer de la página (No va a cambiar) = footer.jsp -->

<%@include file="includes/footer.jsp"%>
