package service;

import pojo.User;

/**
 * @author wyx
 * @version 1.0
 * @date 2020/11/9
 */
public interface UserService {

    /**
     * 用户登录
     * @param user
     * @return
     */
    User Login(User user);

    /**
     * 用户注册
     * @param user
     * @return
     */
    int registerUser(User user);

    /**
     * 修改密码
     * @param user
     * @return
     */
    int resetPassword(User user);

    /**
     * 根据用户id查询用户信息
     * @param id
     * @return
     */
    User queryUserById(Integer id);
}
