<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	
<body>
    <style>
     .navbar {
        background: rgba(40, 167, 69, 0.9);
        backdrop-filter: blur(10px);
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    }   
    .navbar-nav .nav-link {
        font-weight: bold;
        color: #fff !important;
        position: relative;
        transition: 0.3s ease-in-out;
    }    
    .navbar-nav .nav-link:hover {
        color: #ffc107 !important;
    }   
    .navbar-nav .nav-link::after {
        content: "";
        position: absolute;
        left: 50%;
        bottom: 0;
        width: 0;
        height: 2px;
        background: #ffc107;
        transition: all 0.3s ease-in-out;
        transform: translateX(-50%);
    }   
    .navbar-nav .nav-link:hover::after {
        width: 100%;
    }
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }
    .dark-mode {
        background: rgba(0, 0, 0, 0.9) !important;
        transition: all 0.3s ease-in-out;
    }
    </style>
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">
            <i class="fas fa-clinic-medical"></i> Medi Home
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item px-3">
                    <a class="nav-link active" href="index.jsp">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item px-3">
                    <a class="nav-link active" href="doctor.jsp">
                        <i class="fas fa-user-md"></i> Doctor
                    </a>
                </li>
                <li class="nav-item px-3">
                    <a class="nav-link active" href="view_doctor.jsp">
                        <i class="fas fa-eye"></i> View Doctor
                    </a>
                </li>
                <li class="nav-item px-3">
                    <a class="nav-link active" href="patient.jsp">
                        <i class="fas fa-procedures"></i> Patient
                    </a>
                </li>
            </ul>

            <!-- Admin Dropdown -->
            <div class="dropdown">
                <button class="btn btn-light dropdown-toggle fw-bold" type="button"
                    id="dropdownMenuButton1" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="fas fa-user-shield"></i> Admin
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="<%= request.getContextPath() %>/adminLogout">
                        <i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </div>

            <!-- Dark Mode Toggle -->
            <button id="darkModeToggle" class="btn btn-warning ms-3">
                <i class="fas fa-moon"></i>
            </button>
        </div>
    </div>
</nav>

<!-- Bootstrap JavaScript (Loaded at Bottom for Best Performance) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Force Dropdown to Initialize -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var dropdowns = document.querySelectorAll('.dropdown-toggle');
        dropdowns.forEach(function(dropdown) {
            new bootstrap.Dropdown(dropdown);
        });
    });

    // Dark Mode Toggle
    document.getElementById("darkModeToggle").addEventListener("click", function () {
        document.querySelector("nav").classList.toggle("dark-mode");
    });
</script>
</body>
</html>