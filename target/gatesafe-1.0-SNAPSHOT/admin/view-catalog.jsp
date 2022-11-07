<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: NASH
  Date: 07/11/2022
  Time: 02:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"/>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <jsp:include page="topbar.jsp"/>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Products List</h1>
                    <div class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm text-uppercase">
                        <i class="fas fa-user-circle fa-sm text-white px-1" aria-hidden="true"> </i>
                        Administrator
                    </div>
                </div>

                <!-- Content Row -->
                <div class="content mt-3">

                    <div class="animated fadeIn">
                        <div class="row">

                                <%
                                    String type = request.getParameter("category");

                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
                                        Statement st = con.createStatement();
                                        ResultSet rs;

                                        if (type.equals("all")) {
                                            rs = st.executeQuery("select * from products");
                                        } else {
                                            rs = st.executeQuery("select * from products where id_product = (select id_product from catalog where category = type)");
                                        }

                                        while (rs.next()){
                                %>
                                <div class="col-6 col-lg-3">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="clearfix">
                                                <i class="fa fa-laptop bg-info p-3 font-2xl mr-3 float-left text-light"></i>
                                                <div class="h5 text-secondary mb-0 mt-1">$4.999,50</div>
                                                <div class="text-muted text-uppercase font-weight-bold font-xs small">Income</div>
                                            </div>
                                            <div class="b-b-1 pt-3"></div>
                                            <hr>
                                            <div class="more-info pt-2" style="margin-bottom:-10px;">
                                                <a class="font-weight-bold font-xs btn-block text-muted small" href="#">View More <i class="fa fa-angle-right float-right font-lg"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Edit Modal-->
<%--                                <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editLabel"--%>
<%--                                     aria-hidden="true">--%>
<%--                                    <div class="modal-dialog" role="document">--%>
<%--                                        <div class="modal-content">--%>
<%--                                            <div class="modal-header">--%>
<%--                                                <h5 class="modal-title" id="editLabel">Edit user information</h5>--%>
<%--                                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">--%>
<%--                                                    <span aria-hidden="true">×</span>--%>
<%--                                                </button>--%>
<%--                                            </div>--%>
<%--                                            <form class="" action="${pageContext.request.contextPath}/updateProduct" method="post">--%>
<%--                                                <div class="modal-body user">--%>
<%--                                                    <div class="form-group">--%>
<%--                                                        <label for="modalID">ID Product</label>--%>
<%--                                                        <input type="text" class="form-control form-control-user" id="modalID" name="product_id" value=<%= rs.getString(1) %> disabled />--%>
<%--                                                    </div>--%>

<%--                                                    <div class="form-group">--%>
<%--                                                        <label for="modalName">Name</label>--%>
<%--                                                        <input type="text" class="form-control form-control-user" id="modalName" name="product_name" value=<%= rs.getString(2) %> disabled />--%>
<%--                                                    </div>--%>
<%--                                                    <div class="form-group">--%>
<%--                                                        <label for="modalPrice">Price</label>--%>
<%--                                                        <input type="number" class="form-control form-control-user" id="modalPrice" name="product_price" value=<%= rs.getString(3) %> />--%>
<%--                                                    </div>--%>
<%--                                                    <div class="form-group">--%>
<%--                                                        <label for="modalDescription">Description</label>--%>
<%--                                                        <input type="text" class="form-control form-control-user" id="modalDescription" name="product_description" value=<%= rs.getString(4) %> />--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>

<%--                                                <div class="modal-footer">--%>
<%--                                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>--%>
<%--                                                    <button class="btn btn-primary" type="submit" >Update</button>--%>
<%--                                                </div>--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <%
                                        }
                                        con.close();
                                    }
                                    catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>


                        </div>
                    </div>
                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2021</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<jsp:include page="logoutScript.jsp"/>

<!-- Bootstrap core JavaScript-->
<jsp:include page="script.jsp"/>

</body>

</html>
