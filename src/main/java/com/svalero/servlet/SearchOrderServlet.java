package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.OrderDAO;
import com.svalero.domain.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search-order")
public class SearchOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        //Si el valor no es nulo ni está vacío, se intenta convertir la cadena de texto a un número entero utilizando el método "parseInt()
        String OrderIdString = request.getParameter("order_id");
        Integer order_id = null;
        if (OrderIdString != null && !OrderIdString.isBlank()) { //Devuelve verdadero si una cadena de texto está vacía/espacios en blanco.
            try {
                order_id = Integer.parseInt(OrderIdString);
            } catch (NumberFormatException e) {
            }
        }

        String amountString = request.getParameter("amount");
        Integer amount = null;
        if (amountString != null && !amountString.isBlank()) {
            try {
                amount = Integer.parseInt(amountString);
            } catch (NumberFormatException e) {
            }
        }

        List<Order> orders;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Integer finalOrder_id = order_id;
            Integer finalAmount = amount;
            orders = Database.jdbi.withExtension(OrderDAO.class, dao -> {
                return dao.searchOrders(finalOrder_id, finalAmount);
            });

            if (order_id == null && amount == null) {
                orders = new ArrayList<Order>(); // inicializar como lista vacía si ambos parámetros son nulos
            }

            request.setAttribute("orders", orders);
            request.getRequestDispatcher("search-order.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}