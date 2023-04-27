package com.apache.platform.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TOrders extends BaseEntity implements Serializable {


    private Integer userId;

    private BigDecimal total;
}