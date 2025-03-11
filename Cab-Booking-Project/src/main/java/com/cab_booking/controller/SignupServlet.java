package com.cab_booking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cab_booking.model.Customer;
import com.cab_booking.service.UserService;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Customer customer = new Customer(0, name, email, address, phone, username, password);
        boolean isRegistered = userService.registerCustomer(customer);

        if (isRegistered) {
            response.sendRedirect("signup.jsp?success=true");
        } else {
            response.sendRedirect("signup.jsp?error=true");
        }
    }
}