package com.apache.platform.controller;


import com.apache.platform.common.Result;
import com.apache.platform.dto.OrderCreateDto;
import com.apache.platform.dto.OrderListDto;
import com.apache.platform.service.IOrderService;
import com.apache.platform.vo.OrderListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("order")
public class OrderController {

    @Autowired
    private IOrderService orderService;


    @GetMapping("/index")
    public Result getList(OrderListDto orderListDto) {
        return Result.ok(orderService.getList(orderListDto));
    }
    @PostMapping("/create")
    public Result create(@RequestBody OrderCreateDto orderCreateDto) {
        return Result.ok(orderService.create(orderCreateDto));
    }

}
