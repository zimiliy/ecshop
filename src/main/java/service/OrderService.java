package service;

import pojo.Order;

import java.util.List;

/**
 * 订单业务逻辑处理
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
public interface OrderService {

    /**
     * 查询全部订单信息
     * @return
     */
    List<Order> queryAllOrder();

    /**
     * 条件查询
     * @param id
     * @param receiverName
     * @return
     */
    List<Order> queryOrder(String id, String receiverName);

    /**
     * 根据订单编号查询订单信息
     * @param id
     * @return
     */
    Order findOrderById(Integer id);

    /**
     * 根据订单id删除订单信息
     * @param id
     * @return
     */
    int deleteOrderById(Integer id);
}
