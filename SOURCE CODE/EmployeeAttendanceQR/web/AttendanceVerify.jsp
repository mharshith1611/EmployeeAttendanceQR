
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="QRAttendance.SQLconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String qrValue = request.getParameter("qr");

    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    try {

        ResultSet rs = st.executeQuery("SELECT * FROM emp_details where  unique_id='" + qrValue + "' AND estatus='Active'");
        if (rs.next()) {
            //  int l = st2.executeUpdate("update slot_booking set ustatus='Yes' where codeval='" + qrValue + "'  ");

            String ename = rs.getString("ename");
            String dept = rs.getString("dept");
            String designation = rs.getString("designation");
            session.setAttribute("sname", ename);
            DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

Date today = new Date();

Date todayWithZeroTime = formatter.parse(formatter.format(today));
            
            String attendanceStatus = "present";
            String employeeId = rs.getString("empid");

            boolean isPresent = "present".equals(attendanceStatus);
            Date date = todayWithZeroTime;

            try {
                Connection connection = SQLconnection.getconnection();

                // Check if attendance for the same date and employee already exists
                String checkQuery = "SELECT COUNT(*) AS count FROM attendance WHERE date = ? AND employee_id = ?";
                try (PreparedStatement checkStatement = connection.prepareStatement(checkQuery)) {
                    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                    checkStatement.setDate(1, sqlDate);
                    checkStatement.setString(2, employeeId);

                    try (ResultSet resultSet = checkStatement.executeQuery()) {
                        if (resultSet.next() && resultSet.getInt("count") > 0) {
                            // Attendance record already exists, handle accordingly
                            response.sendRedirect("Login.jsp?Already");
                            return; // Exit the JSP page
                        }
                    }
                }

                // Insert the attendance record if not already exists
                String insertQuery = "INSERT INTO attendance (date, is_present, employee_id, ename, dept, designation) VALUES (?, ?, ?,?,?,?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                    preparedStatement.setDate(1, sqlDate);
                    preparedStatement.setBoolean(2, isPresent);
                    preparedStatement.setString(3, employeeId);
                    preparedStatement.setString(4, ename);
                    preparedStatement.setString(5, dept);
                    preparedStatement.setString(6, designation);
                    preparedStatement.executeUpdate();

                    response.sendRedirect("Login.jsp?LogAdded");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("An error occurred while recording attendance.");
            }
%>

<%
        } else {
            response.sendRedirect("Login.jsp?LogFailed");

        }
        rs.close();
        con.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>