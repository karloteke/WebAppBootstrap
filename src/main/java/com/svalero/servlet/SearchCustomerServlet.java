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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search-customer")
public class SearchCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

        List<Customer> customers;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if ((firstName == null || firstName.trim().isEmpty()) && (lastName == null || lastName.trim().isEmpty())) {
                customers = new ArrayList<Customer>();

            } else if (firstName != null && lastName != null) {
                customers = Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                    return dao.searchCustomers(firstName, lastName);
                });

            } else if (firstName != null) {
                customers = Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                    return dao.searchCustomers(firstName, "");
                });

            } else {
                customers = Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                    return dao.searchCustomers("", lastName);
                });
            }
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("search-customer.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
