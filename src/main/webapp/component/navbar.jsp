<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.one{
font-size:20px;
padding: 15px;
}
.one a{
color:white;
}
.nav-link {
  text-decoration: none;
  color: #031D44;
  padding: 20px 0px;
  margin: 0px 20px;
  display: inline-block;
  position: relative;
  opacity: 0.75;
}
.one a:hover {
  opacity: 1;
}
.one a::before {
  transition: 300ms;
  height: 5px;
  content: "";
  position: absolute;
  background-color: #ff0b0b;
}
.one a::before {
  width: 0%;
  bottom: 10px;
}

.one a:hover::before {
  width: 100%;
}
.one a::before {
  width: 100%;
  bottom: 5px;
  opacity: 0;
}
.one a:hover::before {
  bottom: 10px;
  opacity: 1;
}
.one a::before {
  height: 0%;
  width: 100%;
  bottom: 0px;
}
.one a:hover::before {
  height: 5px;
}
.navbar{
    border-radius: 15px;
}
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</style>

<header class="sticky-top">
                <nav class="navbar  navbar-dark bg-primary navbar-expand-lg">
                    <div class="container">
                        <a class="navbar-brand text-light fs-1 fw-bold " href="index.jsp"><i class="fa-solid fa-hospital-user"></i></i>MediCare</a>
                        <button class="navbar-toggler bg-warning" type="button" data-bs-toggle="collapse" data-bs-target="#navbar"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse " id="navbar">
                        <ul class="navbar-nav ms-auto body">
                        
                        <c:if test="${empty userObj }">
                        <li class="nav-item one"><a class="nav-link"  href="admin_login.jsp"><i class="fa-solid fa-right-to-bracket"></i>Admin</a></li>
                            <li class="nav-item one"><a class="nav-link" href="doctor_login.jsp"><i class="fa-solid fa-user-doctor"></i>Doctor</a></li>
                            <li class="nav-item one"><a class="nav-link" href="user_login.jsp"><i class="fa-solid fa-user"></i>User</a></li>
                          	<li class="nav-item one"><a class="nav-link" href="./medi/med.jsp "><i class="fa-solid fa-capsules"></i>Book Medicine</a></li>
                        </c:if>
                          
                 
<c:if test="${not empty userObj}">
<li class="nav-item one"><a class="nav-link"href="user_appointment.jsp">Appointment</a></li>
<li class="nav-item one"><a class="nav-link"href="view_appointment.jsp">View Appointment</a></li>

<li class="nav-item active dropdown  mt-3 fs-5 ">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <i class="fa-solid fa-circle-user"></i>${userObj.fullName}</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
            <li><a class="dropdown-item" href="userLogout">Logout</a></li>
          </ul>
</li>
</c:if>
                         
            </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        </nav>
    </header>