<!--Importamos las clases -->
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>

<%@include file="includes/header.jsp"%>
<main>
<%
    int customerId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Customer customer = Database.jdbi.withExtension(CustomerDAO.class, dao -> dao.getCustomer(customerId));
%>

<div class="container">
    <div class="card mb-3 style">
      <img src="../tienda_data/<%= customer.getImage() %>" class="bd-placeholder-img card-img-top"/>
      <div class="card-body">
        <h5 class="card-title"><%= customer.getFirstName() %> <%= customer.getLastName() %></h5>
        <p class="card-text"><%= customer.getAdress() %></p>
        <p class="card-text"><small class="text-muted"><%= customer.getPhone() %></small></p>
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
<%@include file="includes/footer.jsp"%>