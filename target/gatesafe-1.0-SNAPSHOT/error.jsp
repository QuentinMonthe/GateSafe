<%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 15/10/2022
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gate | Authentication failed</title>

    <!-- Custom fonts for this template-->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        body{
            background-image: url(img/171.jpg) !important;
        }

        .bg-failed {
            background: url("img/undraw_security.png") center;
            background-size: cover;
        }
    </style>

</head>

<body>

<div class="container">

    <div class="mt-5">
        <h1 class="text-center text-white"><%= "GateSafe" %></h1>
    </div>

    <!-- Outer Row -->
    <div class="row justify-content-center mt-3">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-failed"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-danger mb-4">Invalid username or password!</h1>
                                </div>
                                <br>

                                <div class="text-center">
                                    <div class="h6 text-gray-900 mb-4">Authentication failed for
                                        <% request.getParameter("j_username"); %>
                                    </div>
                                </div>

                                <form class="user">
                                    <a href="redirect.jsp">
                                        <input type="submit" value="Login" class="btn btn-primary btn-user btn-block">
                                    </a>
                                </form>

                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="register.html">Create an Account!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

</body>

</html>