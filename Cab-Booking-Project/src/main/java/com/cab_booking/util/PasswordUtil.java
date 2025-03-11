package com.cab_booking.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    // Hash a password
    public static String hashPassword(String plainTextPassword) {
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
    }

    // Verify a password
    public static boolean verifyPassword(String plainTextPassword, String hashedPassword) {
        return BCrypt.checkpw(plainTextPassword, hashedPassword);
    }
}