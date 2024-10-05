<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    HttpSession currentSession = request.getSession(false); // Obtaining the session

    if (currentSession != null) {
        currentSession.invalidate(); // Invalidating the session if it exists
    }
    
    // Redirecting to home.html after logout
    response.sendRedirect("Home.html");
%>
</body>
</html>