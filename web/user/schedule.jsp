<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ page import="java.io.*" %>
        <%@ page import="javax.servlet.*" %>
        <%@ page import="javax.servlet.http.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.util.*" %><%@ page import="java.time.*" %>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Bussing</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/logo.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <% String from = request.getParameter("from");
        String to = request.getParameter("to");
        String time = request.getParameter("time");
        if(to == from) {
            response.sendRedirect("home.jsp?error=Invalid input!");
        }
        
        %>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">Bussing</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="redeem.jsp">Redeem</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Account</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/E-commerce-Assignment-GUI/Logout">Logout</a></li>

                            </ul>
                        </li>
                    </ul>
                    <form method="get" action="search.jsp" style="margin-right: 30px;">
                    <input type="text" name="id" placeholder="Search...">
                    <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                    
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-info py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Check your bus schedule here!</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Let's support our public transport for the sake of our environment!</p>
                </div>
            </div>
        </header>
        <!-- Section-->

        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"></h5>
                                    <!-- Product price-->
                                    <form method="get" action="schedule.jsp">
                                        <label for="from" class="mb-3">From?</label>
                                    <select id="from" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">        
                                        <option value="Tuaran">Tuaran</option>
                                        <option value="Tamparuli">Tamparuli</option>
                                        <option value="Telipok">Telipok</option>
                                        <option value="Menggatal">Menggatal</option>
                                        <option value="Inanam">Inanam</option>
                                        <option value="Likas">Likas</option>
                                        <option value="Kota Kinabalu">Kota Kinabalu</option>
                                    </select>
                                    <label class="mb-3" for="to">To?</label>
                                    <select id="to" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                        <option value="Tuaran">Tuaran</option>
                                        <option value="Tamparuli">Tamparuli</option>
                                        <option value="Telipok">Telipok</option>
                                        <option value="Menggatal">Menggatal</option>
                                        <option value="Inanam">Inanam</option>
                                        <option value="Likas">Likas</option>
                                        <option value="Kota Kinabalu">Kota Kinabalu</option>
                                    </select>
                                   <input type="time" class="form-control" min="05:00" max="21:00"><br/>
                                    <input type="submit" value="Check" class="form-control">
                                    </form>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                

                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-info">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Bussing 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>