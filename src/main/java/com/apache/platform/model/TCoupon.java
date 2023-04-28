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
public class TCoupon extends BaseEntity implements Serializable {


    private Long userId;

    private String name;

    private BigDecimal amount;

    private BigDecimal meetAmount;

    private Date startTime;

    private Date endTime;

    private Integer usedStatus;

    private String number;
}