package com.gate.gatesafe;

import com.gate.gatesafe.Activity;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

@WebServlet(name = "newProductServlet", value = "/newProduct")
public class NewProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameProduct=request.getParameter("product");
        String priceProduct=request.getParameter("price");
        String describeProduct=request.getParameter("description");
        String categoryProduct=request.getParameter("category");
        String numberProduct=request.getParameter("quantity");
        String imageProduct="../img/undraw_rocket.svg";

        String idProduct = "PD";

        String current_user = request.getRemoteUser();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("select count(*) from products where name='"+nameProduct+"'");
            rs.next();
            String Count = rs.getString(1);

            if(Count.equals("0")) {
                rs = st.executeQuery("select count(*) from products");
                rs.next();
                int tpm = rs.getInt(1) + 1;
                idProduct += Integer.toString(tpm);

                if (current_user == null) {

                    response.sendRedirect(request.getContextPath() + "/redirect.jsp");

                } else {
                    rs = st.executeQuery("select id_user from users where name ='" + current_user + "'");
                    rs.next();

                    String current_user_id = rs.getString(1);
                    String activity = "Create";
                    Activity trace = new Activity(current_user_id, activity, idProduct);
                    String description = trace.getDescription();
                    Date date = trace.getDate();

                    int i = st.executeUpdate("insert into products (id_product, name, price, description, image) values ('" + idProduct + "','" + nameProduct + "','" + priceProduct + "','" + describeProduct + "','" + imageProduct + "')");

                    i = st.executeUpdate("insert into activity (author, type, description, date_log, concern) values ('" + current_user_id + "', '" + activity + "', '" + description + "', '" + date + "', '" + idProduct + "')");

                    i = st.executeUpdate("insert into category (id_product, number, type) values ('" + idProduct + "', '" + numberProduct + "', '" + categoryProduct + "')");

                    response.sendRedirect(request.getContextPath() + "/admin/home.jsp");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/register-error.jsp");
            }
            conn.close();
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();

        }

    }
}
