package com.cab_booking.dao;

import com.cab_booking.model.Car;
import com.cab_booking.model.Driver;
import com.cab_booking.util.DatabaseConnection;

public class DaoFactory {
    public static CarDAO getCarDao() {
        return new CarDAO(DatabaseConnection.getInstance().getConnection());
    }

    public static DriverDAO getDriverDao() {
        return new DriverDAO(DatabaseConnection.getInstance().getConnection());
    }
    public static BookingDAO getBookingDao() {
        return new BookingDAO(DatabaseConnection.getInstance().getConnection());
    }
}