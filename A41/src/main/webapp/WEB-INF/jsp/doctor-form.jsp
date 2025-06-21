<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>
        <c:choose>
            <c:when test="${doctor.id == 0}">Add Doctor</c:when>
            <c:otherwise>Edit Doctor</c:otherwise>
        </c:choose>
    </title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #eef2f7;
            padding: 50px;
        }
        .form-wrapper {
            background: #ffffff;
            max-width: 700px;
            margin: auto;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #444;
        }
        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="email"],
        .form-group input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .form-group .error {
            color: red;
            font-size: 12px;
        }
        .form-group .gender-options {
            margin-top: 6px;
        }
        .form-group .gender-options label {
            margin-right: 15px;
        }
        .form-group img {
            max-height: 150px;
            display: block;
            margin-top: 10px;
            border-radius: 8px;
        }
        .form-actions {
            text-align: center;
            margin-top: 30px;
        }
        .form-actions input[type="submit"] {
            padding: 12px 30px;
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .form-actions input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            color: #007bff;
            text-decoration: none;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-wrapper">
    <h2>
        <c:choose>
            <c:when test="${doctor.id == 0}">Add New Doctor</c:when>
            <c:otherwise>Edit Doctor</c:otherwise>
        </c:choose>
    </h2>

    <form:form method="post"
               modelAttribute="doctor"
               action="${pageContext.request.contextPath}${doctor.id == 0 ? '/save-doctor' : '/update-doctor'}"
               enctype="multipart/form-data">

        <form:hidden path="id"/>

        <div class="form-group">
            <label>Name:</label>
            <form:input path="name"/>
            <form:errors path="name" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Qualification:</label>
            <form:input path="qualification"/>
            <form:errors path="qualification" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Specialist:</label>
            <form:input path="specialist"/>
            <form:errors path="specialist" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Salary:</label>
            <form:input path="salary" type="number" step="0.01"/>
            <form:errors path="salary" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Contact:</label>
            <form:input path="contact"/>
            <form:errors path="contact" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <form:input path="email"/>
            <form:errors path="email" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Gender:</label>
            <div class="gender-options">
                <form:radiobutton path="gender" value="Male"/> Male
                <form:radiobutton path="gender" value="Female"/> Female
            </div>
            <form:errors path="gender" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Upload Image:</label>
            <input type="file" name="imageFile" accept="image/*" onchange="previewImage(event)"/>
            <c:if test="${not empty base64Image}">
                <img id="preview" src="data:image/jpeg;base64,${base64Image}" alt="Doctor Image"/>
            </c:if>
            <c:if test="${empty base64Image}">
                <img id="preview" style="display:none;" alt="No image"/>
            </c:if>
        </div>

        <div class="form-actions">
            <input type="submit"
                   value="<c:out value='${doctor.id == 0 ? "Save Doctor" : "Update Doctor"}'/>"/>
        </div>

    </form:form>

    <div class="back-link">
        <a href="${pageContext.request.contextPath}/viewemp">← Back to Doctor List</a>
    </div>
</div>

<script>
    function previewImage(event) {
        const output = document.getElementById('preview');
        output.src = URL.createObjectURL(event.target.files[0]);
        output.style.display = 'block';
        output.onload = function () {
            URL.revokeObjectURL(output.src);
        }
    }
</script>

</body>
</html>
