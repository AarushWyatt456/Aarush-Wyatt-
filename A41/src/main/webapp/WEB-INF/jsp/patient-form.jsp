<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="beans.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || (!user.getRole().equals("admin") && !user.getRole().equals("doctor"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Form</title>
    <style>
        /* Add your styles here */
    </style>
</head>
<body>
    <h1>${patient == null ? 'Add New' : 'Edit'} Patient</h1>
    
    <form action="patient" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="${patient == null ? 'add' : 'update'}">
        <c:if test="${patient != null}">
            <input type="hidden" name="id" value="${patient.id}">
        </c:if>
        
        <div class="form-group">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" value="${patient.name}" required>
        </div>
        
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male" ${patient.gender == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${patient.gender == 'Female' ? 'selected' : ''}>Female</option>
                <option value="Other" ${patient.gender == 'Other' ? 'selected' : ''}>Other</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" value="${patient.dob}" required>
        </div>
        
        <div class="form-group">
            <label for="contact">Contact Number:</label>
            <input type="tel" id="contact" name="contact" value="${patient.contact}" required>
        </div>
        
        <div class="form-group">
            <label for="address">Address:</label>
            <textarea id="address" name="address" required>${patient.address}</textarea>
        </div>
        
        <div class="form-group">
            <label for="blood_group">Blood Group:</label>
            <select id="blood_group" name="blood_group">
                <option value="">Unknown</option>
                <option value="A+" ${patient.bloodGroup == 'A+' ? 'selected' : ''}>A+</option>
                <option value="A-" ${patient.bloodGroup == 'A-' ? 'selected' : ''}>A-</option>
                <option value="B+" ${patient.bloodGroup == 'B+' ? 'selected' : ''}>B+</option>
                <option value="B-" ${patient.bloodGroup == 'B-' ? 'selected' : ''}>B-</option>
                <option value="AB+" ${patient.bloodGroup == 'AB+' ? 'selected' : ''}>AB+</option>
                <option value="AB-" ${patient.bloodGroup == 'AB-' ? 'selected' : ''}>AB-</option>
                <option value="O+" ${patient.bloodGroup == 'O+' ? 'selected' : ''}>O+</option>
                <option value="O-" ${patient.bloodGroup == 'O-' ? 'selected' : ''}>O-</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="profile_pic">Profile Picture:</label>
            <input type="file" id="profile_pic" name="profile_pic" accept="image/*">
            <c:if test="${patient != null && patient.profilePic != null}">
                <p>Current photo:</p>
                <img src="patient-photo?id=${patient.id}" width="100" height="100">
            </c:if>
        </div>
        
        <button type="submit">Save</button>
    </form>
</body>
</html>