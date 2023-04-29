package com.svalero.servlet;

import com.svalero.dao.ProductDAO;
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
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;


    @WebServlet("/edit-product")
    @MultipartConfig
    public class AddEditProductServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String imagePath = request.getServletContext().getInitParameter("image-path");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            BigDecimal price = BigDecimal.valueOf(Double.parseDouble(request.getParameter("price")));

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
                    fileName = "no_image2.jpg";
                } else {
                    fileName = UUID.randomUUID() + ".jpg";
                    InputStream fileStream = imagePart.getInputStream();
                    Files.copy(fileStream, Path.of(imagePath + File.separator + fileName));
                }
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();

                if (action.equals("edit")) {
                    int productId = id;
                    Database.jdbi.withExtension(ProductDAO.class, dao -> {
                        dao.editProduct(name,description,price,fileName,productId);
                        return null;
                    });
                } else {
                    Database.jdbi.withExtension(ProductDAO.class, dao -> {
                        dao.addProduct(name,description,price,fileName);
                        return null;
                    });
                }
                // HTML del botón de registro
                out.println("<div class='alert alert-success text-center' role='alert'>Producto guardado correctamente</div>");

            } catch (ClassNotFoundException cnfe) {
                cnfe.printStackTrace();
        }
    }
}
