package com.svalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
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
    @NonNull
    private String image;
}
