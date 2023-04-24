package com.svalero.servlet;

import com.svalero.dao.CustomerDAO;
import com.svalero.dao.Database;
import com.svalero.dao.ProductDAO;
import com.svalero.domain.Customer;
import com.svalero.domain.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/search-product")
public class SearchProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<head><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'></head>");

        String name = request.getParameter("name");
        String description = request.getParameter("description");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            String sql;
            if (name != null && description != null) {
                sql = "SELECT * FROM products WHERE name = ? AND description = ?";
            } else if (name != null) {
                sql = "SELECT * FROM products WHERE name LIKE ?";
                description = ""; // Para evitar errores en el binding
            } else if (description != null) {
                sql = "SELECT * FROM products WHERE description LIKE ?";
                name = ""; // Para evitar errores en el binding
            } else {
                // No se ha pasado ningún campo de búsqueda
                sql = "SELECT * FROM products";
                name = "";
                description = "";
            }

            String finalName = name;
            String finalDescription = description;
            List<Product> products = Database.jdbi.withExtension(ProductDAO.class, dao -> {
                return dao.searchProducts(finalName, finalDescription);
            });

            request.setAttribute("products", products);
            request.getRequestDispatcher("search-product.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
