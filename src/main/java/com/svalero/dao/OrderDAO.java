package com.svalero.dao;

import com.svalero.domain.Customer;
import com.svalero.domain.Order;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.Date;
import java.util.List;

public interface OrderDAO {

    @SqlQuery("SELECT * FROM orders WHERE customer_id = ?")
    @UseRowMapper(OrderMapper.class)
    List<Order> getOrdersByCustomerId(int customer_id);

    @SqlUpdate("INSERT INTO orders (customer_id,date) VALUES (?, ?)")
    void addOrder(int customer_id, Date date);

    @SqlQuery("SELECT * FROM orders WHERE order_id = ?")
    @UseRowMapper(CustomerMapper.class)
    Customer getOrder(int order_id);

    @SqlUpdate("DELETE FROM orders WHERE order_id = ?")
    void removeOrder(int order_id);

   @SqlUpdate("UPDATE orders SET customer_id WHERE order_id = ?")
    void editOrder(int customer_id, int order_id);

}
