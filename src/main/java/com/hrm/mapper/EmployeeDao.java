package main.java.com.hrm.mapper;


import main.java.com.hrm.pojo.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeDao {

    //新增员工
    public int insertEmployee(Employee employee);

    //查询所有员工信息
    public List<Employee> findAllEmployee();

    //查询员工总数
    public int selectEmpCount();

    //根据页数查找员工信息
    public List<Employee> selectEmpByPage(int firstResult,int maxResult);

    //根据Id删除员工信息
    public int deleteEmployee(int empId);

    //根据Id查找员工
    public Employee findEmpById(int empId);

    //更新员工信息
    public int updateEmployee(Employee employee);
}
