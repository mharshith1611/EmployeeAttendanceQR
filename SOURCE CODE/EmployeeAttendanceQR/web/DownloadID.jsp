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
    <style>
        .id-card-holder {
            width: 400px;
            padding: 4px;
            margin: 0 auto;
            background-color: #1f1f1f;
            border-radius: 5px;
            position: relative;
        }
       
        .id-card {
            background-color: #fff;
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 1.5px 0px #b9b9b9;
        }
        .id-card img {
            margin: 0 auto;
        }
        .header img {
            width: 100px;
            margin-top: 15px;
        }
        .photo img {
            width: 90px;
            margin-top: 15px;
        }
        h2 {
            font-size: 15px;
            margin: 5px 0;
        }
        h3 {
            font-size: 12px;
            margin: 2.5px 0;
            font-weight: 300;
        }
        .qr-code img {
            width: 250px;
        }
        .id-card-hook {
            background-color: #000;
            width: 70px;
            margin: 0 auto;
            height: 15px;
            border-radius: 5px 5px 0 0;
        }
        .id-card-hook:after {
            content: '';
            background-color: #d7d6d3;
            width: 47px;
            height: 6px;
            display: block;
            margin: 0px auto;
            position: relative;
            top: 6px;
            border-radius: 4px;
        }
        .id-card-tag-strip {
            width: 45px;
            height: 40px;
            background-color: #0950ef;
            margin: 0 auto;
            border-radius: 5px;
            position: relative;
            top: 9px;
            z-index: 1;
            border: 1px solid #0041ad;
        }
        .id-card-tag-strip:after {
            content: '';
            display: block;
            width: 100%;
            height: 1px;
            background-color: #c1c1c1;
            position: relative;
            top: 10px;
        }
        .id-card-tag {
            width: 0;
            height: 0;
            border-left: 100px solid transparent;
            border-right: 100px solid transparent;
            border-top: 100px solid #0958db;
            margin: -10px auto -30px auto;
        }
        .id-card-tag:after {
            content: '';
            display: block;
            width: 0;
            height: 0;
            border-left: 50px solid transparent;
            border-right: 50px solid transparent;
            border-top: 100px solid #d7d6d3;
            margin: -10px auto -30px auto;
            position: relative;
            top: -130px;
            left: -50px;
        }
    </style>
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
                        <a href="EmpHome.jsp" class="nav-item nav-link">Home</a>
                        <a href="EmpAttendanceLogs.jsp" class="nav-item nav-link">Attendance Logs</a>
                        <a href="DownloadID.jsp" class="nav-item nav-link active">Download ID Card</a>
                    </div>

                    <a href="Logout.jsp" class="btn btn-primary py-2 px-4 ms-3" >Logout</a>
                </div>
            </nav>

            <div class="container-fluid bg-dark py-5" style="margin-bottom: 90px;">
                <div class="row py-5">
                    <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                        <a href="" class="h5 text-white">ID Card</a>
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
        <%
            String empid = session.getAttribute("empid").toString();
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM emp_details WHERE empid = '" + empid + "'  ");
            rs.next();
        %>
        <!-- Contact Start -->
        <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5">

                <div class="id-card-tag"></div>
                <div class="id-card-tag-strip"></div>
                <div class="id-card-hook"></div>
                <div class="id-card-holder" id="content">
                    <div class="id-card">
                        <div class="header">
                            <h2>Employee ID Card</h2>
                        </div>
                        <div class="photo">
                            <img src="userpic.jsp?uid=<%=empid%>" width="">
                        </div>
                        <h1><%=rs.getString("ename")%></h1>
                        <h2><%=rs.getString("dept")%></h2>
                        <h3><%=rs.getString("designation")%></h3>
                        <div class="qr-code">
                            <img src="qrpic.jsp?uid=<%=empid%>">
                        </div>
                        <hr>

                    </div>
                </div>
                        <br><br>
                          <center><button class="btn btn-primary text-center"  id="downloadBtn" >Download</button></center>
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
        <script src="js/html2canvas.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script>
    const contentDiv = document.getElementById('content');
    const downloadBtn = document.getElementById('downloadBtn');

    downloadBtn.addEventListener('click', () => {
        html2canvas(contentDiv, {
            scale: 2, // Scale for higher resolution
        }).then(canvas => {
            const dataUrl = canvas.toDataURL('image/jpeg', 0.8);

            const downloadLink = document.createElement('a');
            downloadLink.href = dataUrl;
            downloadLink.download = 'ID Card.png';
            downloadLink.click();
        });
    });

        </script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>