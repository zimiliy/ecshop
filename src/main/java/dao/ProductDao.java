package dao;

import pojo.Product;
import utils.DH;
import vo.ProductVo;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品dao
 *
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
public class ProductDao {

    /**
     * 获取全部商品信息
     *
     * @return
     */
    public List<Product> queryAllProduct() {
        String sql = "select * from t_product";
        List list = DH.getall(sql, new Product(), null);
        return list;
    }

    /***
     * 根据商品id获取商品信息
     * @param pid
     * @return
     */
    public Product queryProductById(Integer pid) {
        String sql = "select * from t_product  where id=?";
        String[] args = {pid + ""};
        List list = DH.getall(sql, new Product(), args);
        if (list.size() > 0) {
            return (Product) list.get(0);
        } else {
            return null;
        }
    }

    /**
     * 获取某种商品的总数
     *
     * @param category：种类名称
     * @return
     */
    public  int getTotal(String category) {
        String sql = "select * from t_product where category=? ";
        int total = DH.getTotal(sql,category);
        return total;
    }

    /**
     * 根据指定条件查询商品信息
     *
     * @param id:商品id
     * @param name：商品名称
     * @param category：商品类别
     * @param minPrice：最低价格
     * @param maxPrice：最高价格
     * @return
     */
    public List<Product> findProduct(String id, String name, String category, String minPrice, String maxPrice) {
        String sql = "select * from t_product where 1=1";

        List<String> list = new ArrayList<>();
        if (id != null && id.trim().length() > 0) {
            sql += " and id=?";
            list.add(id + "");
        }
        if (name != null && name.trim().length() > 0) {
            sql += " and name=?";
            list.add(name);
        }
        if (category != null && category != "" && category.trim().length() > 0) {
            sql += " and category=?";
            list.add(category);
        }
        if (minPrice != null && maxPrice != null
                && minPrice.trim().length() > 0 && maxPrice.trim().length() > 0) {
            sql += " and price between ? and ?";
            list.add(minPrice + "");
            list.add(maxPrice + "");
        }

        String[] args = list.toArray(new String[list.size()]);
        if (args.length == 0) {
            List<Product> products = queryAllProduct();
            return products;
        } else {
            List allPrioduct = DH.getall(sql, new Product(), args);
            if (list.size() > 0) {
                return allPrioduct;
            } else {
                return null;
            }
        }
    }

    /**
     * 分页查询商品信息
     *
     * @param currentPage：当前页码
     * @param currentCount：每页条数
     * @param category：分类
     * @return
     */
    public List<Product> queryProductByPage(int currentPage, int currentCount, String category) {

        List<Product> list = null;

        String sql = "select * from t_product";

        //定义参数列表
        Object[] args = null;
        //定义一个种类的常量
        String type = "全部商品";
        if (!type.equals(category)) {
            sql = "select * from t_product where category= ? limit ?,?";
            args = new Object[]{category, (currentPage - 1) * currentCount, currentCount};
            List productList = DH.getall(sql, new Product(), args);
            list = productList;
        } else {
            sql += "select * from t_product limit ?,?";
            args = new Object[]{(currentPage - 1) * currentCount, currentCount};
            List productList = DH.getall(sql, new Product(), args);
            list = productList;
        }
        return list;
    }

    /**
     * 添加商品
     *
     * @param product
     * @return
     */
    public int addProduct(Product product) {
        String sql = "insert into t_product(name,price,pnum,category,imgurl,description) values(?,?,?,?,?,?)";
        String[] args = {product.getName(), product.getPrice() + "", product.getPnum() + "", product.getCategory(), product.getImgurl() + "", product.getDescription()};
        int update = DH.update(sql, args);
        return update;
    }


    /**
     * 修改商品信息
     *
     * @param product
     * @return
     */
    public int updateProduct(Product product) {
        //用于存储参数
        List<String> list = new ArrayList<>();
        list.add(product.getName());
        list.add(product.getPrice() + "");
        list.add(product.getCategory());
        list.add(product.getPnum() + "");
        list.add(product.getDescription());
        String sql = "update t_product " + "set name=?,price=?,category=?,pnum=?,description=?";
        //判断是否有图片
        if (product.getImgurl() != null && product.getImgurl().trim().length() > 0) {
            sql += " ,imgurl=?";
            list.add(product.getImgurl());
        }
        sql += " where id=?";
        list.add(product.getId());
        String[] args = list.toArray(new String[list.size()]);
        int update = DH.update(sql, args);
        return update;
    }

    /**
     * 根据商品id删除商品信息
     *
     * @param pid
     * @return
     */
    public int deleteProductById(Integer pid) {
        String sql = "delete from t_product where id=?";
        String[] args = {pid + ""};
        int update = DH.update(sql, args);
        return update;
    }

    /**
     * 根据订单编号查询商品信息
     *
     * @param id
     * @return
     */
    public List<ProductVo> queryProductByOrderId(Integer id) {
        String sql = "select p.*,po.buynum from t_order o left join t_product_order po on o.id=po.oid left join t_product p on p.id=po.pid where o.id=?";
        String[] args = {id + ""};
        List productList = DH.getall(sql, new ProductVo(), args);
        return productList;

    }
}
