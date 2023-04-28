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
public class TProducts extends BaseEntity implements Serializable {

    private String name;

    private String description;

    private String imageUrl;

    private BigDecimal price;

    private Integer categoryId;

    private Integer count;
}