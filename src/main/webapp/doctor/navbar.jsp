<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<style> 
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
    .dropdown-menu {
        animation: fadeIn 0.3s ease-in-out;
        border-radius: 10px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    }
	@keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    } 
 	.relate{
 	position: absolute;
 	left: 800px;
 	top:10px;
 	}
   .relative{
   position: absolute;
   left: 400px;
   }
    </style>
    
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fas fa-clinic-medical"></i> Medi Home</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<div class="collapse navbar-collapse relate" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item px-3">
                        <a class="nav-link active" href="index.jsp">
                            <i class="fas fa-home"></i> Home
                        </a>
                    </li>
                    <li class="nav-item px-3">
                        <a class="nav-link active" href="patient.jsp">
                            <i class="fas fa-user-md"></i> Patient
                        </a>
                    </li>


			</ul>
			

			<form class="d-flex relative">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false"><i class="fas fa-user-shield"></i> ${doctObj.fullName}
						
						</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
						<li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>
					</ul>
				</div>
				 
			</form>
		</div>
	</div>
</nav>
</body>
</html>
