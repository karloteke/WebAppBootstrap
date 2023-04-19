package com.svalero.dao;

import com.svalero.domain.Product;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.math.BigDecimal;
import java.util.List;

public interface ProductDAO {

    @SqlQuery("SELECT * FROM products")
    @UseRowMapper(ProductMapper.class)
    List<Product> getProducts();

    @SqlUpdate("INSERT INTO products (name, description, price, image) VALUES (?, ?, ?, ?)")
    void addProduct(String name, String description, BigDecimal price, String image);

    @SqlQuery("SELECT * FROM products WHERE product_id = ?")
    @UseRowMapper(ProductMapper.class)
    Product getProduct(int product_id);

    @SqlUpdate("DELETE FROM products WHERE product_id = ?")
    void removeProduct(int product_id);

    @SqlUpdate("UPDATE products SET name = ?, description = ?, price = ?, image = ? WHERE product_id = ?")
    void editProduct(String name, String description, BigDecimal price, String image, int product_id);

}
