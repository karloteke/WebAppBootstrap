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


@WebServlet("/add-customer")
@MultipartConfig
public class AddCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String filePath = "/Users/Jesus/Desktop/apache-tomcat-10.1.7/webapps/tienda_data";

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String adress = request.getParameter("adress");
        String phone = request.getParameter("phone");

        try {
            // Subir la imagen a la carpeta tienda_data
            Part imagePart = request.getPart("image");
            String fileName = UUID.randomUUID() + ".jpg";
            InputStream fileStream = imagePart.getInputStream();
            Files.copy(fileStream, Path.of(filePath + File.separator + fileName));

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            Database.jdbi.withExtension(CustomerDAO.class, dao -> {
                dao.addCustomer(firstName, lastName, adress, phone, fileName);
                return null;
            });

            out.println("<div class='alert alert-success' role='alert'>Cliente registrado correctamente</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
