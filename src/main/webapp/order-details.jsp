<!--Importamos las clases -->
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.OrderDAO" %>
<%@ page import="com.svalero.domain.Order" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@include file="includes/header.jsp"%>
<main>
<%
    int OrderId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Order order = Database.jdbi.withExtension(OrderDAO.class, dao -> dao.getOrder(OrderId));
%>


<div class="container">
    <div class="card mb-3">
      <img src="..." class="card-img-top" alt="...">
         <div class="card-body">
             <h5 class="card-title"><%= order.getCustomer_id() %></h5>
             <p class="card-text"><small class="text-muted"><%= order.getDate() %></small></p>
           </div>
    </div>
</div>

</main>
<%@include file="includes/footer.jsp"%>