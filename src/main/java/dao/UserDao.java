package dao;

import pojo.User;
import utils.DH;

import java.util.List;

/**
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
public class UserDao {

    /**
     * 用户登录
     * @param user
     * @return
     */
    public User Login(User user){
        String sql="select * from t_user where username=? and password=?";
        String [] args={user.getUsername(),user.getPassword()};
        List list = DH.getall(sql, user, args);
        if (list.size() > 0) {
            return (User) list.get(0);
        } else {
            return null;
        }
    }

    /**
     * 用户注册
     * @param user
     * @return
     */
    public int registerUser(User user){
        String  sql="insert into t_user(username,password,iphone,sex,age,role) values(?,?,?,?,?,?)";
        String [] args={user.getUsername(),user.getPassword(),user.getIphone(),user.getSex()+"",user.getAge()+"",user.getRole()};
        int update = DH.update(sql, args);
        return  update;
    }

    /**
     * 修改密码
     * @param user
     * @return
     */
    public int resetPassword(User user){
        String sql="update t_user set password = ? where uid = ?";
        String [] args={user.getPassword(),user.getUid()+""};
        int update = DH.update(sql, args);
        return  update;
    }

    /**
     * 根据用户id查询用户
     * @param id
     * @return
     */
    public User queryUserById(Integer id){
        String sql="select * from t_user where uid=?";
        String [] args={id+""};

        List getall = DH.getall(sql, new User(), args);
        if (getall.size()>0){
            return (User) getall.get(0);
        }else{
            return null;
        }
    }
}
