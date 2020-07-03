package main.java.com.hrm.service.Impl;

import main.java.com.hrm.mapper.UserDao;
import main.java.com.hrm.pojo.User;
import main.java.com.hrm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findUser(User user) {
        return userDao.findUser(user);
    }

    @Override
    public List<User> findAllUser() {
        return userDao.findAllUser();
    }

    @Override
    public User findUserById(int userId) {
        return userDao.findUserById(userId);
    }

    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public int deleteUser(int userId) {
        return userDao.deleteUser(userId);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public int selectUserCount() {
        return userDao.selectUserCount();
    }

    @Override
    public List<User> selectUserByPage(int firstResult,int maxResult) {
        return userDao.selectUserByPage(firstResult,maxResult);
    }
}
