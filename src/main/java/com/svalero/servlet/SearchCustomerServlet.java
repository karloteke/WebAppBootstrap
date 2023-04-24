package com.svalero.servlet;

import com.svalero.dao.CustomerDAO;
import com.svalero.dao.Database;
import com.svalero.domain.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search-customer")
public class SearchCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<head><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'></head>");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            String sql;
            if (firstName != null && lastName != null) {
                sql = "SELECT * FROM customers WHERE first_name = ? AND last_name = ?";
            } else if (firstName != null) {
                sql = "SELECT * FROM customers WHERE first_name LIKE ?";
                lastName = ""; // Para evitar errores en el binding
            } else if (lastName != null) {
                sql = "SELECT * FROM customers WHERE last_name LIKE ?";
                firstName = ""; // Para evitar errores en el binding
            } else {
                // No se ha pasado ningún campo de búsqueda
                sql = "SELECT * FROM customers";
                firstName = "";
                lastName = "";
            }

            String finalFirstName = firstName;
            String finalLastName = lastName;
            List<Customer> customers = Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                return dao.searchCustomers(finalFirstName, finalLastName);
            });



            request.setAttribute("customers", customers);
            request.getRequestDispatcher("search-customer.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
