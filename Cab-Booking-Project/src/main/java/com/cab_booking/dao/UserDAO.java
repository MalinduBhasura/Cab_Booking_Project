package com.cab_booking.dao;





import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.cab_booking.model.Admin;
import com.cab_booking.model.Customer;
import com.cab_booking.util.DatabaseConnection;

public class UserDAO {
    private Connection connection = DatabaseConnection.getInstance().getConnection();

    public boolean authenticateAdmin(Admin admin) {
        String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Customer authenticateCustomer(String username, String password) {
        String query = "SELECT * FROM customer WHERE username = ? AND password = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int customerId = rs.getInt("customer_id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                return new Customer(customerId, name, email, address, phone, username, password);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public boolean registerCustomer(Customer customer) {
        String query = "INSERT INTO customer (name, email, address, phone, username, password) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getAddress());
            ps.setString(4, customer.getPhone());
            ps.setString(5, customer.getUsername());
            ps.setString(6, customer.getPassword());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
