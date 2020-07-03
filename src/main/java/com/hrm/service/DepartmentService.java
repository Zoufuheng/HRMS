package main.java.com.hrm.service;

import main.java.com.hrm.pojo.Department;

import java.util.List;

public interface DepartmentService {

    //查找全部部门信息
    public List<Department> findAlldepartment();

    //新增部门
    public int insertDepartment(Department department);

    //根据部门编号删除部门
    public int deleteById(int departId);

    //根据部门编号查询部门
    public Department findDepartmentById(int departId);

    //更新部门信息
    public int updateDepartment(Department department);

    //通过页数查找部门信息
    public List<Department> selectDepartmentByPage(int firstResult,int maxResult);

    //获取部门总数
    public int getDepartCount();
}
