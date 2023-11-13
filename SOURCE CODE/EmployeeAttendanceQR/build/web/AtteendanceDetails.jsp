<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="QRAttendance.SQLconnection"%>
<%@page import="java.sql.Connection"%>
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
        String presentDays = request.getParameter("presentDays");
        String Empid = request.getParameter("Empid");
        String ename = request.getParameter("ename");
        String designation = request.getParameter("designation");
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
                        <a href="AdminHome.jsp" class="nav-item nav-link">Home</a>
                        <a href="EmployeeActivations.jsp" class="nav-item nav-link">Employee Activations</a>
                        <a href="EmployeeDetails.jsp" class="nav-item nav-link">Employee Details</a>
                        <a href="CheckAttendance.jsp" class="nav-item nav-link active">Check Attendance</a>
                        <a href="AttendanceLogs.jsp" class="nav-item nav-link">Attendance Logs</a>
                    </div>

                    <a href="Logout.jsp" class="btn btn-primary py-2 px-4 ms-3" >Logout</a>
                </div>
            </nav>

            <div class="container-fluid bg-dark py-5" style="margin-bottom: 90px;">
                <div class="row py-5">
                    <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                        <a href="" class="h5 text-white">Total Present Days</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Full Screen Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                    <div class="modal-header border-0">
                        <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <div class="input-group" style="max-width: 600px;">
                            <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                            <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Full Screen Search End -->

        <%
     if (request.getParameter("Success") != null) {%>
        <script>alert('Login Success');</script>  
        <%}
        %>
        <!-- Contact Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                    <h5 class="fw-bold text-primary text-uppercase">Present Days</h5>
                </div>
                <div class="row g-5">
                    <center><div class="col-md-6" data-wow-delay="0.3s">
                            
                                <div class="row g-3">
                                    <label>Employee Id</label>
                                    <div class="col-12">
                                        <input type="text" class="form-control   bg-light px-4 border-primary"  value="<%=Empid%>" placeholder="Name" style="height: 55px;" readonly="">
                                    </div>
                                    <label>Name</label>
                                    <div class="col-12">
                                        <input type="text" class="form-control   bg-light px-4 border-primary" value="<%=ename%>" placeholder="Name" style="height: 55px;"readonly="">
                                    </div>
                                    <label>Designation</label>
                                    <div class="col-12">
                                        <input type="text" class="form-control   bg-light px-4 border-primary"  value="<%=designation%>" placeholder="Name" style="height: 55px;"readonly="">
                                    </div>
                                    <label>Total Present Days</label>
                                    <div class="col-12">
                                        <input type="text" class="form-control  bg-light px-4 border-primary" value="<%=presentDays%>" placeholder="Password" style="height: 55px;"readonly="">
                                    </div>
                                </div>
                           
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