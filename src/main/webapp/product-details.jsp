<!--Importamos las clases -->
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.ProductDAO" %>
<%@ page import="com.svalero.domain.Product" %>

<%@include file="includes/header.jsp"%>
<main>
<%
    int productId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Product product = Database.jdbi.withExtension(ProductDAO.class, dao -> dao.getProduct(productId));
%>

<div class="container">
    <div class="card mb-3">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title"><%= product.getName() %></h5>
        <p class="card-text"><%= product.getDescription() %></p>
        <p class="card-text"><small class="text-muted"><%= product.getPrice() %></small></p>
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