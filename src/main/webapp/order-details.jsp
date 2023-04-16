<!--Importamos las clases -->
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>

<%@include file="includes/header.jsp"%>
<main>
<%
    int customerId =Integer.parseInt(request.getParameter("order_id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Order order = Database.jdbi.withExtension(OrderDAO.class, dao -> dao.getOrder(order_id));
%>


<div class="container">
    <div class="card mb-3">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title"><%= order.getCustomer_id() %> </h5>
      </div>
    </div>
</div>

</main>
<%@include file="includes/footer.jsp"%>