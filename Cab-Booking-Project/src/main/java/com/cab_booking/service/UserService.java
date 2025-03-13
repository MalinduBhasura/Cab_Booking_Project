package com.cab_booking.service;

import com.cab_booking.dao.UserDAO;
import com.cab_booking.model.Admin;
import com.cab_booking.model.Customer;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public boolean authenticateAdmin(Admin admin) {
        return userDAO.authenticateAdmin(admin);
    }

    public Customer authenticateCustomer(String username, String password) {
        return userDAO.authenticateCustomer(username, password);
    }

    public boolean registerCustomer(Customer customer) {
        return userDAO.registerCustomer(customer);
    }
}