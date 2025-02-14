package com.cab_booking.model;







public class Customer {
    private int customerId;
    private String name;
    private String email;
    private String address;
    private String phone;
    private String username;
    private String password;

    // Constructor for login (only username and password)
    public Customer(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // Constructor for full details (used after fetching from the database)
    public Customer(int customerId, String name, String email, String address, String phone, String username, String password) {
        this.customerId = customerId;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
    }

    // Getters and Setters
    public int getCustomerId() {
        return customerId;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

	public void setUsername(String username2) {
		// TODO Auto-generated method stub
		
	}

	public void setName(String name2) {
		// TODO Auto-generated method stub
		
	}

	public void setEmail(String email2) {
		// TODO Auto-generated method stub
		
	}

	public void setAddress(String address2) {
		// TODO Auto-generated method stub
		
	}

	public void setPhone(String phone2) {
		// TODO Auto-generated method stub
		
	}

	public void setPassword(String password2) {
		// TODO Auto-generated method stub
		
	}

	

	
}