package com.gate.gatesafe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Date;

@WebServlet(name = "updateUserServlet", value = "/updateUser")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("user_name");
        String userEmail = request.getParameter("user_email");
        String userId = request.getParameter("user_id");
        String userPassword = request.getParameter("user_password");

        String pass = null;
        try {
            PasswordSecure passwordSecure = new PasswordSecure(userPassword);
            pass = passwordSecure.getPass();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
            conn.setAutoCommit(false);
            Statement st = conn.createStatement();
            PreparedStatement ps = null;

            ps = conn.prepareStatement("update users set password = ?, email = ? where id_user = '" + userId + "', and name = '"+ userName +"'");
            ps.setString(1, pass);
            ps.setString(2, userEmail);

            int i = ps.executeUpdate();

            if (i > 0) {
                String user = request.getRemoteUser();

                ResultSet rs = st.executeQuery("select id_user from users where name = '"+ user +"'");
                rs.next();
                String current_user_id = rs.getString(1);

                String activity = "Update Password";
                Activity log = new Activity(current_user_id, activity, userId);
                String description = log.getDescription();
                Date date = log.getDate();

                i = st.executeUpdate("insert into activity(author, type, description, date_log, concern) values ('" + current_user_id + "', '" + activity + "', '" + description + "', '" + date + "', '" + userId + "')");

            }
            conn.commit();

            String param = request.getParameter("account");
            response.sendRedirect(request.getContextPath() + "/admin/view-user.jsp?account=" + param);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}