<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@ page import="com.svalero.dao.OrderDAO" %>
<%@ page import="com.svalero.domain.Order" %>
<%@ page import="java.util.List" %>

<%@include file="includes/header.jsp"%>
<main>

<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<head>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

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
                             <button type="submit" class="btn btn-dark">Buscar clientes</button>
                         </div>
                     </div>
                 </form>
        <br>
        <h1 class="fw-light">Gestión de clientes</h1>
        <br>
        <p>
          <a href="customer-form.jsp?action=Registrar" class="btn btn-outline-dark">Registrar nuevo cliente</a>
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
                  <a href="view-details.jsp?id=<%= customer.getCustomer_id() %>" class="btn btn-sm btn-outline-info">Ver detalles del cliente</a>
                  <a href="customer-form.jsp?id=<%= customer.getCustomer_id() %>&action=edit&firstName=<%= customer.getFirstName() %>&lastName=<%= customer.getLastName() %>&adress=<%= customer.getAdress() %>&phone=<%= customer.getPhone() %>"
                     class="btn btn-sm btn-outline-warning">Editar cliente</a>
                <!--  <a href="remove-customer?id=<%= customer.getCustomer_id() %>" onclick="return confirm('¿Estás seguro de que quieres eliminar a <%= customer.getFirstName() %> <%= customer.getLastName() %>? Se eliminaran todos los pedidos con ese id de cliente.')"
                    class="btn btn-sm btn-outline-danger">Eliminar</a>-->
                <a href="remove-customer?id=<%= customer.getCustomer_id() %>"
                class="btn btn-sm btn-outline-danger"
                onclick="return confirmDelete('<%= customer.getFirstName() %> <%= customer.getLastName() %>', <%= customer.getCustomer_id() %>);">Eliminar</a>


                 </form>
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

<script>
function confirmDelete(name, customerId) {
   swal({
      title: "¿Estás seguro que deseas eliminar a " + name + "?",
      text: "Se eliminaran todos los pedidos con ese id de cliente",
      icon: "warning",
      buttons: ["Cancelar", "Eliminar"],
      dangerMode: true,
   })
   .then((willDelete) => {
      if (willDelete) {
         window.location.href = "remove-customer?id=" + customerId;
      }
   });
   return false;
}
</script>

</main>
<%@include file="includes/footer.jsp"%>
