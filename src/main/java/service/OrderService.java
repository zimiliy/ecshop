package service;

import pojo.Order;

import java.util.List;

/**
 * 订单业务逻辑处理
 *
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
public interface OrderService {

    /**
     * 新增订单
     *
     * @param order
     * @return
     */
    int addOrder(Order order);

    /**
     * 查询全部订单信息
     *
     * @return
     */
    List<Order> queryAllOrder();

    /**
     * 条件查询
     *
     * @param id
     * @param receiverName
     * @return
     */
    List<Order> queryOrder(String id, String receiverName);

    /**
     * 根据订单编号查询订单信息
     *
     * @param id
     * @return
     */
    Order findOrderById(Integer id);

    /**
     * 根据订单id删除订单信息
     *
     * @param id
     * @return
     */
    int deleteOrderById(Integer id);

    /**
     * 商品订单表中插入数据
     *
     * @param pid：商品编号
     * @param oid：订单编号
     * @param buynum：购买数量
     * @return
     */
    int addProductOrder(Integer pid, Integer oid, Integer buynum);


    /**
     * 根据用户id查询所有订单
     *
     * @param uid
     * @return
     */
    List<Order> queryOrderByUserId(Integer uid);
}
