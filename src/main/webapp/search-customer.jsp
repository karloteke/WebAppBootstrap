<%@ page import="java.util.List" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>
<body class="custom-gradient">
  <div class="container pt-25">
    <div class="row justify-content-center">
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
        <% for (Customer customer : (List<Customer>)request.getAttribute("customers")) { %>
            <tr>
                <td><%= customer.getCustomer_id() %></td>
                <td><%= customer.getFirstName() %> <%= customer.getLastName() %></td>
                <td><%= customer.getAdress() %></td>
                <td><%= customer.getPhone() %></td>
            </tr>
        <% } %>
          </table>
    </div>
</div>




