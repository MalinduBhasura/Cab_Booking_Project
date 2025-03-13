package com.cab_booking.controller;

import com.cab_booking.model.Booking;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/downloadInvoice")
public class DownloadInvoiceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the booking details from the session
        HttpSession session = request.getSession();
        Booking booking = (Booking) session.getAttribute("booking");

        // Debug: Print booking details to the console
        System.out.println("Booking Object from Session: " + booking);

        if (booking == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Booking details not found in session.");
            return;
        }

        // Set response content type to PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"invoice.pdf\"");

        // Create a PDF document
        Document document = new Document();
        try (OutputStream out = response.getOutputStream()) {
            PdfWriter.getInstance(document, out);
            document.open();

            // Add content to the PDF
            document.add(new Paragraph("Mega City Cab - Booking Invoice"));
            document.add(new Paragraph("----------------------------------"));
            document.add(new Paragraph("Booking ID: " + booking.getBookingId()));
            document.add(new Paragraph("Customer ID: " + booking.getCustomerId()));
            document.add(new Paragraph("Car ID: " + booking.getCarId()));
            document.add(new Paragraph("Driver ID: " + booking.getDriverId()));
            document.add(new Paragraph("Start Date: " + booking.getStartDate()));
            document.add(new Paragraph("End Date: " + booking.getEndDate()));
            document.add(new Paragraph("Car Type: " + booking.getCarType()));
            document.add(new Paragraph("Fare: Rs. " + booking.getFare()));
            document.add(new Paragraph("Booking Type: " + booking.getBookingType()));
            document.add(new Paragraph("Estimated KM: " + booking.getEstimatedKm()));
            document.add(new Paragraph("Total Days: " + booking.getTotalDays()));
            document.add(new Paragraph("Total Amount: Rs. " + booking.getTotalAmount()));
            document.add(new Paragraph("----------------------------------"));
            document.add(new Paragraph("Thank you for choosing Mega City Cab!"));

            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating PDF");
        }
    }
}