<%@ page import="java.util.List" %>
<%@ page import="com.svalero.domain.Order" %>

<%@ include file="includes/header.jsp" %>
<main>
<br>

<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">


<div class="container">
   <h1>Pedido</h1>
      <table class="table">
          <thread>
            <tr>
                <th>Id pedido</th>
                <th>Id cliente</th>
                <th>Id producto</th>
                <th>Cantidad</th>
                <th>Fecha</th>
            </tr>
          </thread>
<body>
    <% for (Order order : (List<Order>)request.getAttribute("orders")) { %>
        <tr>
            <td><%= order.getOrder_id() %></td>
            <td><%= order.getCustomer_id() %></td>
            <td><%= order.getProduct_id() %></td>
            <td><%= order.getAmount() %></td>
            <td><%= order.getDate() %></td>
        </tr>
    <% } %>
</body>
</table>
</div>
</html>


