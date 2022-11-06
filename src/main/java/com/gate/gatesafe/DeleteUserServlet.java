package com.gate.gatesafe;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Date;

@WebServlet(name = "deleteUserServlet", value = "/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");
        String param = request.getParameter("account");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/webgate", "root", "");
            conn.setAutoCommit(false);

            Statement st = conn.createStatement();
            int i = st.executeUpdate("delete from users where id_user = '"+ userId +"'");
//            System.out.print("Ici");
            if (i > 0) {
                String user = request.getRemoteUser();

                ResultSet rs = st.executeQuery("select id_user from users where name = '"+ user +"'");
                rs.next();
                String current_user_id = rs.getString(1);

                String activity = "Delete User";
                Activity log = new Activity(current_user_id, activity, userId);
                String description = log.getDescription();
                Date date = log.getDate();

                i = st.executeUpdate("insert into activity(author, type, description, date_log, concern) values ('" + current_user_id + "', '" + activity + "', '" + description + "', '" + date + "', '" + userId + "')");
            }

            conn.commit();


            System.out.print(param);
            response.sendRedirect(request.getContextPath() + "/admin/view-user.jsp?account=" + param);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
