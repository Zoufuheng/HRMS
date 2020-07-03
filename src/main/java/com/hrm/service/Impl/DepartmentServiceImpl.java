package main.java.com.hrm.service.Impl;
import main.java.com.hrm.mapper.DepartmentDao;
import main.java.com.hrm.pojo.Department;
import main.java.com.hrm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;


    //查找全部部门信息
    @Override
    public List<Department> findAlldepartment() {
        return departmentDao.selectAlldepartment();
    }

    @Override
    public int insertDepartment(Department department) {
        return departmentDao.insertDepartment(department);
    }

    @Override
    public int deleteById(int departId) {
        return departmentDao.deleteById(departId);
    }

    @Override
    public Department findDepartmentById(int departId) {
        return departmentDao.findDepartmentById(departId);
    }

    @Override
    public int updateDepartment(Department department) {
        return departmentDao.updateDepartment(department);
    }

    @Override
    public List<Department> selectDepartmentByPage(int firstResult, int maxResult) {
        return departmentDao.selectDepartmentByPage(firstResult,maxResult);
    }

    @Override
    public int getDepartCount() {
        return departmentDao.getDepartCount();
    }
}
