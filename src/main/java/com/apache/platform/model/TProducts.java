package com.apache.platform.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class TProducts extends BaseEntity implements Serializable {

    private String name;

    private String description;

    private String imageUrl;

    private BigDecimal price;

    private Integer categoryId;
}