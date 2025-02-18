package com.cab_booking.controller;



import com.cab_booking.service.CarService;
import com.cab_booking.model.Car;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet("/car")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CarController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CarService carService = new CarService();
    private static final String UPLOAD_DIR = "uploads"; // Directory to store uploaded images

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
   
        
    	
    	String action = request.getParameter("action");

        if (action == null) {
            // Fetch cars from the database every time
            List<Car> cars = carService.getAllCars();
            request.setAttribute("cars", cars); // Set the cars list as a request attribute
            request.getRequestDispatcher("carManage.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            // Edit car
            int carId = Integer.parseInt(request.getParameter("carId"));
            request.setAttribute("car", carService.getAllCars().stream()
                    .filter(c -> c.getCarId() == carId)
                    .findFirst()
                    .orElse(null));
            request.getRequestDispatcher("carEdit.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            // Delete car
            int carId = Integer.parseInt(request.getParameter("carId"));
            carService.deleteCar(carId);
            response.sendRedirect("car"); // Redirect to the car management page
        }
    }
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("add")) {
            // Add new car
            Car car = new Car();
            car.setModelName(request.getParameter("modelName"));

            // Handle file upload
            Part filePart = request.getPart("carPhoto");
            String fileName = UUID.randomUUID().toString() + "_" + extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            filePart.write(uploadPath + File.separator + fileName);

            car.setCarPhoto(UPLOAD_DIR + File.separator + fileName);
            car.setStatus(request.getParameter("status"));
            carService.addCar(car);
        } else if (action.equals("update")) {
            // Update car
            Car car = new Car();
            car.setCarId(Integer.parseInt(request.getParameter("carId")));
            car.setModelName(request.getParameter("modelName"));

            // Handle file upload
            Part filePart = request.getPart("carPhoto");
            if (filePart.getSize() > 0) { // If a new file is uploaded
                String fileName = UUID.randomUUID().toString() + "_" + extractFileName(filePart);
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                filePart.write(uploadPath + File.separator + fileName);
                car.setCarPhoto(UPLOAD_DIR + File.separator + fileName);
            } else { // If no new file is uploaded, keep the existing photo
                car.setCarPhoto(request.getParameter("existingPhoto"));
            }

            car.setStatus(request.getParameter("status"));
            carService.updateCar(car);
        }

        response.sendRedirect("car");
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
