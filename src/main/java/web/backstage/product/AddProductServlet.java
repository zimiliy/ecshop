package web.backstage.product;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import pojo.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;
import utils.FileUploadUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 添加商品servlet
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    ProductService productService=new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //用于封装商品对象
        Product product=new Product();
        Map<String, String> map = new HashMap<>();

        DiskFileItemFactory dFIFactory = new DiskFileItemFactory();
        //设置临时文件存储的位置
        dFIFactory.setRepository(new File(this.getServletContext().getRealPath("/temp")));
        //设置文件上传缓存大小为10m
        dFIFactory.setSizeThreshold(1024*1024*10);
        //创建上传组件
        ServletFileUpload upload = new ServletFileUpload(dFIFactory);

        //处理上传文件乱码问题
        upload.setHeaderEncoding("utf-8");
        try {
            //所有form表单中的字段全都存在list中
            List<FileItem> list = upload.parseRequest(request);
            //遍历所有FileItem
            for (FileItem fileItem : list) {
                //判断是否是上传组件
                if (fileItem.isFormField()){
                    //不是上传组件
                    //获取普通表单字段值
                    String fieldName = fileItem.getFieldName();
                    String value= fileItem.getString("utf-8");
                    map.put(fieldName,value);
                }else {
                    // 是上传组件
                    // 得到上传文件真实名称
                    String fileName = fileItem.getName();
                    fileName = FileUploadUtils.subFileName(fileName);

                    // 得到随机名称
                    String randomName = FileUploadUtils.generateRandonFileName(fileName);

                    // 图片存储父目录
                    String imgurl_parent = "/upload";

                    File parentDir = new File(request.getServletContext().getRealPath(imgurl_parent));
                    System.out.println(parentDir);

                    // 验证目录是否存在，如果不存在，创建出来
                    if (!parentDir.exists()) {
                        parentDir.mkdirs();
                    }
                    String imgurl = "http://localhost:8080/shop/upload" + "/" + randomName;

                    map.put("imgurl", imgurl);

                    IOUtils.copy(fileItem.getInputStream(), new FileOutputStream(
                            new File(parentDir, randomName)));
                    fileItem.delete();
                }

            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        try {
            // 将数据封装到javaBean中
            BeanUtils.populate(product, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        try {
            // 调用service完成添加商品操作
            productService.addProduct(product);
            response.sendRedirect("ProductServlet");
            return;
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("添加商品失败");
            return;
        }


    }
}
