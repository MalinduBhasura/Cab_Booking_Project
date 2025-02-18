<form action="${pageContext.request.contextPath}/AdminDashboard/driver" method="post">
    <input type="hidden" name="action" value="add">
    <div class="mb-3">
        <label for="driverName" class="form-label">Driver Name</label>
        <input type="text" class="form-control" id="driverName" name="driverName" required>
    </div>
    <div class="mb-3">
        <label for="status" class="form-label">Status</label>
        <select class="form-control" id="status" name="status" required>
            <option value="available">Available</option>
            <option value="booked">Booked</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="phone" class="form-label">Phone</label>
        <input type="text" class="form-control" id="phone" name="phone" required>
    </div>
    <div class="mb-3">
        <label for="address" class="form-label">Address</label>
        <input type="text" class="form-control" id="address" name="address" required>
    </div>
    <button type="submit" class="btn btn-primary">Add Driver</button>
</form>