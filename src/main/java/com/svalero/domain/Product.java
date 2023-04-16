package com.svalero.domain;

import lombok.*;

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
    private int price;
    @NonNull
    private String image;

    public Product(int product_id, String name, int price, String image) {
    }
}
