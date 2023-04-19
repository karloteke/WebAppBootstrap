package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/search-order")
public class SearchOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<head><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'></head>");

        int order_id = Integer.parseInt((request.getParameter("order_id")));
        int amount = Integer.parseInt(request.getParameter("amount"));


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Object orders = Database.jdbi.withExtension(OrderDAO.class, dao -> {
                return dao.searchOrders(order_id, amount);
            });

            request.setAttribute("orders", orders);
            request.getRequestDispatcher("search-order.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}

