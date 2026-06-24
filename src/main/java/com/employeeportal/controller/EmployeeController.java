package com.employeeportal.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.employeeportal.model.Employee;
import com.employeeportal.service.EmployeeService;

import javax.servlet.http.HttpSession;

@Controller
public class EmployeeController {

    private EmployeeService employeeService =
            new EmployeeService();

    @GetMapping("/")
    public String home() {
        return "register";
    }

    @GetMapping("/login")
    public String loginPage(

            @RequestParam(required = false)
            String success,

            @RequestParam(required = false)
            String logout,

            Model model) {

        if(success != null) {

            model.addAttribute(
                    "message",
                    "Registration Successful. Please Login.");
        }

        if(logout != null) {

            model.addAttribute(
                    "message",
                    "Logout Successful. Please Login Again.");
        }

        return "login";
    }

    @PostMapping("/register")
    public String register(

            @RequestParam String name,
            @RequestParam String dob,
            @RequestParam String gender,
            @RequestParam String address,
            @RequestParam String city,
            @RequestParam String state,
            @RequestParam String loginId,
            @RequestParam String password,
            Model model) {

        try {

            Employee existingEmployee =
                    employeeService.findByLoginId(loginId);

            if(existingEmployee != null) {

                model.addAttribute(
                        "error",
                        "Login ID already registered! Please log in.");

                return "register";
            }

            Employee employee = new Employee();

            employee.setName(name);

            employee.setDob(
                    new SimpleDateFormat("yyyy-MM-dd")
                            .parse(dob));

            employee.setGender(gender);
            employee.setAddress(address);
            employee.setCity(city);
            employee.setState(state);
            employee.setLoginId(loginId);
            employee.setPassword(password);

            employeeService.saveEmployee(employee);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/login?success=true";
    }
    

    @PostMapping("/login")
    public String login(
            @RequestParam String loginId,
            @RequestParam String password,
            Model model,
            HttpSession session) {

        Employee employee =
                employeeService.findByLoginId(loginId);

        if(employee == null) {

            model.addAttribute(
                    "error",
                    "User not registered");

            return "login";
        }

        if(!employee.getPassword().equals(password)) {

            model.addAttribute(
                    "error",
                    "Incorrect password");

            return "login";
        }

        session.setAttribute(
                "loggedInUser",
                employee);

        return "redirect:/welcome";
    }
    
    @GetMapping("/welcome")
    public String welcome(
            HttpSession session,
            Model model) {

        Employee employee =
                (Employee) session.getAttribute(
                        "loggedInUser");

        if(employee == null) {

            return "redirect:/login";
        }

        model.addAttribute(
                "employee",
                employee);

        model.addAttribute(
                "employees",
                employeeService.getAllEmployees());

        return "welcome";
    }
    
    @GetMapping("/logout")
    public String logout(
            HttpSession session) {

        session.invalidate();

        return "redirect:/login?logout=true";
    }
}