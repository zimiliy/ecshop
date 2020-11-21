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

    int resetPassword(User user);
}
