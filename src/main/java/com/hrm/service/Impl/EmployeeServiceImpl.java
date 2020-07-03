package main.java.com.hrm.service.Impl;

import main.java.com.hrm.mapper.EmployeeDao;
import main.java.com.hrm.pojo.Employee;
import main.java.com.hrm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public int insertEmployee(Employee employee) {
        return employeeDao.insertEmployee(employee);
    }

    @Override
    public List<Employee> findAllEmployee() {
        return employeeDao.findAllEmployee();
    }

    @Override
    public int selectEmpCount() {
        return employeeDao.selectEmpCount();
    }

    @Override
    public List<Employee> selectEmpByPage(int firstResult, int maxResult) {
        return employeeDao.selectEmpByPage(firstResult,maxResult);
    }

    @Override
    public int deleteEmployee(int empId) {
        return employeeDao.deleteEmployee(empId);
    }

    @Override
    public Employee findEmpById(int empId) {
        return employeeDao.findEmpById(empId);
    }

    @Override
    public int updateEmployee(Employee employee) {
        return employeeDao.updateEmployee(employee);
    }
}
