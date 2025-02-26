package com.cab_booking.dao;

import com.cab_booking.model.Booking;
import com.cab_booking.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class BookingDAO {
    private Connection connection;

    public BookingDAO() {
        this.connection = DatabaseConnection.getInstance().getConnection();
    }

    public int addBooking(Booking booking) throws SQLException {
        String query = "INSERT INTO booking (customer_id, car_id, driver_id, start_date, end_date, car_type, fare, booking_type, estimated_km, total_days, total_amount, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, booking.getCustomerId());
            stmt.setInt(2, booking.getCarId());
            stmt.setInt(3, booking.getDriverId());
            stmt.setDate(4, new java.sql.Date(booking.getStartDate().getTime()));
            stmt.setDate(5, new java.sql.Date(booking.getEndDate().getTime()));
            stmt.setString(6, booking.getCarType());
            stmt.setDouble(7, booking.getFare());
            stmt.setString(8, booking.getBookingType());
            stmt.setInt(9, booking.getEstimatedKm());
            stmt.setInt(10, booking.getTotalDays());
            stmt.setDouble(11, booking.getTotalAmount());
            stmt.setString(12, "Active"); // Default status is Active
           // stmt.setBoolean(12, false); // is_returned is set to FALSE by default
            stmt.executeUpdate();

            // Retrieve the generated booking ID
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1); // Return the generated booking ID
                }
            }
        }
        return -1; // Return -1 if the booking ID could not be retrieved
    }
   
    // Get all bookings for a customer (including returned bookings)
    public List<Booking> getBookingsByCustomerId(int customerId) throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM booking WHERE customer_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setCarId(rs.getInt("car_id"));
                booking.setDriverId(rs.getInt("driver_id"));
                booking.setStartDate(rs.getDate("start_date"));
                booking.setEndDate(rs.getDate("end_date"));
                booking.setCarType(rs.getString("car_type"));
                booking.setFare(rs.getDouble("fare"));
                booking.setBookingType(rs.getString("booking_type"));
                booking.setEstimatedKm(rs.getInt("estimated_km"));
                booking.setTotalDays(rs.getInt("total_days"));
                booking.setTotalAmount(rs.getDouble("total_amount"));
                booking.setStatus(rs.getString("status")); // Fetch status
                bookings.add(booking);
            }
        }
        return bookings;
    }
    public List<Booking> getAllBookings() throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM booking";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setCarId(rs.getInt("car_id"));
                booking.setDriverId(rs.getInt("driver_id"));
                booking.setStartDate(rs.getDate("start_date"));
                booking.setEndDate(rs.getDate("end_date"));
                booking.setCarType(rs.getString("car_type"));
                booking.setFare(rs.getDouble("fare"));
                booking.setBookingType(rs.getString("booking_type"));
                booking.setEstimatedKm(rs.getInt("estimated_km"));
                booking.setTotalDays(rs.getInt("total_days"));
                booking.setTotalAmount(rs.getDouble("total_amount"));
                booking.setStatus(rs.getString("status")); // Fetch status
                
                bookings.add(booking);
            }
        }
        return bookings;
    }
    public void deleteBooking(int bookingId) throws SQLException {
        String query = "DELETE FROM booking WHERE booking_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, bookingId);
            stmt.executeUpdate();
        }
    }

    public void returnBooking(int bookingId) throws SQLException {
        String query = "UPDATE booking SET is_returned = TRUE WHERE booking_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, bookingId);
            stmt.executeUpdate();
        }
    }

    public int getNumberOfBookingsByCustomerId(int customerId) throws SQLException {
        String query = "SELECT COUNT(*) AS count FROM booking WHERE customer_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    public void updateBooking(Booking booking) throws SQLException {
        String query = "UPDATE booking SET total_amount = ?, is_returned = TRUE WHERE booking_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setDouble(1, booking.getTotalAmount());
            stmt.setInt(2, booking.getBookingId());
            stmt.executeUpdate();
        }
    }

 // Get a booking by ID
    public Booking getBookingById(int bookingId) throws SQLException {
        String query = "SELECT * FROM booking WHERE booking_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, bookingId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setCarId(rs.getInt("car_id"));
                booking.setDriverId(rs.getInt("driver_id"));
                booking.setStartDate(rs.getDate("start_date"));
                booking.setEndDate(rs.getDate("end_date"));
                booking.setCarType(rs.getString("car_type"));
                booking.setFare(rs.getDouble("fare"));
                booking.setBookingType(rs.getString("booking_type"));
                booking.setEstimatedKm(rs.getInt("estimated_km"));
                booking.setTotalDays(rs.getInt("total_days"));
                booking.setTotalAmount(rs.getDouble("total_amount"));
                booking.setStatus(rs.getString("status")); // Add status
                return booking;
            }
        }
        return null; // Return null if no booking is found
    }
    
    // Get active bookings for a customer
    public List<Booking> getActiveBookingsByCustomerId(int customerId) throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT * FROM booking WHERE customer_id = ? AND status = 'Active'";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, customerId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setCarId(rs.getInt("car_id"));
                booking.setDriverId(rs.getInt("driver_id"));
                booking.setStartDate(rs.getDate("start_date"));
                booking.setEndDate(rs.getDate("end_date"));
                booking.setCarType(rs.getString("car_type"));
                booking.setFare(rs.getDouble("fare"));
                booking.setBookingType(rs.getString("booking_type"));
                booking.setEstimatedKm(rs.getInt("estimated_km"));
                booking.setTotalDays(rs.getInt("total_days"));
                booking.setTotalAmount(rs.getDouble("total_amount"));
                booking.setStatus(rs.getString("status")); // Add status
                bookings.add(booking);
            }
        }
        return bookings;
    }
    // Mark a booking as returned
    public boolean markBookingAsReturned(int bookingId) throws SQLException {
        String query = "UPDATE booking SET status = 'Returned' WHERE booking_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, bookingId);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Return true if at least one row was updated
        }
    }
    
    public void calculateExtraCharges(int bookingId, Date returnDate) throws SQLException {
        String query = "SELECT start_date, end_date, booking_type, fare, estimated_km, total_days, total_amount FROM booking WHERE booking_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, bookingId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Date startDate = rs.getDate("start_date");
                Date endDate = rs.getDate("end_date");
                String bookingType = rs.getString("booking_type");
                double fare = rs.getDouble("fare");
                int estimatedKm = rs.getInt("estimated_km");
                int totalDays = rs.getInt("total_days");
                double totalAmount = rs.getDouble("total_amount");

                long diffInMillies = returnDate.getTime() - endDate.getTime();
                long diffInDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

                if (diffInDays > 0) {
                    if (bookingType.equals("Per KM")) {
                        int extraKm = (int) (diffInDays * 100); // Assuming 100 km per extra day
                        totalAmount += fare * extraKm * 0.20; // 20% extra for each extra KM
                    } else if (bookingType.equals("Per Day")) {
                        totalAmount += fare * diffInDays * 0.30; // 30% extra for each extra day
                    }
                }

                String updateQuery = "UPDATE booking SET total_amount = ? WHERE booking_id = ?";
                try (PreparedStatement updateStmt = connection.prepareStatement(updateQuery)) {
                    updateStmt.setDouble(1, totalAmount);
                    updateStmt.setInt(2, bookingId);
                    updateStmt.executeUpdate();
                }
            }
        }
    }
}