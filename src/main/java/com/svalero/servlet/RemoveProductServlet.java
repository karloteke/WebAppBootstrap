package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.OrderDAO;
import com.svalero.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/remove-product")
public class RemoveProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("id"));

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Database.jdbi.withExtension(OrderDAO.class, dao -> {
                dao.removeOrderByProduct(id);
                return null;
            });

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Database.jdbi.withExtension(ProductDAO.class, dao -> {
                dao.removeProduct(id);
                return null;
            });
            response.sendRedirect("products.jsp");

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}