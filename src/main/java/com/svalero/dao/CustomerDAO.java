package com.svalero.dao;

import com.svalero.domain.Customer;
import com.svalero.domain.Order;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface CustomerDAO {

    @SqlQuery("SELECT * FROM customers")
    @UseRowMapper(CustomerMapper.class)
    List<Customer> getCustomers();

    @SqlUpdate("INSERT INTO customers (first_name, last_name, adress, phone, image) VALUES (?, ?, ?, ?, ?)")
    void addCustomer(String firstName, String lastName, String adress, String phone, String image);

    @SqlQuery("SELECT * FROM customers WHERE customer_id = ?")
    @UseRowMapper(CustomerMapper.class)
    Customer getCustomer(int customer_id);

    @SqlUpdate("DELETE FROM customers WHERE customer_id = ?")
    void removeCustomer(int customer_id);

    @SqlUpdate("UPDATE customers SET first_name = ?, last_name = ?, adress = ?, phone = ?, image = ? WHERE customer_id = ?")
    void editCustomer(String firstName, String lastName, String adress, String phone, String image, int customer_id);

    @SqlQuery("SELECT * FROM customers WHERE first_name = ? AND last_name = ?")
    @UseRowMapper(CustomerMapper.class)
    List<Order> searchCustomers(String firstName, String lastName);

}
