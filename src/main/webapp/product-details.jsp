<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.ProductDAO" %>
<%@ page import="com.svalero.domain.Product" %>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>

<%
    int productId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Product product = Database.jdbi.withExtension(ProductDAO.class, dao -> dao.getProduct(productId));
%>

<%@include file="includes/header.jsp"%>
<main class="custom-gradient p-25">
    <div class="card-custom">
       <div class="card mb-3">
       <img src="../tienda_data/<%= product.getImage() %>" class="bd-placeholder-img card-img-top"/>
       <div class="card-body d-flex flex-column align-items-center">
         <h4 class="card-title"><%= product.getName() %> <%= product.getDescription() %></h4>
         <p class="card-text">Precio: <%= product.getPrice() %>€</p>
         <p class="card-text">Id producto: <%= product.getProduct_id() %></p>
      </div>
    </div>
</div>
</main>

