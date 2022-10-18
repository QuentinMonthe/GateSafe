<%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 16/10/2022
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Gate | Connexion</title>

    <!-- Custom fonts for this template-->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        body{
            background-image: url(img/171.jpg) !important;
        }
    </style>

</head>

<body>
    <div class="d-flex justify-content-center">
        <div class="mt-5">
            <h1 class="text-center text-white"><%= "GateSafe" %></h1>
            <br/>


                <!-- Content Row -->
                <div class="row">

                    <div class="card m-4" style="width: 20rem;">
                        <img class="card-img-top" src="img/undraw_admin.png" alt="Card image cap">
                        <div class="card-body">
                            <a href="admin/home.jsp" class="card-link"><h5 class="card-title text-center">Admin Account</h5></a>
                        </div>
                    </div>

                    <div class="card  m-4" style="width: 20rem;">
                        <img class="card-img-top" src="img/undraw_responsable-client.png" alt="Card image cap">
                        <div class="card-body">
                            <a href="responsable-client/home.html" class="card-link"><h5 class="card-title text-center">Responsable Client Account</h5></a>
                        </div>
                    </div>

                    <div class="card  m-4" style="width: 20rem;">
                        <img class="card-img-top" src="img/undraw_partner.svg" alt="Card image cap">
                        <div class="card-body">
                            <a href="partner/home.html" class="card-link"><h5 class="card-title text-center">Partner Account</h5></a>
                        </div>
                    </div>

                </div>
    </div>
    </div>
    <!-- Bootstrap core JavaScript-->
<%--    <script src="vendor/jquery/jquery.min.js"></script>--%>
<%--    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

    <!-- Core plugin JavaScript-->
<%--    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>--%>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>
</html>
