package utils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import pojo.Product;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 上传工具类
 * @author wyx
 * @version 1.0
 * @date 2020/11/21
 */
public class UploadUntils {

    public  static Map upload(HttpServletRequest request, Product product, HttpServlet servlet){
        Map<String, String> map = new HashMap<>();

        DiskFileItemFactory dFIFactory = new DiskFileItemFactory();
        //设置临时文件存储的位置
        dFIFactory.setRepository(new File(servlet.getServletContext().getRealPath("/temp")));
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
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }
}
