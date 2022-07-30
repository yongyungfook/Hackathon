<!DOCTYPE html>
<html lang="en">
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
        <title>Order History</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/logo.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <%  try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            } catch (ClassNotFoundException e) {
            e.printStackTrace();
            }
            int count = 0;
            ResultSet rs = null;
            HttpSession httpSession = request.getSession();

            String username = (String)(httpSession.getAttribute("userid"));
            try {
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/hackathondb", "nbuser", "nbuser");
            PreparedStatement ps = con.prepareStatement("select * from schedule where userid = ? order by scheduledate desc");
            ps.setString(1, username);
  
            rs = ps.executeQuery();

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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="order.jsp">Order</a></li>
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
                    <input type="text" name="id" placeholder="Search in Game Vault">
                    <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                    <a href="cart.jsp">
                        
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%= count %></span>
                        </button>
                    </a>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Order History</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Check your order history here</p>
                </div>
            </div>
        </header>

        <table class="table table-bordered table-striped mb-4">
        <% 
        while (rs3.next()) { 
        count2++;
        %>   
        <tr><td><%= count2 %></td><td><a href="orderDetails.jsp?id=<%= rs3.getString("ORDER_ID") %>"><%= rs3.getString("ORDER_TIME") %></a></td><td>RM <%= String.format("%.2f", rs3.getDouble("TOTAL_AMOUNT"))%></td><td><%= rs3.getString("ORDER_STATUS") %></td></tr>
        
        <% 
            } } catch (Exception e) {
        e.printStackTrace();
        } 
        
        if(count2 == 0) { %>
        <h3>You haven't made any order :(</h3>  <% } %>
        </table>
    
        <footer class="fixed-bottom py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Game Vault 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        </body>
</html>
