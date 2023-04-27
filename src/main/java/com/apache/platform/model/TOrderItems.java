package com.apache.platform.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class TOrderItems extends BaseEntity implements Serializable {
    private Long orderId;

    private Long productId;

    private Long quantity;

    private BigDecimal price;
}