package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.OrderDAO;
import com.svalero.util.DateUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;



@WebServlet("/edit-order")
@MultipartConfig
public class AddEditOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<head><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'></head>");

        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        int amount = Integer.parseInt(request.getParameter("amount"));

        int id = 0;
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if (action.equals("edit")) {
                int orderId = id;
                Database.jdbi.withExtension(OrderDAO.class, dao -> {
                    dao.editOrder(customer_id, product_id, amount, orderId);
                    return null;
                });
            } else {
                Database.jdbi.withExtension(OrderDAO.class, dao -> {
                    dao.addOrder(customer_id, product_id, amount, DateUtils.getDate(LocalDate.now()));
                    return null;
                });
            }
            // HTML del botón de registro y la función JavaScript que redirige a la página de pedidos
            out.println("<div class='alert alert-success text-center' role='alert'>Pedido guardado correctamente</div>");
            out.println("<script>");
            out.println("setTimeout(function(){ window.location.href='orders.jsp'; }, 3000);");
            out.println("</script>");

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}


