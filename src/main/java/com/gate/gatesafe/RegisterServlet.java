package com.gate.gatesafe;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Objects;

@WebServlet(name = "registerServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName=request.getParameter("user_name");
        String userEmail=request.getParameter("user_email");
        String userPassword=request.getParameter("user_password");
        String account=request.getParameter("user_account");

        String idUser;
        if (account.equals("partners")) {
            idUser = "PTN";
        } else if (account.equals("admin")) {
            idUser = "ADM";
        } else {
            idUser = "REC";
        }

        String pass=null;
        try {
            PasswordSecure password = new PasswordSecure(userPassword);
            pass=password.getPass();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
            Statement st = conn.createStatement();

            String strQuery = "select count(*) from users where name='"+userName+"'";
            ResultSet rs = st.executeQuery(strQuery);
            rs.next();
            String Countrow = rs.getString(1);
            if(Countrow.equals("0")) {
                rs = st.executeQuery("select count(*) from users where role='"+account+"'");
                rs.next();
                int tpm = rs.getInt(1);
                tpm++;
                idUser += Integer.toString(tpm);

                int i = st.executeUpdate("insert into users(id_user, name, password, role, email) values ('" + idUser + "','" + userName + "','" + pass + "','" + account + "','" + userEmail + "')");

                String test = request.getRemoteUser();
                if (test == null) {
                    response.sendRedirect(request.getContextPath() + "/redirect.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/home.jsp");
                }

            }
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();

        }
    }
}
