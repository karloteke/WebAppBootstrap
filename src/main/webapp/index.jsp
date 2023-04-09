<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@ page import="java.util.List" %>

<!–– Incluimos el header de la página (No va a cambiar) = header.jsp -->
<%@include file="includes/header.jsp"%>


<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Aplicación para gestión de la tienda de maquillaje</h1>
        <p class="lead text-body-secondary">Gestiona tu tienda de maquillaje.</p>
        <p>
          <a href="register-customer.jsp" class="btn btn-outline-info">Registrar nuevo cliente</a>
          <a href="register-order.jsp" class="btn btn-outline-info">Registrar nuevo pedido</a>
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
          <div class="card shadow-sm">
            <img src="../tienda_data/<%= customer.getImage() %>" class="bd-placeholder-img card-img-top"/>
            <div class="card-body">
              <p class="card-text"><%= customer.getFirstName() %> <%= customer.getLastName() %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                 <a href="view-details.jsp?id=<%= customer.getCustomer_id() %>" class="btn btn-sm btn-outline-secondary">Ver detalles del cliente</a>
                 <a href="edit-customer.jsp?id=<%= customer.getCustomer_id() %>" class="btn btn-sm btn-outline-secondary">Editar cliente</a>
                </div>
                 <small class="text-muted"><%= customer.getPhone() %></small>
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
