package com.apache.platform.controller;


import com.apache.platform.dto.OrderListDto;
import com.apache.platform.service.IOrderService;
import com.apache.platform.vo.OrderListVo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("order")
public class OrderController {

    @Resource
    private IOrderService orderService;


    @GetMapping("")
    public List<OrderListVo> getList(OrderListDto orderListDto) {
        return orderService.getList(orderListDto);
    }


}
