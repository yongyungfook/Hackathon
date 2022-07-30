<%-- 
    Document   : profile.jsp
    Created on : 3 Mar 2022, 9:04:08 pm
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ page import="java.io.*" %>
        <%@ page import="javax.servlet.*" %>
        <%@ page import="javax.servlet.http.*" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.util.*" %>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/logo.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Profile</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <%try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ResultSet rs = null, rs2 = null, rs3 = null;
        HttpSession httpSession = request.getSession();
//        String userid = httpSession.getAttribute(userid);
//        if((String)(httpSession.getAttribute("username")) == null ) {
//               response.sendRedirect("../login.jsp?error=No permission to view the page");
//               return;
//            } 
        
        String username = (String)(httpSession.getAttribute("userid"));
        String photo = (String)(httpSession.getAttribute("photo"));
        
        try {
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/hackathondb", "nbuser", "nbuser");
            PreparedStatement ps2 = con.prepareStatement("select * from account where userid = ?");
            ps2.setString(1, username);
            
            PreparedStatement ps3 = con.prepareStatement("select * from redemption, voucher where userid = ? order by redeemtime desc");
            ps3.setString(1, username);
            
   
            rs2 = ps2.executeQuery();
            rs3 = ps3.executeQuery();
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
                
                
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp"> Bussing </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="home.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="redeem.jsp">Redeem</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Account</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/E-commerce-Assignment-GUI/Logout">Logout</a></li>

                            </ul>
                        </li>
                    </ul>
                    <form method="get" action="search.jsp" style="margin-right: 30px;">
                    <input type="text" name="id" placeholder="Search in Game Vault">
                    <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                    
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-info py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Check for bus schedule here!</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Let's support our public transport for the sake of our environment!</p>
                </div>
            </div>
        </header>
        
        
        
        <div class="container-fluid">
                <% if (rs2.next()) { %>
                <table class="table  table-bordered table-striped mb-4">
                    <tr><td colspan="2" align="center" ><img src="data:image/jpg;base64,<%= photo %>" width="240" height="300"/></td></tr> 
                <tr><td>ID: </td><td><%= rs2.getString("userid") %></td></tr> 
                    <tr><td>Username : </td><td><%= rs2.getString("name") %></td></tr> 
                <tr><td>Registration Date :</td><td> <%= rs2.getString("regDate") %> </td></tr>
                <tr><td>Email : </td><td><%= rs2.getString("email") %> </td></tr>
                <tr><td>Loyalty Score:</td><td> <%= rs2.getString("loyaltyscore") %> </td></tr>
                <tr><td align="center" colspan="2"><div class="text-left"><a class="btn btn-outline-dark mt-auto" href="forms/editProfile.jsp">Edit profile</a></div></td></tr>
                </table>
                <% } %>
                
                <br>
            <table class="table  table-bordered table-striped mb-4">
            <tr>
                <td> Redemption Time </td>
                <td> Voucher Name </td>
                <td> Points Spent </td>
                <td> Voucher Code </td>
            </tr>
            
            <%while (rs3.next()) { %>
            <tr>
                <td><%= rs3.getString("redeemtime") %></td>
                <td><%= rs3.getString("vouchername") %></td>
                <td><%= rs3.getString("voucherpoint") %></td>
                <td><%= rs3.getString("code") %></td>
            </tr>
            <% } %>
            

            </table>

        </div>
    
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