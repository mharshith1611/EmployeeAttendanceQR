
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<body>
            <script>window.alert(Logout);</script>
		<% session.invalidate(); %>
		<jsp:forward page="index.jsp"/>
	</body>
</html>
