package com.cab_booking.model;

public class Admin extends User {
    private int admin_id;

    public Admin(String username, String password) {
        super(username, password);
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
}