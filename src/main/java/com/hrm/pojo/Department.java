package main.java.com.hrm.pojo;

public class Department {
    private int departId;
    private String departName;
    private String departManager;
    private String departPhone;

    public String getDepartPhone() {
        return departPhone;
    }

    public void setDepartPhone(String departPhone) {
        this.departPhone = departPhone;
    }

    public int getDepartId() {
        return departId;
    }

    public void setDepartId(int departId) {
        this.departId = departId;
    }

    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }

    public String getDepartManager() {
        return departManager;
    }

    public void setDepartManager(String departManager) {
        this.departManager = departManager;
    }
}
