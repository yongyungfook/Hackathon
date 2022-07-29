<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Register</title>

        <!-- Custom fonts for this template-->
        <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="admin/css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body class="bg-gradient-primary">

        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                        </div>
                        <form method="post" action="http://localhost:8080/Hackathon/signUpDriver" enctype="multipart/form-data" >
                            <div class="form-group">
                                <input type="text" id="id" name="id" class="form-control" placeholder="ID" required>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="password" id="password"
                                       placeholder="Password" required>
                            </div>
                            <div class="form-group">
                                <input type="text" id="name" name="name" class="form-control" placeholder="Name" required>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" id="email"
                                       placeholder="Email Address" required>
                            </div>
                            <div class="form-group">
                                <input type="file" class="form-control-files" name="photo" id="photo" accept="image/*" required>
                            </div>
                            <div class="form-group">
                                <input type="text" id="plateNumber" name="plateNumber" class="form-control" placeholder="Plate number" required>
                            </div>
                            <div class="form-group">
                                <input type="text" id="description" name="description" class="form-control" placeholder="Description of your business..." required>
                            </div>   
                            <% if (request.getParameter("error") != null) {
                                String error = request.getParameter("error");%>
                            <p style="color: red;"><%= error%></p>
                            <% } else if(request.getParameter("register") != null) {
                                String error = request.getParameter("register");%>
                            <p style="color: blue;"><%= error %></p>
                            <%}%>
                            <input type="submit" value="Submit" class="btn btn-primary btn-user btn-block">
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="login.jsp">Already have an account? Login!</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="admin/vendor/jquery/jquery.min.js"></script>
        <script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="admin/js/sb-admin-2.min.js"></script>

    </body>

</html>