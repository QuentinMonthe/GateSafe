<%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 18/10/2022
  Time: 01:10
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

    <title>Gate | Register</title>

    <!-- Custom fonts for this template-->
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .bg-register {
            background: url("img/register.png") center;
            background-size: cover;
        }

        body{
            background-image: url(img/171.jpg);
        }

    </style>

    <script>
        function myFunction() {
            const pass1 = document.getElementById("exampleInputPassword").value;
            const pass2 = document.getElementById("exampleRepeatPassword").value;
            if (pass1 != pass2) {
                //alert("Passwords Do not match");
                document.getElementById("exampleInputPassword").style.borderColor = "#E34234";
                document.getElementById("exampleRepeatPassword").style.borderColor = "#E34234";
                return false
            }
            else {
                // alert("Passwords Match!!!");
                // document.getElementById("regForm").submit();
                return true;
            }
        }
    </script>

</head>

<body>

<div class="container">

    <div class="mt-4">
        <h1 class="text-center text-white"><%= "GateSafe" %></h1>
    </div>

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Create a Partner Account!</h1>
                        </div>
                        <form class="user" id="regForm" action="register" method="post">
                            <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                           name="user_name" placeholder="Username" required>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user" name="user_password"
                                           id="exampleInputPassword" placeholder="Password" required>
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user" name="user_repeat_pass"
                                           id="exampleRepeatPassword" placeholder="Repeat Password" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="custom-control custom-checkbox small">
                                    <input type="checkbox" class="custom-control-input" id="customCheck" name="user_account" value="partners" required>
                                    <label class="custom-control-label" for="customCheck">Partner</label>
                                </div>
                            </div>

                            <input type="submit" onclick="return myFunction()" value="Register Account" class="btn btn-primary btn-user btn-block">
                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="forgot-password.jsp">Forgot Password?</a>
                        </div>
                        <div class="text-center">
                            <a class="small" href="redirect.jsp">Already have an account? Login!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Bootstrap core JavaScript-->
<!-- <script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

<!-- Core plugin JavaScript-->
<!-- <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

</body>

</html>
