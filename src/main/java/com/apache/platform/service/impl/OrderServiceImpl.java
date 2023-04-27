package com.apache.platform.service.impl;

import com.apache.platform.dao.TOrdersMapper;
import com.apache.platform.dto.OrderCreateDto;
import com.apache.platform.dto.OrderListDto;
import com.apache.platform.model.TOrders;
import com.apache.platform.service.IOrderService;
import com.apache.platform.vo.OrderListVo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.BeanUtils;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements IOrderService {

    @Resource
    private TOrdersMapper ordersMapper;

    @Override
    public List<OrderListVo> getList(OrderListDto orderListDto) {

        Long id = orderListDto.getId();
        LambdaQueryWrapper<TOrders> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(TOrders::getId, id);
        List<TOrders> tOrderList = ordersMapper.selectList(lambdaQueryWrapper);
        BeanCopier beanCopier = BeanCopier.create(TOrders.class, OrderListVo.class, false);
        return tOrderList.stream().map(order -> {
            OrderListVo orderListVo = new OrderListVo();
            beanCopier.copy(order, orderListVo, null);
            return orderListVo;
        }).collect(Collectors.toList());
    }

    @Override
    public boolean create(OrderCreateDto orderCreateDto) {
        TOrders tOrders = new TOrders();
        BeanUtils.copyProperties(orderCreateDto,tOrders);
        return ordersMapper.insert(tOrders) > 0;
    }
}
