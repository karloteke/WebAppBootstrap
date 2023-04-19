package com.svalero.domain;

import lombok.*;

import java.math.BigDecimal;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product {

    private int product_id;
    @NonNull
    private String name;
    @NonNull
    private String description;
    @NonNull
    private BigDecimal price;
    @NonNull
    private String image;

}
