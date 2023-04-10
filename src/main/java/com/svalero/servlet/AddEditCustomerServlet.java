package com.svalero.servlet;

import com.svalero.dao.CustomerDAO;
import com.svalero.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;


@WebServlet("/edit-customer")
@MultipartConfig
public class AddEditCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String imagePath = request.getServletContext().getInitParameter("image-path");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String adress = request.getParameter("adress");
        String phone = request.getParameter("phone");

        int id = 0;
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        try {
            // Subir la imagen a la carpeta taller_data
            Part imagePart = request.getPart("image");
            String fileName;
            if (imagePart.getSize() == 0) {
                fileName = "no_image.jpg";
            } else {
                fileName = UUID.randomUUID() + ".jpg";
                InputStream fileStream = imagePart.getInputStream();
                Files.copy(fileStream, Path.of(imagePath + File.separator + fileName));
            }
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if (action.equals("edit")) {
                int customerId = id;
                Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                    dao.editCustomer(firstName, lastName, adress, phone, fileName, customerId);
                    return null;
                });
            } else {
                Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                    dao.addCustomer(firstName, lastName, adress, phone, fileName);
                    return null;
                });
            }

            out.println("<div class='alert alert-success' role='alert'>Cliente registrado correctamente</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
