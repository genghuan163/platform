package com.apache.platform.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderListVo {
    private Integer userId;
    private BigDecimal total;
}