package utils;

import pojo.Product;

import java.util.List;

/**
 * 分页工具类
 * @author wyx
 * @version 1.0
 * @date 2020/11/30
 */
public class PageUtils {

    private int currentPage;
    private int totalCount;
    private int totalPage;
    private int currentCount;
    private List<Product> list;
    private String category;
    private String searchField;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentCount() {
        return currentCount;
    }

    public void setCurrentCount(int currentCount) {
        this.currentCount = currentCount;
    }

    public List<Product> getList() {
        return list;
    }

    public void setList(List<Product> list) {
        this.list = list;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSearchField() {
        return searchField;
    }

    public void setSearchField(String searchField) {
        this.searchField = searchField;
    }

    @Override
    public String toString() {
        return "PageUtils{" +
                "currentPage=" + currentPage +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", currentCount=" + currentCount +
                ", list=" + list +
                ", category='" + category + '\'' +
                ", searchField='" + searchField + '\'' +
                '}';
    }
}
