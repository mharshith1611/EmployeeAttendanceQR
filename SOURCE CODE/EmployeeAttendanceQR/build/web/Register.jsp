<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Employee Attendance System using QR Code</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
<%
     if (request.getParameter("Success") != null) {%>
    <script>alert('Registration Success');</script>  
    <%}
    %>
    <%
             if (request.getParameter("mailid") != null) {%>
    <script>alert('Mail Id Already Registered');</script>  
    <%}
    %>
    
    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Carousel Start -->
        <div class="container-fluid position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
                <a href="#" class="navbar-brand p-0">
                    <h1 class="m-0"><i class="fa fa-user-tie me-2"></i>QR Attendance</h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="index.jsp" class="nav-item nav-link">Home</a>
                        <a href="Admin.jsp" class="nav-item nav-link">Admin</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Employee</a>
                            <div class="dropdown-menu m-0">
                                <a href="Login.jsp" class="dropdown-item">Login</a>
                                <a href="Register.jsp" class="dropdown-item active">Register</a>
                            </div>
                        </div>
                    </div>

                    <a href="Attendance.jsp" class="btn btn-primary py-2 px-4 ms-3" >Attendance</a>
                </div>
            </nav>

            <div class="container-fluid bg-dark py-5" style="margin-bottom: 90px;">
                <div class="row py-5">
                    <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                        <a href="" class="h5 text-white">Employee Registration Page</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Contact Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                    <h5 class="fw-bold text-primary text-uppercase">Registration Form</h5>
                </div>
                <div class="row g-5">
                    <center><div class="col-md-6" data-wow-delay="0.3s">
                            <form  action="EmpRegister" method="post" enctype="multipart/form-data">
                                <fieldset class="row-fluid">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Employee Name</label>
                                        <input type="text" name="empname" id="first_name" class="form-control  border-primary " placeholder="Employee Name" style="color: black;height: 55px;" required="">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Employee Photo</label>
                                        <input type="file" name="ephoto" id="first_name" class="form-control  border-primary "  style="color: black;height: 55px;" required="">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Father Name</label>
                                        <input type="text" name="fathername" id="first_name" class="form-control  border-primary " placeholder="Father Name" style="color: black;height: 55px;" required="">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Date of Birth</label>
                                        <input type="date" name="dob" id="first_name" class="form-control  border-primary "  style="color: black;height: 55px;" required="">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Email</label>
                                        <input type="email" name="email" id="first_name" class="form-control  border-primary " placeholder="Email" style="color: black;height: 55px;" required="">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Phone Number</label>
                                        <input type="text" name="phone" id="first_name" class="form-control  border-primary " placeholder="Phone Number" style="color: black;height: 55px;" required="">
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Address</label>
                                        <textarea name="address" id="first_name" class="form-control  border-primary " rows="4" placeholder="Address" style="color: black;height: 55px;"  required=""></textarea>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Select The Department</label>
                                        <select class="form-control  border-primary" style="color: black;height: 55px;"  required="" name="dept">
                                            <option value="HR">HR</option>
                                            <option value="IT">IT</option>
                                            <option value="Software Development">Software Development</option>
                                            <option value="Customer Support">Customer Support</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Designation</label>
                                        <input type="text" name="designation" id="first_name" class="form-control  border-primary" placeholder="Designation" style="color: black;height: 55px;" required="">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>Password</label>
                                        <input type="password" name="pass" id="first_name"  class="form-control  border-primary" placeholder="Password" style="color: black;height: 55px;" required="">
                                    </div>
                                    <br>                               
                                    <div class="col-5">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>
                                    </div>
                                </fieldset>
                            </form>
                        </div></center>
                </div>
            </div>
        </div>
        <!-- Contact End -->


        <div class="container-fluid bg-dark text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="row gx-5">
                    <div class="col-lg-4 col-md-6 footer-about">
                    </div>
                    <div class="col-lg-8 col-md-6">
                        <div class="row gx-5">
                            <div class="col-lg-4 col-md-12 pt-5 mb-5">
                            </div>
                            <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                            </div>
                            <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid text-white" style="background: #061429;">
            <div class="container text-center">
                <div class="row">
                    <div class="">
                        <div class="d-flex align-items-center justify-content-center" style="height: 75px;">
                            <p><a class="text-white border-bottom" href="#">Employee Attendance System using QR Code</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>