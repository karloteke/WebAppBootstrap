<%@ page import="java.math.BigDecimal" %>
<%@include file="includes/header.jsp"%>

<%
    String action = request.getParameter("action");
    String name = request.getParameter("name");
    if (name == null) name = "";
    String description = request.getParameter("description");
    if (description == null) description = "";
    BigDecimal price = BigDecimal.ZERO;
    String priceStr = request.getParameter("price");
    if (priceStr != null && !priceStr.isEmpty()) {
    price = new BigDecimal(priceStr);
    }
%>

<main>
<!doc type html>
<html lang="es">
  <head>
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<div class="container">
    <br/>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Registrar producto</li>
      </ol>
    </nav>
     <form class="row g-3" method = "post" action = "edit-product" enctype="multipart/form-data">
        <div class="col-md-6">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="name" value='<%= name %>'>
        </div>
        <div class="col-md-6">
            <label for="descripción" class="form-label">Descripción</label>
            <input type="text" class="form-control" id="descripción" name="description" value='<%= description %>'>
        </div>
        <div class="col-12">
            <label for="precio" class="form-label">Precio</label>
            <input type="text" class="form-control" id="precio" name= "price" value='<%= price %>' >
        </div>

        <div class="col-md-6">
            <label for="image" class="form-label">Imagen</label>
            <input type="file" class="form-control" id="image" name="image">
        </div>
        <input type="hidden" name="action" value="<%= action %>"/>
        <%
        if (action != null && action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
        %>
            <input type="hidden" name="id" value="<%= id %>"/>
        <%
        }
        %>
        <div class="col-12">
            <input type="submit" value="<%= action %>"/>
        </div>
    </form>
    <br/>
    <div id="result"></div>
</div>
</main>
<%@include file="includes/footer.jsp"%>







