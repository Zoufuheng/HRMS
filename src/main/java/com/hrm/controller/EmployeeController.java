package main.java.com.hrm.controller;


import main.java.com.hrm.pojo.Department;
import main.java.com.hrm.pojo.Employee;
import main.java.com.hrm.pojo.Post;
import main.java.com.hrm.service.DepartmentService;
import main.java.com.hrm.service.EmployeeService;
import main.java.com.hrm.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private PostService postService;

    @ResponseBody
    @RequestMapping(value = "/insertEmployee")
    public String insertEmployee(@RequestBody Employee employee){
        int i = employeeService.insertEmployee(employee);
        if(i>0){
            return "success";
        }else {
            return "error";
        }
    }

    @RequestMapping(value = "/findAllDepartAndPost")
    public String findAllDepartAndPost(HttpServletRequest request){
        List<Department> departmentList = departmentService.findAlldepartment();
        List<Post> postList = postService.selectAllPost();
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("postList",postList);
        return "empInsert";
    }

    @RequestMapping(value = "/findEmpByPage")
    public String findEmpByPage(int page,HttpServletRequest request){
        int maxResult=10;
        int firstResult=(page-1)*maxResult;
        List<Employee> employeeList = employeeService.selectEmpByPage(firstResult, maxResult);
        int empCount = employeeService.selectEmpCount();
        int pageNum;
        if(empCount%10==0){
            pageNum=empCount/10;
        }else{
            pageNum=empCount/10+1;
        }
        List<Department> departmentList = departmentService.findAlldepartment();
        List<Post> postList = postService.selectAllPost();
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("postList",postList);
        request.setAttribute("page",page);
        request.setAttribute("pageNum",pageNum);
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("empCount",empCount);
        return "empInformation";
    }

    @ResponseBody
    @RequestMapping(value = "/deleteEmployee")
    public String deleteEmployee(@RequestParam("empId") int empId){
        int i = employeeService.deleteEmployee(empId);
        if (i>0){
            return "success";
        }else{
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/findEmployee")
    public Employee findEmployee(@RequestParam("empId") int empId){
        Employee employee = employeeService.findEmpById(empId);
        return employee;
    }

    @ResponseBody
    @RequestMapping(value = "/updateEmployee")
    public String updateEmployee(@RequestBody Employee employee){
        int i = employeeService.updateEmployee(employee);
        if(i>0){
            return "success";
        }else {
            return "error";
        }
    }
}
