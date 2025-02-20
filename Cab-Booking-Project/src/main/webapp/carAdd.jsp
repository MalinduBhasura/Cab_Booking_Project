<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Car</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-container label {
            font-weight: bold;
        }
        .form-container .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="form-container">
                    <h1 class="text-center">Add New Car</h1>
                    <form action="car" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                        <input type="hidden" name="action" value="add">
                        <div class="mb-3">
                            <label for="carName" class="form-label">Car Name:</label>
                            <input type="text" class="form-control" id="carName" name="carName" required>
                        </div>
                        <div class="mb-3">
                            <label for="numberPlate" class="form-label">Number Plate:</label>
                            <input type="text" class="form-control" id="numberPlate" name="numberPlate" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="acFarePerKm" class="form-label">AC Fare Per Km:</label>
                                <input type="number" step="0.01" class="form-control" id="acFarePerKm" name="acFarePerKm" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="nonAcFarePerKm" class="form-label">Non-AC Fare Per Km:</label>
                                <input type="number" step="0.01" class="form-control" id="nonAcFarePerKm" name="nonAcFarePerKm" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="acFarePerDay" class="form-label">AC Fare Per Day:</label>
                                <input type="number" step="0.01" class="form-control" id="acFarePerDay" name="acFarePerDay" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="nonAcFarePerDay" class="form-label">Non-AC Fare Per Day:</label>
                                <input type="number" step="0.01" class="form-control" id="nonAcFarePerDay" name="nonAcFarePerDay" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="carPhoto" class="form-label">Car Photo:</label>
                            <input type="file" class="form-control" id="carPhoto" name="carPhoto" required>
                        </div>
                        <div class="mb-3">
                            <label for="status" class="form-label">Status:</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="available">Available</option>
                                <option value="booked">Booked</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="car" class="btn btn-secondary mt-3 w-100">Back to Car Management</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>