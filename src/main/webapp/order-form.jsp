
<%@include file="includes/header.jsp"%>


<%
    String action = request.getParameter("action");
    String customer_id = request.getParameter("customer_id");
    if (customer_id == null) customer_id = "";
    String product_id = request.getParameter("product_id");
    if (product_id == null) product_id = "";
    String amount = request.getParameter("amount");
    if (amount == null) amount = "";

%>

<main>
<div class="container">
    <br/>
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Inicio</a></li>
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
            <input type="submit" value="<%= action %>"/>
        </div>
    </form>
    <br/>
    <div id="result"></div>
</div>
</main>

<%@include file="includes/footer.jsp"%>



