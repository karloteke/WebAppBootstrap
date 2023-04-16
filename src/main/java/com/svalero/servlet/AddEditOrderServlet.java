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
        String imagePath = request.getServletContext().getInitParameter("image-path");

        String customer_id = request.getParameter("customer_id");


        int id = 0;
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if (action.equals("edit")) {
                int customerId = id;
                Database.jdbi.withExtension(OrderDAO.class, dao -> {
                    dao.editOrder(Integer.parseInt(customer_id),customerId);
                    return null;
                });
            } else {
                Database.jdbi.withExtension(OrderDAO.class, dao -> {
                    dao.addOrder(Integer.parseInt(customer_id), DateUtils.getDate(LocalDate.now()));
                    return null;
                });
            }
            // TODO Mientras no corregimos el javascript para envio asincrono podemos redirigir al index
            response.sendRedirect("index.jsp");

            out.println("<div class='alert alert-success' role='alert'>Pedido registrado correctamente</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}