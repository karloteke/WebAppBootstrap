<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.ProductDAO" %>
<%@ page import="com.svalero.domain.Product" %>

<%@include file="includes/header.jsp"%>
<main>

<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<%
    int productId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Product product = Database.jdbi.withExtension(ProductDAO.class, dao -> dao.getProduct(productId));
%>

<div class="container">
    <div class="card mb-3 style">
     <img src="../tienda_data/<%= product.getImage() %>" class="bd-placeholder-img card-img-top"/>
      <div class="card-body">
        <h5 class="card-title"><%= product.getName() %> <%= product.getDescription() %></h5>
        <p class="card-text">Precio: <%= product.getPrice() %>€</p>
        <p class="card-text">Id producto: <%= product.getProduct_id() %></p>
      </div>
    </div>
</div>

