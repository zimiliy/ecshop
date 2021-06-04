package utils;

import service.ProductService;
import vo.ProductVo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 订单中的工具类
 *
 * @author wyx
 * @version 1.0
 * @date 2020/11/23
 */
public class OrderUtils {
    /**
     * 随机生成六位数，并且每位数都不重复
     *
     * @return
     */
    public static int getNumber() {
        int[] array = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
        Random rand = new Random();
        for (int i = 10; i > 1; i--) {
            int index = rand.nextInt(i);
            int tmp = array[index];
            array[index] = array[i - 1];
            array[i - 1] = tmp;
        }
        int result = 0;
        for (int i = 0; i < 6; i++) {
            result = result * 10 + array[i];
        }
        if (String.valueOf(result).length() == 6) {
            return result;
        } else {
            return getNumber();
        }
    }

    /**
     * 时间转换
     *
     * @return
     */
    public static String zoneToLocalTimeStr() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(currentTime);
        return dateString;
    }

    /**
     * 前端中根据用订单id查询商品信息
     * @param productService
     * @param oid
     * @return
     */
    public static List<ProductVo>  orderById(ProductService productService,Integer oid){
        return productService.queryProductByOrderId(oid);
    }


}
