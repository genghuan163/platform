package com.apache.platform.listener;


import com.apache.platform.config.JmsConfig;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;

@Component
@RocketMQMessageListener(topic = JmsConfig.SECKILL_TOPIC,consumerGroup = "anran-producer-group")
public class Consumer implements RocketMQListener<String> {



    @Override
    public void onMessage(String message) {
        System.out.println("消费者收到信息：==="+message);
    }
}
