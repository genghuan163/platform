package com.apache.platform.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseEntity {

    private Long id;

    private Boolean deleted;


    private Integer version;

    private String createdBy;


    private Date createdDate;

    private String updatedBy;

    private Date updatedDate;
}
