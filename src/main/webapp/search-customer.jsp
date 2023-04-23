<%@ page import="java.util.List" %>
<%@ page import="com.svalero.domain.Customer" %>

<%@ include file="includes/header.jsp" %>
<main>
</br>

<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">


<div class="container">
   <h1>Cliente</h1>
      <table class="table">
          <thread>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Teléfono</th>
            </tr>
          </thread>
<body>
    <% for (Customer customer : (List<Customer>)request.getAttribute("customers")) { %>
        <tr>
            <td><%= customer.getCustomer_id() %></td>
            <td><%= customer.getFirstName() %> <%= customer.getLastName() %></td>
            <td><%= customer.getAdress() %></td>
            <td><%= customer.getPhone() %></td>
        </tr>
    <% } %>
</body>
</table>
</div>
</html>


