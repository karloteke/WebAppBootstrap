package com.svalero.dao;

import com.svalero.domain.Order;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import java.sql.Date;
import java.util.List;

public interface OrderDAO {
    @SqlQuery("SELECT * FROM orders")
    @UseRowMapper(OrderMapper.class)
    List<Order> getOrders();

    @SqlUpdate("INSERT INTO orders (customer_id, product_id, amount, date) VALUES (?, ?, ?, ?)")
    void addOrder(int customer_id, int product_id, int amount, Date Date);

    @SqlQuery("SELECT * FROM orders WHERE order_id = ?")
    @UseRowMapper(OrderMapper.class)
    Order getOrder(int order_id);

    @SqlUpdate("DELETE FROM orders WHERE order_id = ?")
    void removeOrder(int order_id);

    @SqlUpdate("DELETE FROM orders WHERE product_id = ?")
    void removeOrderByProduct(int product_id);

    @SqlUpdate("DELETE FROM orders WHERE customer_id = ?")
    void removeCustomerByOrder(int customer_id);

    @SqlUpdate("UPDATE orders SET customer_id = ?, product_id = ?, amount = ? WHERE order_id = ?")
    void editOrder(int customer_id, int product_id, int amount, int order_id);

    @SqlQuery("SELECT * FROM orders WHERE (order_id = :order_id OR :order_id IS NULL) AND (amount = :amount OR :amount IS NULL)")
    @UseRowMapper(OrderMapper.class)
    List<Order> searchOrders(@Bind("order_id") Integer order_id, @Bind("amount") Integer amount);
    //@Bind para enlazar los parámetros de la consulta con los valores proporcionados en los parámetros del método.

}