package main.java.com.hrm.controller;

import main.java.com.hrm.pojo.User;
import main.java.com.hrm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/toLogin",method = RequestMethod.POST)
    public String toLogin(@RequestBody User user, HttpServletRequest request){
        User user1 = userService.findUser(user);
        if(user1!=null){
            HttpSession session = request.getSession();
            session.setAttribute("user",user1);
            return "success";
        }else {
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/toLogout")
    public String toLogout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "success";
    }

    @RequestMapping(value = "/findAllUser")
    public String finAllUser(int page,HttpServletRequest request){
        int maxResult=10;
        int firstResult=(page-1)*maxResult;
        List<User> userList = userService.selectUserByPage(firstResult, maxResult);
        int userCount = userService.selectUserCount();
        int pageNum;
        if(userCount%10==0){
            pageNum=userCount/10;
        }else{
            pageNum=userCount/10+1;
        }
        request.setAttribute("userList",userList);
        request.setAttribute("pageNum",pageNum);
        request.setAttribute("userCount",userCount);
        request.setAttribute("page",page);
        return "userInformation";
    }

    @ResponseBody
    @RequestMapping(value = "/insertUser")
    public String insertUser(@RequestBody User user){
        int i = userService.insertUser(user);
        if(i>0){
            return "success";
        }else {
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/deleteUser")
    public String deleteUser(@RequestParam("userId") int userId){
        int i = userService.deleteUser(userId);
        if(i>0){
            return "success";
        }else {
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/findUser")
    public User findUser(@RequestParam("userId") int userId){
        User user = userService.findUserById(userId);
        return user;
    }

    @ResponseBody
    @RequestMapping(value = "/updateUser")
    public String updateUser(@RequestBody User user){
        int i = userService.updateUser(user);
        if(i>0){
            return "success";
        }else {
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/updateLocalUser")
    public String updateLocalUser(@RequestBody User user,HttpSession session){
        int i = userService.updateUser(user);
        if(i>0){
            session.setAttribute("user",user);
            return "success";
        }else {
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/editAccount")
    public User editAccount(HttpSession session){
        User user = (User) session.getAttribute("user");
        return user;
    }
}
