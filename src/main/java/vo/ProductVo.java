package vo;

import pojo.Product;

/**
 * 用于封装商品的额外参数
 * @author wyx
 * @version 1.0
 * @date 2020/11/20
 */
public class ProductVo extends Product {
    private  String minPrice;
    private  String maxPrice;
    private Integer buynum;


    public ProductVo() {
    }

    public ProductVo(String minPrice, String maxPrice, Integer buynum) {
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.buynum=buynum;
    }

    public ProductVo(String id, String name,String category,String minPrice, String maxPrice,Integer buynum) {
        super(id, name,category);
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
        this.buynum=buynum;
    }

    public String getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(String minPrice) {
        this.minPrice = minPrice;
    }

    public String getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(String maxPrice) {
        this.maxPrice = maxPrice;
    }

    public Integer getBuynum() {
        return buynum;
    }

    public void setBuynum(Integer buynum) {
        this.buynum = buynum;
    }
}
