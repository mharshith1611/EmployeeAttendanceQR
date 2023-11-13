
<%@page import="QRAttendance.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String selectedMonth = request.getParameter("selectedMonth");
    String year = selectedMonth.substring(0, 4);
    String month = selectedMonth.substring(5);
    String employeeId = request.getParameter("employeeId");
    System.out.println(selectedMonth);

    int totalPresentDays = 0;

    try {
         Connection connection = SQLconnection.getconnection();
        String query = "SELECT COUNT(*) AS present_count FROM attendance WHERE YEAR(date) = ? AND MONTH(date) = ? AND employee_id = ? AND is_present = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, year);
            preparedStatement.setString(2, month);
            preparedStatement.setString(3, employeeId);
            preparedStatement.setBoolean(4, true);  // Add this line

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    totalPresentDays = resultSet.getInt("present_count");
                }
            }
        }
        System.out.println("Total Present Days" + totalPresentDays);
        if (totalPresentDays == 0) {
            response.sendRedirect("CheckAttendance.jsp?NoRecord");
        } else {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("Select * from emp_details where empid='"+employeeId+"' ");
            rs.next();
            String ename = rs.getString("ename");
            String designation = rs.getString("designation");

            response.sendRedirect("AtteendanceDetails.jsp?presentDays=" + totalPresentDays + "&Empid=" + employeeId + "&ename=" + ename+ "&designation=" + designation);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
