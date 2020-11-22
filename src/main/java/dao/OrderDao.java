package dao;

import pojo.Order;
import utils.DH;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
public class OrderDao {
    /**
     * 查询全部订单列表
     * @return
     */
    public  List<Order> queryAllOrder(){
        String sql="select * from t_order";
        List<Order> getall = DH.getall(sql, new Order(), null);
        return getall;
    }

    /**
     * 根据条件查询订单雷彪
     * @param id:订单编号
     * @param receiverName：收件人姓名
     * @return
     */
    public List<Order> queryOrder(String id, String receiverName){
        List<String> list = new ArrayList<>();

        String sql = "select * from t_order where 1=1";
        //3.根据参数拼接sql语句
        if (id != null && id.trim().length() > 0) {
            sql += " and id=?";
            list.add(id);
        }
        if (receiverName != null && receiverName.trim().length() > 0) {
            sql += " and receiverName=?";
            list.add(receiverName);
        }
        sql += " order by userid";
        String[] args = list.toArray(new String[list.size()]);
        if (args.length>0){
            List orderList = DH.getall(sql, new Order(), args);
            return orderList;
        }else{
            List<Order> orders = queryAllOrder();
            return orders;
        }

    }

    /**
     * 根据订单id查询订单
     * @param id
     * @return
     */
    public Order findOrderById(Integer id){
        String sql="select * from t_order where id=?";
        List list = DH.getall(sql, new Order(), new String[]{id + ""});
        if (list.size()>0){
           Order order = (Order) list.get(0);
           return order;
        }else {
            return  null;
        }
    }


    /**
     * 根据订单编号删除订单
     * @param id
     * @return
     */
    public int deleteOrderById(Integer id){
        String sql="delete from t_order where id=?";
        String [] args= {id+""};
        int update = DH.update(sql, args);
        return update;
    }
}
