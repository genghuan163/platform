package com.apache.platform.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TOrderItems extends BaseEntity implements Serializable {

    private Long orderId;

    private Long productId;

    private String productName;

    private BigDecimal price;

    private BigDecimal sumPrice;

    private Integer orderStatus;

    private Long userId;

    private Integer count;

}