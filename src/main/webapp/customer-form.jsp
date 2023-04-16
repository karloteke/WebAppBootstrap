
<%@include file="includes/header.jsp"%>
<!--<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("add-customer", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>-->

<%
    String action = request.getParameter("action");
    String firstName = request.getParameter("firstName");
    if (firstName == null) firstName = "";
    String lastName = request.getParameter("lastName");
    if (lastName == null) lastName = "";
    String adress = request.getParameter("adress");
    if (adress == null) adress = "";
    String phone = request.getParameter("phone");
    if (phone == null) phone = "";
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
        <li class="breadcrumb-item active" aria-current="page">Registrar cliente</li>
      </ol>
    </nav>
     <form class="row g-3" method = "post" action = "edit-customer" enctype="multipart/form-data">
        <div class="col-md-6">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="firstName" value='<%= firstName %>'>
        </div>
        <div class="col-md-6">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" class="form-control" id="apellido" name="lastName" value='<%= lastName %>'>
        </div>
        <div class="col-12">
            <label for="dirección" class="form-label">Dirección</label>
            <input type="text" class="form-control" id="dirección" placeholder="Calle" name= "adress" value='<%= adress %>' >
        </div>
        <div class="col-md-6">
            <label for="teléfono" class="form-label">Teléfono</label>
            <input type="text" class="form-control" id="teléfono" name = "phone" value='<%= phone %>'>
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



