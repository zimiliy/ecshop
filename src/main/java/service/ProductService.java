package service;

import pojo.Product;

import java.util.List;

/**
 *商品业务
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
public interface ProductService {
    /**
     * 查询全部商品
     * @return
     */
    List<Product> queryAllProduct();

    /**
     * 根据商品id获取商品
     * @param pid:商品id
     * @return
     */
    Product queryProductById(Integer pid);

    /**
     * 根据指定条件进行查询
     * @param id
     * @param name
     * @param category
     * @param minPrice
     * @param maxPrice
     * @return
     */
    List<Product> findProduct(String id, String name,String category, String minPrice, String maxPrice);

    /**
     * 添加商品
     * @param product
     * @return
     */
    int addProduct(Product product);

    /**
     * 修改商品信息
     * @param product
     * @return
     */
    int updateProduct(Product product);
    /**
     * 根据商品id删除商品
     * @param pid 商品id
     * @return
     */
     int deleteProductById(Integer pid);
}
