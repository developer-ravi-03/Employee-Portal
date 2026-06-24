package com.employeeportal.dao;

import com.employeeportal.config.HibernateUtil;
import com.employeeportal.model.Employee;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class EmployeeDao {

    public void saveEmployee(Employee employee) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        Transaction transaction =
                session.beginTransaction();

        session.save(employee);

        transaction.commit();

        session.close();
    }

    public Employee login(String loginId,
                          String password) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        Employee employee =
                session.createQuery(
                        "from Employee where loginId=:loginId and password=:password",
                        Employee.class)
                        .setParameter("loginId", loginId)
                        .setParameter("password", password)
                        .uniqueResult();

        session.close();

        return employee;
    }
    
    public Employee findByLoginId(String loginId) {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        Employee employee =
                session.createQuery(
                        "from Employee where loginId=:loginId",
                        Employee.class)
                        .setParameter("loginId", loginId)
                        .uniqueResult();

        session.close();

        return employee;
    }

    public List<Employee> getAllEmployees() {

        Session session =
                HibernateUtil.getSessionFactory().openSession();

        List<Employee> employees =
                session.createQuery(
                        "from Employee",
                        Employee.class)
                        .list();

        session.close();

        return employees;
    }
}