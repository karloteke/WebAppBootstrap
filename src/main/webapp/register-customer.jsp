<%@include file="includes/header.jsp"%>
<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("add-customer", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<main>
<div class="container">
    <br/>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Registrar cliente</li>
      </ol>
    </nav>
    <form class="row g-3" action= "add-customer" method= "post">
        <div class="col-md-6">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="firstName" >
        </div>
        <div class="col-md-6">
            <label for="apellido" class="form-label">Apellido</label>
            <input type="text" class="form-control" id="apellido" name="lastName" >
        </div>
        <div class="col-12">
            <label for="dirección" class="form-label">Dirección</label>
            <input type="text" class="form-control" id="dirección" placeholder="Calle" name= "adress" >
        </div>
        <div class="col-md-6">
            <label for="teléfono" class="form-label">Teléfono</label>
            <input type="text" class="form-control" id="teléfono" name = "phone">
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Registrar cliente</button>
         </div>
    </form>
    <br/>
    <div id="result"></div>
</div>
</main>
<%@include file="includes/footer.jsp"%>



