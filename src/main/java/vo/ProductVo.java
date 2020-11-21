package vo;

import pojo.Product;

/**
 * @author wyx
 * @version 1.0
 * @date 2020/11/20
 */
public class ProductVo extends Product {
    private  String minPrice;
    private  String maxPrice;

    public ProductVo(String minPrice, String maxPrice) {
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
    }

    public ProductVo(String id, String name,String category,String minPrice, String maxPrice) {
        super(id, name,category);
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
    }
}
