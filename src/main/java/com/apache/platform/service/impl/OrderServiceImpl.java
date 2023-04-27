package com.apache.platform.service.impl;

import com.apache.platform.dao.TOrdersMapper;
import com.apache.platform.dto.OrderListDto;
import com.apache.platform.model.TOrders;
import com.apache.platform.service.IOrderService;
import com.apache.platform.vo.OrderListVo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net.sf.cglib.beans.BeanCopier;
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
        return tOrderList.stream().map(order -> {
            OrderListVo orderListVo = new OrderListVo();
            BeanCopier beanCopier = BeanCopier.create(TOrders.class, OrderListVo.class, false);
            beanCopier.copy(order, orderListVo, null);
            return orderListVo;
        }).collect(Collectors.toList());
    }
}
