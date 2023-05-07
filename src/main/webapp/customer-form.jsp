<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<script type="text/javascript">
  $(document).ready(function() {
      $("form").on("submit", function(event) {
          event.preventDefault();
          var form = $(this)[0];
          var formData = new FormData(form);
          $.ajax({
              url: "edit-customer",
              type: "POST",
              data: formData,
              processData: false,
              contentType: false,
              success: function(data) {
                  $("#result").html(data);
                  setTimeout(function(){
                    window.location.href='index.jsp';
                  }, 3000);
              },
          });
      });
  });
</script>

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

    String buttonText = "Registrar";
    if (action.equals("edit")) buttonText = "Modificar";
%>


<body class="custom-gradient">
    <div class="container">
        <nav aria-label="breadcrumb" class="pt-25">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.jsp" style="color: black;">Inicio</a></li>
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
                if (action.equals("edit")) {
                    int id = Integer.parseInt(request.getParameter("id"));
            %>
                <input type="hidden" name="id" value="<%= id %>"/>
            <%
                }
            %>
            <div class="col-12">
                <input type="submit" class="btn btn-dark" value="<%= buttonText %>"/>
            </div>
        </form>
        <div id="result"></div>
    </div>
</div>




