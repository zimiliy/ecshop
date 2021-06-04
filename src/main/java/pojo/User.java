package pojo;

/**
 * 用户实体类
 * @author wyx
 * @version 1.0
 * @date 2020/11/9
 */
public class User {
    private  Integer uid;
    private  String username;
    private  String password;
    private  String iphone;
    private  Integer sex;
    private  Integer age;
    private  String role;

    public User() {
    }

    public User(Integer uid, String username, String password, String iphone, Integer sex, Integer age, String role) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.iphone = iphone;
        this.sex = sex;
        this.age = age;
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIphone() {
        return iphone;
    }

    public void setIphone(String iphone) {
        this.iphone = iphone;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", iphone='" + iphone + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                '}';
    }
}
