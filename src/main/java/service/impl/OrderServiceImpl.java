package service.impl;

import dao.OrderDao;
import pojo.Order;
import pojo.User;
import service.OrderService;
import service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
public class OrderServiceImpl implements OrderService {

    private UserService userService = new UserServiceImpl();

    private OrderDao orderDao = new OrderDao();

    @Override
    public int addOrder(Order order) {
        return orderDao.addOrder(order);
    }

    /**
     * 查询全部订单信息
     *
     * @return
     */
    @Override
    public List<Order> queryAllOrder() {
        List<Order> orderList = orderDao.queryAllOrder();
        //重新封装订单信息列表
        return getOrders(orderList);
    }

    /**
     * 根据指定条件查询订单列表
     *
     * @param id
     * @param receiverName
     * @return
     */
    @Override
    public List<Order> queryOrder(String id, String receiverName) {
        List<Order> orderList = orderDao.queryOrder(id, receiverName);
        return getOrders(orderList);
    }

    /**
     * 根据订单id查询订单
     *
     * @param id
     * @return
     */
    @Override
    public Order findOrderById(Integer id) {
        Order order = orderDao.findOrderById(id);
        User user = userService.queryUserById(order.getUserid());
        order.setUser(user);
        return order;
    }


    /**
     * 根据订单id删除订单信息
     *
     * @param id
     * @return
     */
    @Override
    public int deleteOrderById(Integer id) {
        return orderDao.deleteOrderById(id);
    }

    /**
     * 商品订单表中插入数据
     *
     * @param pid：商品编号
     * @param oid：订单编号
     * @param buynum：购买数量
     * @return
     */
    @Override
    public int addProductOrder(Integer pid, Integer oid, Integer buynum) {
        return orderDao.addProductOrder(pid, oid, buynum);
    }

    /**
     * 根据用户id查询所有订单
     *
     * @param uid
     * @return
     */
    @Override
    public List<Order> queryOrderByUserId(Integer uid) {
        return orderDao.queryOrderByUserId(uid);
    }

    /**
     * 重新对订单信息进行封装
     *
     * @param orderList
     * @return
     */
    private List<Order> getOrders(List<Order> orderList) {
        List<Order> orders = new ArrayList<>();
        for (Order order : orderList) {
            User user = userService.queryUserById(order.getUserid());
            order.setUser(user);
            orders.add(order);
        }
        return orders;
    }
}
