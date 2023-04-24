<%@include file="includes/header.jsp"%>

<script type="text/javascript">
  $(document).ready(function() {
      $("form").on("submit", function(event) {
          event.preventDefault();
          var form = $(this)[0];
          var formData = new FormData(form);
          $.ajax({
              url: "edit-order",
              type: "POST",
              data: formData,
              processData: false,
              contentType: false,
              success: function(data) {
                  $("#result").html(data);
              },
          });
      });
  });
</script>

<%
    String action = request.getParameter("action");
    String customer_id = request.getParameter("customer_id");
    if (customer_id == null) customer_id = "";
    String product_id = request.getParameter("product_id");
    if (product_id == null) product_id = "";
    String amount = request.getParameter("amount");
    if (amount == null) amount = "";

    String buttonText = "Registrar";
    if (action.equals("edit")) buttonText = "Modificar";

%>

<div class="container">
    <br/>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp" style="color: black;">Inicio</a></li>
        <li class="breadcrumb-item active" aria-current="page">Registrar pedido</li>
      </ol>
    </nav>
     <form class="row g-3" method = "post" action = "edit-order" enctype="multipart/form-data">
       <div class="col-md-6">
             <label for="id" class="form-label">Id cliente</label>
             <input type="text" class="form-control" id="id" name="customer_id" value='<%= customer_id %>'>
       </div>
        <div class="col-md-6">
            <label for="id" class="form-label">Id producto</label>
            <input type="text" class="form-control" id="id" name="product_id" value='<%= product_id %>'>
       </div>
        <div class="col-md-6">
            <label for="amount" class="form-label">Cantidad</label>
            <input type="text" class="form-control" id="id" name="amount" value='<%= amount %>'>
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
            <input type="submit" class="btn btn-dark" value="<%= buttonText %>"/>
        </div>
     </form>
     <br/>
    <div id="result"></div>
</div>




