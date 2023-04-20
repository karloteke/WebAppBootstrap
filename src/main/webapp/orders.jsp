<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.OrderDAO" %>
<%@ page import="com.svalero.domain.Order" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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
                 <form action="search-order" method="GET" class="mb-3">
                     <div class="row">
                         <div class="col">
                             <input type="text" name="order_id" class="form-control" placeholder="Id pedido">
                         </div>
                         <div class="col">
                              <input type="text" name="amount" class="form-control" placeholder="Cantidad">
                          </div>
                         <div class="col-auto">
                             <button type="submit" class="btn btn-info">Buscar pedidos</button>
                         </div>
                     </div>
                 </form>
        </br>
        <h1 class="fw-light">Gestión de pedidos</h1>
        </br>
        <p>
          <a href="order-form.jsp?action=Registrar" class="btn btn-outline-info">Registrar nuevo pedido</a>
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
              List<Order> orderList = Database.jdbi.withExtension(OrderDAO.class, OrderDAO::getOrders);
           %>

<div class="table-responsive">
    <table class="table table-hover ">
        <thead>
            <tr>
                <th scope="col">Id pedido</th>
                <th scope="col">Id cliente</th>
                <th scope="col">Id producto</th>
                <th scope="col">Cantidad</th>
                <th scope="col">Fecha</th>
                <th scope="col"> </th>
            </tr>
        </thead>
        <body>
            <% for (Order order : orderList) { %>
                <tr>
                    <td scope="row"><%= order.getOrder_id() %></td>
                    <td scope="row"><%= order.getCustomer_id() %></td>
                    <td scope="row"><%= order.getProduct_id() %></td>
                    <td scope="row"><%= order.getAmount() %></td>
                    <td scope="row"><%= order.getDate() %></td>
                    <td>
                        <div class="btn-group" role="group">
                            <a href="order-details.jsp?id=<%= order.getOrder_id() %>" class="btn btn-sm btn-outline-primary">Detalles</a>
                            <a href="order-form.jsp?id=<%= order.getOrder_id() %>&action=edit&customer_id=<%= order.getCustomer_id() %>&product_id=<%= order.getProduct_id() %>&amount=<%= order.getAmount() %>" class="btn btn-sm btn-outline-secondary">Editar</a>
                          <a href="remove-order?id=<%= order.getOrder_id() %>" onclick="return confirm('¿Estás seguro de que quieres eliminar el pedido número <%= order.getOrder_id() %>?')"
                            class="btn btn-sm btn-outline-danger">Eliminar</a>
                           <!-- <a href="remove-order?id=<%= order.getOrder_id() %>" class="btn btn-sm btn-outline-danger">Eliminar</a>-->
                        </div>
                    </td>
                </tr>
            <% } %>
        </body>
    </table>
</div>
</br>


</main>

<!–– Incluimos el footer de la página (No va a cambiar) = footer.jsp -->

<%@include file="includes/footer.jsp"%>
