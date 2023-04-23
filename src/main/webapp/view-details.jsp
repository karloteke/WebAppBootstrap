<!--Importamos las clases -->
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>

<%@include file="includes/header.jsp"%>
<main>

<%
    int customerId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Customer customer = Database.jdbi.withExtension(CustomerDAO.class, dao -> dao.getCustomer(customerId));
%>

<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">


<div class="container">
    <div class="card mb-3 style">
      <img src="../tienda_data/<%= customer.getImage() %>" class="bd-placeholder-img card-img-top"/>
      <div class="card-body">
        <h5 class="card-title"><%= customer.getFirstName() %> <%= customer.getLastName() %></h5>
        <p class="card-text">Dirección: <%= customer.getAdress() %></p>
        <p class="card-text">Teléfono: <%= customer.getPhone() %></p>
        <p class="card-text">Id cliente: <%= customer.getCustomer_id() %></p>
      </div>
    </div>
</div>
</html>

