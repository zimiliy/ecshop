package service.impl;

import dao.ProductDao;
import pojo.Product;
import service.ProductService;
import utils.PageUtils;
import vo.ProductVo;

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
     * 分页查询商品信息
     * @param currentPage
     * @param currentCount
     * @param category
     * @return
     */
    @Override
    public PageUtils queryProductByPage(int currentPage, int currentCount, String category) {

        //创建分页工具类
        PageUtils pageUtils = new PageUtils();
        //封装 每页显示的条数
        pageUtils.setCurrentCount(currentCount);
        // 封装当前页码
        pageUtils.setCurrentPage(currentPage);
        // 封装当前查找类别
        pageUtils.setCategory(category);

        try {
            //查询该商品总数
            int total = productDao.getTotal(category);
            pageUtils.setTotalCount(total);
            int totalPage = (int) Math.ceil(total * 1.0 / currentCount);
            List<Product> list = productDao.queryProductByPage(currentPage, currentCount, category);
            pageUtils.setTotalPage(totalPage);
            pageUtils.setList(list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return pageUtils;
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

    /**
     * 根据订单id查询对应的商品列列表
     * @param id
     * @return
     */
    @Override
    public List<ProductVo> queryProductByOrderId(Integer id) {
        return productDao.queryProductByOrderId(id);
    }
}
