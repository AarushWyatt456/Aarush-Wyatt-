<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Doctor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            font-family: 'Segoe UI', sans-serif;
            padding: 50px 20px;
        }

        .form-container {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #34495e;
        }

        .form-label {
            font-weight: 600;
        }

        .form-control, .form-select {
            border-radius: 8px;
        }

        .error {
            color: red;
            font-size: 14px;
        }

        .preview-img {
            max-height: 150px;
            border: 1px solid #ccc;
            margin-top: 10px;
            border-radius: 8px;
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
            font-weight: bold;
            border: none;
        }

        .btn-submit:hover {
            background-color: #2980b9;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            margin: 0 10px;
            color: #3498db;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add Doctor</h2>
    <form:form modelAttribute="doctor" method="post" action="${pageContext.request.contextPath}/save-doctor" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Name</label>
            <form:input path="name" cssClass="form-control"/>
            <form:errors path="name" cssClass="error"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Qualification</label>
            <form:input path="qualification" cssClass="form-control"/>
            <form:errors path="qualification" cssClass="error"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Specialist</label>
            <form:input path="specialist" cssClass="form-control"/>
            <form:errors path="specialist" cssClass="error"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Salary</label>
            <form:input path="salary" cssClass="form-control"/>
            <form:errors path="salary" cssClass="error"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Contact</label>
            <form:input path="contact" cssClass="form-control"/>
            <form:errors path="contact" cssClass="error"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <form:input path="email" cssClass="form-control"/>
            <form:errors path="email" cssClass="error"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Gender</label><br/>
            <form:radiobutton path="gender" value="Male"/> Male
            <form:radiobutton path="gender" value="Female"/> Female
            <form:errors path="gender" cssClass="error"/>
        </div>

        <div class="mb-3">
            <label class="form-label">Upload Image</label>
            <input type="file" name="imageFile" class="form-control" accept="image/*" onchange="previewImage(event)">
            <img id="preview" class="preview-img"/>
        </div>

        <div class="mb-3 text-center">
            <input type="submit" class="btn btn-submit px-5" value="Add Doctor"/>
        </div>
    </form:form>

    <div class="links">
        <a href="${pageContext.request.contextPath}/viewemp">← View Doctors</a>
        <a href="${pageContext.request.contextPath}/index.jsp">🏠 Home</a>
    </div>
</div>

<script>
    function previewImage(event) {
        const output = document.getElementById('preview');
        output.src = URL.createObjectURL(event.target.files[0]);
        output.onload = () => URL.revokeObjectURL(output.src);
    }
</script>

</body>
</html>
