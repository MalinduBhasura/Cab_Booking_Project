package com.cab_booking.controller;





import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cab_booking.model.Admin;
import com.cab_booking.model.Customer;
import com.cab_booking.service.UserService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if it's an admin
        Admin admin = new Admin(username, password);
        boolean isAdmin = userService.authenticateAdmin(admin);

        if (isAdmin) {
            HttpSession session = request.getSession();
            session.setAttribute("user", admin);
            response.sendRedirect("adminDashboard.jsp");
        } else {
            // Check if it's a customer
            Customer authenticatedCustomer = userService.authenticateCustomer(username, password);

            if (authenticatedCustomer != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", authenticatedCustomer);
                response.sendRedirect("customerDashboard.jsp");
            } else {
                response.sendRedirect("login.jsp?error=1");
            }
        }
    }
}