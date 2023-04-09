package com.svalero.domain;

import com.mysql.cj.x.protobuf.MysqlxCrud;
import lombok.*;

import java.util.List;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Customer {

    private int customer_id;
    @NonNull
    private String firstName;
    @NonNull
    private String lastName;
    @NonNull
    private String adress;
    @NonNull
    private String phone;

    //Relaciono los pedidos dentro de clientes
    //private List<MysqlxCrud.Order> orders;

}
