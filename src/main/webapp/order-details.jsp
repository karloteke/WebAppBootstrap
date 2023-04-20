<!--Importamos las clases -->
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.OrderDAO" %>
<%@ page import="com.svalero.domain.Order" %>
<%@ page import="com.svalero.dao.ProductDAO" %>
<%@ page import="com.svalero.domain.Product" %>

<%@include file="includes/header.jsp"%>
<main>
<%
    int OrderId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Order order = Database.jdbi.withExtension(OrderDAO.class, dao -> dao.getOrder(OrderId));
%>

</br>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card my-3 ">
        <div class="card-header bg-info text-white text-center">
          <h5 class="m-0 display-4">Pedido <%= order.getOrder_id() %></h5>
        </div>
        <div class="card-body text-center">
          <p class="card-text"><strong>Id de cliente:</strong> <%= order.getCustomer_id() %></p>
          <p class="card-text"><strong>Id de producto:</strong> <%= order.getProduct_id() %></p>
          <p class="card-text"><strong>Cantidad:</strong> <%= order.getAmount() %></p>
          <p class="card-text"><strong>Fecha de pedido:</strong> <%= order.getDate() %></p>
        </div>
      </div>
    </div>
  </div>
</div>




</main>
<%@include file="includes/footer.jsp"%>