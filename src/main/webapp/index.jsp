<!DOCTYPE html>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="UTF-8">
<title>MediCare</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="component/navbar.jsp" %>
<body>
    <style>
        .one{
        font-size:20px;
        padding: 15px;
        }
        .one a{
        color:white;
        }
        
        </style>
 <%Connection conn=DBConnect.getConn();
 out.print(conn);
 %>                  
            <div id="autoCarousel" class="carousel slide col-lg-12 col-md-6" data-bs-ride="carousel" data-bs-interval="2000">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/doctor.jpg" class="d-block w-100" alt="Image 1">
                    </div>
                    <div class="carousel-item">
                        <img src="images/doctor2.jpg" class="d-block w-100" alt="Image 2">
                    </div>
                    <div class="carousel-item">
                        <img src="images/doctor3.jpg" class="d-block w-100" alt="Image 3">
                    </div>
                </div>
                <div class="carousel-caption d-none d-md-block">
                  <h2 class="bg-dark text-white p-2 rounded">Expert Medical Care</h2>
              </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#autoCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#autoCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

            <div class="container text-center my-4 col-lg-12 col-md-6">
              <h1 class="text-primary fw-bold">Welcome to MediCare</h1>
              <p class="lead">Your health is our priority. Book appointments, consult doctors, and get the best healthcare services.</p>
              <a href="user_appointment.jsp" class="btn btn-danger btn-lg">Book an Appointment</a>
          </div>
          
          <div class="container text-center my-5 col-lg-12 col-md-6">
            <div class="row">
                <div class="col-md-4">
                    <h2 class="text-primary counter" data-target="5000">0</h2>
                    <p>Happy Patients</p>
                </div>
                <div class="col-md-4">
                    <h2 class="text-danger counter" data-target="250">0</h2>
                    <p>Doctors</p>
                </div>
                <div class="col-md-4">
                    <h2 class="text-success counter" data-target="10000">0</h2>
                    <p>Appointments Completed</p>
                </div>
            </div>
        </div>
        
        <script>
            const counters = document.querySelectorAll('.counter');
            counters.forEach(counter => {
                counter.innerText = '0';
                const updateCounter = () => {
                    const target = +counter.getAttribute('data-target');
                    const count = +counter.innerText;
                    const speed = target / 200;
                    if (count < target) {
                        counter.innerText = Math.ceil(count + speed);
                        setTimeout(updateCounter, 20);
                    } else {
                        counter.innerText = target;
                    }
                };
                updateCounter();
            });
        </script>
        
        <button class="btn btn-primary position-fixed bottom-0 end-0 m-3 p-3 rounded-circle shadow-lg">
          <i class="fa fa-comment-dots fa-lg"></i>
      </button>

    <button onclick="topFunction()" id="scrollTopBtn" class="btn btn-warning position-fixed bottom-0 start-0 m-3 p-3 shadow-lg">
      <i class="fa fa-arrow-up"></i>
  </button>
  
  <script>
      let mybutton = document.getElementById("scrollTopBtn");
      window.onscroll = function() {scrollFunction()};
      function scrollFunction() {
          if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
              mybutton.style.display = "block";
          } else {
              mybutton.style.display = "none";
          }
      }
      function topFunction() {
          window.scrollTo({top: 0, behavior: 'smooth'});
      }
  </script>

<div class="container-fluid bg-primary text-white text-center p-5">
  <h2>Need Medical Assistance?</h2>
  <p>Book an appointment with our expert doctors today!</p>
  <a href="user_appointment.jsp" class="btn btn-light btn-lg">Schedule Now</a>
</div>

           <div class="container my-5">
              <div class="row">
                  <div class="col-md-4">
                      <div class="card shadow">
                          <i class="fa-solid fa-stethoscope fa-3x text-center mt-3 text-primary"></i>
                          <div class="card-body">
                              <h5 class="card-title text-center">Specialist Doctors</h5>
                              <p class="card-text text-center">Consult top medical experts across various fields.</p>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <div class="card shadow">
                          <i class="fa-solid fa-briefcase-medical fa-3x text-center mt-3 text-danger"></i>
                          <div class="card-body">
                              <h5 class="card-title text-center">24/7 Emergency</h5>
                              <p class="card-text text-center">We provide round-the-clock emergency services.</p>
                          </div>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <div class="card shadow">
                          <i class="fa-solid fa-user-md fa-3x text-center mt-3 text-success"></i>
                          <div class="card-body">
                              <h5 class="card-title text-center">Online Consultation</h5>
                              <p class="card-text text-center">Book video consultations with top doctors from home.</p>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          
          <div class="container my-5">
            <h3 class="text-center">What Our Patients Say</h3>
            <div id="autoCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2000">
                <div class="carousel-inner">
                    <div class="carousel-item active text-center">
                        <p class="fs-5 fst-italic">"Great service and friendly doctors!"</p>
                        <h5>- John Doe</h5>
                    </div>
                    <div class="carousel-item text-center">
                        <p class="fs-5 fst-italic">"I felt so comfortable and well cared for."</p>
                        <h5>- Sarah Smith</h5>
                    </div>
                    <div class="carousel-item text-center">
                        <p class="fs-5 fst-italic">"Highly recommend this hospital to everyone."</p>
                        <h5>- Mark Wilson</h5>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>
        </div>
        
        <div class="container text-center my-5">
          <h2>Contact Us</h2>
          <p>Email: contact@medicare.com | Phone: +91 9876543210</p>
      </div>
      
      <div class="container text-center my-5">
        <h3>Special Discount on Full Body Checkups!</h3>
        <p>Offer ends in:</p>
        <h2 id="countdown"></h2>
    </div>
    
    <script>
        let countDownDate = new Date("Feb 15, 2025 23:59:59").getTime();
        let x = setInterval(() => {
            let now = new Date().getTime();
            let distance = countDownDate - now;
            let days = Math.floor(distance / (1000 * 60 * 60 * 24));
            let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            let seconds = Math.floor((distance % (1000 * 60)) / 1000);
            document.getElementById("countdown").innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s ";
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("countdown").innerHTML = "Expired";
            }
        }, 1000);
    </script>
    
    <div class="container-fluid p-3 bg-dark text-white text-center">
              <p>&copy; 2025 MediCare. All Rights Reserved.</p>
              <p>
                  <a href="#" class="text-white mx-2"><i class="fa-brands fa-facebook fa-lg"></i></a>
                  <a href="#" class="text-white mx-2"><i class="fa-brands fa-twitter fa-lg"></i></a>
                  <a href="#" class="text-white mx-2"><i class="fa-brands fa-instagram fa-lg"></i></a>
              </p>
          </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
            
          
</body>
</html>