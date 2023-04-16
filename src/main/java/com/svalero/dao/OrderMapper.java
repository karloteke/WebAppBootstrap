package com.svalero.dao;

import com.svalero.domain.Customer;
import com.svalero.domain.Order;
import com.svalero.util.DateUtils;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderMapper implements RowMapper<Order> {

    @Override
    public Order map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Order(rs.getInt("order_id"),
                rs.getInt("customer_id"),
                DateUtils.getLocalDate(rs.getDate("date"))
            );
    }
}

