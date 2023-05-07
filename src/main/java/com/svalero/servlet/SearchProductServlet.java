package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.ProductDAO;
import com.svalero.domain.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search-product")
public class SearchProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String name = request.getParameter("name");
        String description = request.getParameter("description");

        List<Product> products;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if ((name == null || name.trim().isEmpty()) && (description == null || description.trim().isEmpty())) {
                products = new ArrayList<Product>();

            } else if (name != null && description != null) {
                products = Database.jdbi.withExtension(ProductDAO.class, dao -> {
                    return dao.searchProducts(name, description);
                });
            } else if (name != null) {
                products = Database.jdbi.withExtension(ProductDAO.class, dao -> {
                    return dao.searchProducts(name, "");
                });
            } else {
                products = Database.jdbi.withExtension(ProductDAO.class, dao -> {
                    return dao.searchProducts("", description);
                });
            }
            request.setAttribute("products", products);
            request.getRequestDispatcher("search-product.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
