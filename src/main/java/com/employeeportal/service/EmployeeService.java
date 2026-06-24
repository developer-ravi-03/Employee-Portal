package com.employeeportal.service;

import com.employeeportal.dao.EmployeeDao;
import com.employeeportal.model.Employee;

import java.util.List;

public class EmployeeService {

    private EmployeeDao employeeDao =
            new EmployeeDao();

    public void saveEmployee(Employee employee) {
        employeeDao.saveEmployee(employee);
    }

    public Employee login(String loginId,
                          String password) {

        return employeeDao.login(loginId,password);
    }

    public Employee findByLoginId(String loginId) {

        return employeeDao.findByLoginId(loginId);
    }

    public List<Employee> getAllEmployees() {

        return employeeDao.getAllEmployees();
    }
}