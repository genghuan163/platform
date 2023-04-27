package com.apache.platform.service;

import com.apache.platform.dto.OrderCreateDto;
import com.apache.platform.dto.OrderListDto;
import com.apache.platform.vo.OrderListVo;

import java.util.List;

public interface IOrderService {
    List<OrderListVo> getList(OrderListDto orderListDto);


    boolean create(OrderCreateDto orderCreateDto);

}
