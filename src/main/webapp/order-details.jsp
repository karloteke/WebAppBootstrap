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

<br>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card my-3 ">
        <div class="card-header bg-dark text-white text-center">
          <h5 class="m-0 display-4">Pedido <%= order.getOrder_id() %></h5>
        </div>
        <div class="card-body text-center bg-purple">
           <table id="no-seleccionable" class="table table-striped">
            <body>
              <tr>
                <th scope="row">Id de cliente:</th>
                <td><%= order.getCustomer_id() %></td>
              </tr>
              <tr>
                <th scope="row">Id de producto:</th>
                <td><%= order.getProduct_id() %></td>
              </tr>
              <tr>
                <th scope="row">Cantidad:</th>
                <td><%= order.getAmount() %></td>
              </tr>
              <tr>
                <th scope="row">Fecha de pedido:</th>
                <td><%= order.getDate() %></td>
              </tr>
            </body>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
</main>
