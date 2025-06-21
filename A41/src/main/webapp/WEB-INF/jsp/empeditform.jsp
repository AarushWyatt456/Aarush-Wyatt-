<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Doctor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f8;
            font-family: 'Segoe UI', sans-serif;
            padding: 50px 20px;
        }

        .form-container {
            background: #fff;
            padding: 40px;
            max-width: 750px;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: 600;
            color: #34495e;
        }

        .form-control {
            border-radius: 8px;
        }

        .error {
            color: red;
            font-size: 13px;
        }

        .preview-img {
            max-height: 150px;
            display: block;
            margin-top: 10px;
            border-radius: 10px;
        }

        .btn-update {
            background-color: #20c997;
            color: white;
            border: none;
            font-weight: bold;
        }

        .btn-update:hover {
            background-color: #17a589;
        }

        .links {
            text-align: center;
            margin-top: 25px;
        }

        .links a {
            margin: 0 10px;
            text-decoration: none;
            color: #20c997;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Edit Doctor</h2>
    <form:form modelAttribute="doctor" method="post" action="${pageContext.request.contextPath}/update-doctor" enctype="multipart/form-data">
        <form:hidden path="id"/>

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
            <label class="form-label">Replace Image</label>
            <input type="file" name="imageFile" class="form-control" accept="image/*" onchange="previewImage(event)">
            <c:if test="${not empty doctor.base64Image}">
                <img id="preview" src="data:image/jpeg;base64,${doctor.base64Image}" class="preview-img"/>
            </c:if>
        </div>

        <div class="text-center">
            <input type="submit" value="Update Doctor" class="btn btn-update px-5"/>
        </div>
    </form:form>

    <div class="links">
        <a href="${pageContext.request.contextPath}/viewemp">← Back to List</a>
        <a href="${pageContext.request.contextPath}/index.jsp">🏠 Home</a>
    </div>
</div>

<script>
    function previewImage(event) {
        const preview = document.getElementById('preview');
        preview.src = URL.createObjectURL(event.target.files[0]);
        preview.onload = () => URL.revokeObjectURL(preview.src);
    }
</script>

</body>
</html>
