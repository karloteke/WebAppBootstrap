<!--Importamos las clases -->
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CustomerDAO" %>
<%@ page import="com.svalero.domain.Customer" %>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>

<%
    int customerId =Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Database.connect();
    Customer customer = Database.jdbi.withExtension(CustomerDAO.class, dao -> dao.getCustomer(customerId));
%>


<%@include file="includes/header.jsp"%>
<main class="custom-gradient p-25">
    <div class="card-custom">
        <div class="card mb-3">
          <img src="../tienda_data/<%= customer.getImage() %>" class="bd-placeholder-img card-img-top"/>
          <div class="card-body d-flex flex-column align-items-center">
            <h4 class="card-title" ><%= customer.getFirstName() %> <%= customer.getLastName() %></h4>
            <p class="card-text" >Dirección: <%= customer.getAdress() %></p>
            <p class="card-text" >Teléfono: <%= customer.getPhone() %></p>
            <p class="card-text" >Id cliente: <%= customer.getCustomer_id() %></p>
          </div>
        </div>
    </div>
</main>



