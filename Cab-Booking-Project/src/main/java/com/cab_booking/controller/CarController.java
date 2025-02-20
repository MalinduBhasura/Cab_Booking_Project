package com.cab_booking.controller;

//CarController.java
//CarController.java
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cab_booking.model.Car;
import com.cab_booking.service.CarService;

@WebServlet("/car")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
              maxFileSize = 1024 * 1024 * 10,      // 10MB
              maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CarController extends HttpServlet {
 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private CarService carService;

 public CarController() {
     this.carService = new CarService();
 }

 @Override
 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     String action = req.getParameter("action");

     if ("edit".equals(action)) {
         int carId = Integer.parseInt(req.getParameter("carId"));
         try {
             Car car = carService.getCarById(carId);
             req.setAttribute("car", car);
             req.getRequestDispatcher("editCar.jsp").forward(req, resp);
         } catch (SQLException e) {
             e.printStackTrace();
         }
     } else {
         try {
             List<Car> cars = carService.getAllCars();
             req.setAttribute("cars", cars);
             req.getRequestDispatcher("carManage.jsp").forward(req, resp);
         } catch (SQLException e) {
             e.printStackTrace();
         }
     }
 }

 @Override
 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     String action = req.getParameter("action");

     if ("add".equals(action)) {
         // Handle file upload
         Part filePart = req.getPart("carPhoto");
         String fileName = UUID.randomUUID().toString() + "_" + extractFileName(filePart);
         String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
         File uploadDir = new File(uploadPath);
         if (!uploadDir.exists()) {
             uploadDir.mkdir();
         }
         String filePath = uploadPath + File.separator + fileName;
         filePart.write(filePath);

         // Create Car object
         Car car = new Car();
         car.setCarName(req.getParameter("carName"));
         car.setNumberPlate(req.getParameter("numberPlate"));
         car.setAcFarePerKm(Double.parseDouble(req.getParameter("acFarePerKm")));
         car.setNonAcFarePerKm(Double.parseDouble(req.getParameter("nonAcFarePerKm")));
         car.setAcFarePerDay(Double.parseDouble(req.getParameter("acFarePerDay")));
         car.setNonAcFarePerDay(Double.parseDouble(req.getParameter("nonAcFarePerDay")));
         car.setCarPhoto("uploads/" + fileName); // Store relative path
         car.setStatus(req.getParameter("status"));

         try {
             carService.addCar(car);
         } catch (SQLException e) {
             e.printStackTrace();
         }
     } else if ("delete".equals(action)) {
         int carId = Integer.parseInt(req.getParameter("carId"));
         try {
             carService.deleteCar(carId);
         } catch (SQLException e) {
             e.printStackTrace();
         }
     } else if ("update".equals(action)) {
         // Handle file upload
         Part filePart = req.getPart("carPhoto");
         String fileName = UUID.randomUUID().toString() + "_" + extractFileName(filePart);
         String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
         File uploadDir = new File(uploadPath);
         if (!uploadDir.exists()) {
             uploadDir.mkdir();
         }
         String filePath = uploadPath + File.separator + fileName;
         filePart.write(filePath);

         // Create Car object
         Car car = new Car();
         car.setCarId(Integer.parseInt(req.getParameter("carId")));
         car.setCarName(req.getParameter("carName"));
         car.setNumberPlate(req.getParameter("numberPlate"));
         car.setAcFarePerKm(Double.parseDouble(req.getParameter("acFarePerKm")));
         car.setNonAcFarePerKm(Double.parseDouble(req.getParameter("nonAcFarePerKm")));
         car.setAcFarePerDay(Double.parseDouble(req.getParameter("acFarePerDay")));
         car.setNonAcFarePerDay(Double.parseDouble(req.getParameter("nonAcFarePerDay")));
         car.setCarPhoto("uploads/" + fileName); // Store relative path
         car.setStatus(req.getParameter("status"));

         try {
             carService.updateCar(car);
         } catch (SQLException e) {
             e.printStackTrace();
         }
     }

     resp.sendRedirect("car");
 }

 // Extract file name from part
 private String extractFileName(Part part) {
     String contentDisp = part.getHeader("content-disposition");
     String[] items = contentDisp.split(";");
     for (String s : items) {
         if (s.trim().startsWith("filename")) {
             return s.substring(s.indexOf("=") + 2, s.length() - 1);
         }
     }
     return "";
 }
}