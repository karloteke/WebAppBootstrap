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
   private int customer_id;
   @NonNull
   private int product_id;
   @NonNull
   private int amount;
   @NonNull
   private LocalDate date;

}

