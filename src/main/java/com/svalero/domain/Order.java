package com.svalero.domain;

import lombok.*;

import java.time.LocalDate;
@Data
@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class Order {

   private int order_id;
   @NonNull
   private String customer_id;
   @NonNull
   private LocalDate registrationDate;

   public Order(int order_id, int customer_id, LocalDate date) {
   }
}

