package main.java.com.hrm.controller;

import main.java.com.hrm.mapper.DepartmentDao;
import main.java.com.hrm.pojo.Department;
import main.java.com.hrm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "/findAlldepartment")
    public String findAlldepartment(HttpServletRequest request,int page){
        int maxResult=10;
        int firstResult=(page-1)*maxResult;
        List<Department> departmentList = departmentService.selectDepartmentByPage(firstResult,maxResult);
        int count=departmentService.getDepartCount();
        int pageNum;
        if(count%10==0){
            pageNum=count/10;
        }else {
            pageNum=(count/10)+1;
        }
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("count",count);
        request.setAttribute("pageNum",pageNum);
        request.setAttribute("page",page);
        return "departResearch";
    }

    @ResponseBody
    @RequestMapping(value = "/insertDepartment")
    public String insertDepartment(@RequestBody Department department){
        int i = departmentService.insertDepartment(department);
        if(i>0){
            return "success";
        }else{
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/deleteDepartment")
    public String deleteDepartment(@RequestParam("departId") int departId){
        int i = departmentService.deleteById(departId);
        if (i>0){
            return "success";
        }else{
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/editDepartment")
    public Department editDepartment(@RequestParam("departId") int departId){
        Department department = departmentService.findDepartmentById(departId);
        return department;
    }

    @ResponseBody
    @RequestMapping(value = "/updateDepartment")
    public String updateDepartment(@RequestBody Department department){
        int i = departmentService.updateDepartment(department);
        if (i>0){
            return "success";
        }else {
            return "error";
        }
    }
}
