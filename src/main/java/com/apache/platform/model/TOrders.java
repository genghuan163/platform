package com.apache.platform.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TOrders extends BaseEntity implements Serializable {
    private Long userId;

    private BigDecimal total;

    private Integer count;

    private Integer orderStatus;

    private Integer discount;

    private Integer couponId;

}