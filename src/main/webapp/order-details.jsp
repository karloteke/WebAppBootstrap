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


<div class="container">
    <div class="card mb-3 style background-color" >
         <div class="card-body">
             <h5 class="card-title">Pedido: <%= order.getOrder_id() %></h5>
             <p class="card-text">Id cliente: <%= order.getCustomer_id() %></p>
             <p class="card-text">Id producto: <%= order.getProduct_id() %></p>
             <p class="card-text">Cantidad: <%= order.getAmount() %></p>
           </div>
    </div>
</div>

</main>
<%@include file="includes/footer.jsp"%>