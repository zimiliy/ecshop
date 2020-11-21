package dao;

import pojo.Product;
import utils.DH;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品dao
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
public class ProductDao {

    /**
     * 获取全部商品信息
     * @return
     */
   public List<Product> queryAllProduct(){
        String sql="select * from t_product";
        List list = DH.getall(sql, new Product(), null);
        return list;
    }

    /***
     * 根据商品id获取商品信息
     * @param pid
     * @return
     */
    public Product queryProductById(Integer pid){
       String sql="select * from t_product  where id=?";
       String [] args={pid+""};
        List list = DH.getall(sql, new Product(), args);
        if (list.size()>0){
            return (Product) list.get(0);
        }else {
            return null;
        }
    }

    /**
     * 根据指定条件查询商品信息
     * @param id:商品id
     * @param name：商品名称
     * @param category：商品类别
     * @param minPrice：最低价格
     * @param maxPrice：最高价格
     * @return
     */
    public List<Product> findProduct(String id, String name,String category, String minPrice, String maxPrice){
        String sql="select * from t_product where 1=1";

        List<String> list=new ArrayList<>();
        if (id != null && id.trim().length() > 0) {
            sql += " and id=?";
            list.add(id+"");
        }if (name != null&& name.trim().length() > 0) {
            sql += " and name=?";
            list.add(name);
        }
        if (category != null&&category!=""&& category.trim().length() > 0) {
            sql += " and category=?";
            list.add(category);
        }
        if (minPrice != null && maxPrice != null
                && minPrice.trim().length() > 0 && maxPrice.trim().length() > 0) {
            sql += " and price between ? and ?";
            list.add(minPrice+"");
            list.add(maxPrice+"");
        }

        String[] args= list.toArray(new String[list.size()]);

        List allPrioduct = DH.getall(sql, new Product(), args);
        if (list.size()>0){
            return allPrioduct;
        }else {
            return  null;
        }
    }

    /**
     * 添加商品
     * @param product
     * @return
     */
    public int addProduct(Product product){
        String sql="insert into t_product(name,price,pnum,category,imgurl,description) values(?,?,?,?,?,?)";
        String[] args={product.getName(),product.getPrice()+"",product.getPnum()+"",product.getCategory(),product.getImgurl()+"",product.getDescription()};
        int update = DH.update(sql, args);
        return update;
    }


    /**
     * 修改商品信息
     * @param product
     * @return
     */
    public  int updateProduct(Product product){
        //用于存储参数
        List<String> list=new ArrayList<>();
        list.add(product.getName());
        list.add(product.getPrice()+"");
        list.add(product.getCategory());
        list.add(product.getPnum()+"");
        list.add(product.getDescription());
        String sql  = "update t_product "+"set name=?,price=?,category=?,pnum=?,description=?";
        //判断是否有图片
        if (product.getImgurl() != null && product.getImgurl().trim().length() > 0) {
            sql += " ,imgurl=?";
            list.add(product.getImgurl());
        }
        sql += " where id=?";
        list.add(product.getId());
        String[] args= list.toArray(new String[list.size()]);
        int update = DH.update(sql, args);
        return  update;
    }

    /**
     * 根据商品id删除商品信息
     * @param pid
     * @return
     */
    public  int deleteProductById(Integer pid){
        String sql="delete from t_product where id=?";
        String [] args={pid+""};
        int update = DH.update(sql, args);
        return update;
    }
}
