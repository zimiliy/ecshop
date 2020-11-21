package service.impl;

import dao.ProductDao;
import pojo.Product;
import service.ProductService;

import java.util.List;

/**
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
public class ProductServiceImpl implements ProductService {

    ProductDao productDao=new ProductDao();

    /**
     * 查询全部商品信息
     * @return
     */
    @Override
    public List<Product> queryAllProduct() {
        List<Product> products = productDao.queryAllProduct();
        return products;
    }

    /**
     * 根据商品id查询商品
     * @param pid:商品id
     * @return
     */
    @Override
    public Product queryProductById(Integer pid) {
        return productDao.queryProductById(pid);
    }

    /**
     * 根据指定添加查询
     * @param id
     * @param name
     * @param category
     * @param minPrice
     * @param maxPrice
     * @return
     */
    @Override
    public List<Product> findProduct(String id, String name, String category, String minPrice, String maxPrice) {

        return productDao.findProduct(id, name, category, minPrice, maxPrice);
    }

    /**
     * 添加商品
     * @param product
     * @return
     */
    @Override
    public int addProduct(Product product) {
        return productDao.addProduct(product);
    }

    /**
     * 更改商品的信息
     * @param product
     * @return
     */
    @Override
    public int updateProduct(Product product) {
        return productDao.updateProduct(product);
    }

    /**
     * 根据商品id删除商品
     * @param pid 商品id
     * @return
     */
    @Override
    public int deleteProductById(Integer pid) {
        return productDao.deleteProductById(pid);
    }
}
