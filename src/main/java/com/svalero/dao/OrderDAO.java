package com.svalero.dao;

import com.svalero.domain.Order;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.Date;
import java.util.List;

public interface OrderDAO {
    @SqlQuery("SELECT * FROM orders")
    @UseRowMapper(OrderMapper.class)
    List<Order> getOrders();


    @SqlUpdate("INSERT INTO orders (customer_id, image, date) VALUES (?, ?, ?)")
    void addOrder(int customer_id,String image, Date Date);

    @SqlQuery("SELECT * FROM orders WHERE order_id = ?")
    @UseRowMapper(OrderMapper.class)
    Order getOrder(int order_id);

    @SqlUpdate("DELETE FROM orders WHERE order_id = ?")
    void removeOrder(int order_id);

    @SqlUpdate("UPDATE orders SET customer_id = ?, image = ? WHERE order_id = ?")
    void editOrder(int customer_id, String image, int order_id);


}
