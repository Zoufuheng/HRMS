package main.java.com.hrm.service;

import main.java.com.hrm.pojo.User;

import java.util.List;

public interface UserService {

    //查询用户是否存在
    public User findUser(User user);

    //查找所有的用户
    public List<User> findAllUser();

    //根据用户ID查找用户
    public User findUserById(int userId);

    //添加管理员
    public int insertUser(User user);

    //根据ID删除管理员
    public int deleteUser(int userId);

    //更新管理员信息
    public int updateUser(User user);

    //获取管理员总数
    public int selectUserCount();

    //根据页数查找管理员
    public List<User> selectUserByPage(int firstResult,int maxResult);
}
