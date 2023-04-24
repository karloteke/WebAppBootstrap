
<!DOCTYPE html>
<html lang="es">
    <%@page contentType="text/html"%>
    <%@page pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

    <title>Tienda WebApp</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <!--Librería jquery para utilizar javaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Favicons -->
    <meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      .table-responsive {
        width: 100%;
      }
      .style{
        width: 500px;
        margin: 25px auto;
      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      html, body {
       height: 100%;
       margin: 0;
       padding: 0;
      }
      body {
       background: linear-gradient(to bottom, #8E2DE2, #FFF);
      }
      .navbar-brand img {
        height: 40px;
      }
      .navbar-brand {
        margin-right: 10px;
      }
      .bg-purple {
        background: linear-gradient(to bottom, #8E2DE2, #FFF);
      }
      .bg-white {
        background-color: #FFFFFF ;
      }
      .navbar {
        background-color: #D1A9F3;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      }
       /* Regla para todas las tablas, excepto la tabla con id "no-seleccionable" */
      .table tbody tr:not(:first-child):hover {
        background-color: #ECDBFA;
      }
      /* Regla específica para la tabla con id "no-seleccionable" */
       #no-seleccionable tbody tr:hover {
       background-color: transparent;
      }
    </style>

 <nav class="navbar navbar-expand-lg">
   <div class="container-fluid ">
     <a class="navbar-brand" href="#">
           <img src="../tienda_data/Pintalabios.jpg" alt="Logo de la tienda">
           Gestión tienda de maquillaje
         </a>
     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
     <div class="collapse navbar-collapse" id="navbarNav">
       <ul class="navbar-nav">
         <li class="nav-item">
           <a class="nav-link" href="/tienda/index.jsp">Clientes</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="/tienda/orders.jsp">Pedidos</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="/tienda/products.jsp">Productos</a>
         </li>
       </ul>
     </div>
   </div>
 </nav>
<html>