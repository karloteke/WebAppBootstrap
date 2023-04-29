<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.OrderDAO" %>
<%@ page import="com.svalero.domain.Order" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>

<%@include file="includes/header.jsp"%>
<main>

<head>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<!DOCTYPE html>
<html lang="es">
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
                             <button type="submit" class="btn btn-dark">Buscar pedidos</button>
                         </div>
                     </div>
                 </form>
        <br>
        <h1 class="fw-light">Gestión de pedidos</h1>
        <p>
        <br>
          <a href="order-form.jsp?action=Registrar" class="btn btn-outline-dark">Registrar nuevo pedido</a>
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
    <table class="table">
        <thread>
            <tr>
                <th>Id pedido</th>
                <th>Id cliente</th>
                <th>Id producto</th>
                <th>Cantidad</th>
                <th>Fecha</th>
                <th> </th>
            </tr>
        </thread>
        <body>
            <% for (Order order : orderList) { %>
                <tr>
                    <td><%= order.getOrder_id() %></td>
                    <td><%= order.getCustomer_id() %></td>
                    <td><%= order.getProduct_id() %></td>
                    <td><%= order.getAmount() %></td>
                    <td><%= order.getDate() %></td>
                    <td>
                        <div class="btn-group" role="group">
                            <a href="order-details.jsp?id=<%= order.getOrder_id() %>" class="btn btn-sm btn-outline-secondary">Detalles</a>
                            <a href="order-form.jsp?id=<%= order.getOrder_id() %>&action=edit&customer_id=<%= order.getCustomer_id() %>&product_id=<%= order.getProduct_id() %>&amount=<%= order.getAmount() %>"
                              class="btn btn-sm btn-outline-secondary">Editar</a>
                            <a href="remove-order?id=<%= order.getOrder_id() %>"
                              class="btn btn-sm btn-outline-danger"
                              onclick="return confirmDelete('<%= order.getOrder_id() %>', <%= order.getOrder_id() %>);">Eliminar</a>
                        </div>
                    </td>
                </tr>
            <% } %>
        </body>
    </table>
</div>
<br>

<script>
function confirmDelete(order_id, orderId) {
   swal({
      title: "¿Estás seguro que deseas eliminar el pedido " + order_id + "?",
      icon: "warning",
      buttons: ["Cancelar", "Eliminar"],
      dangerMode: true,
   })
   .then((willDelete) => {
      if (willDelete) {
         window.location.href = "remove-order?id=" + orderId;
      }
   });
   return false;
}
</script>

</main>
<%@include file="includes/footer.jsp"%>
