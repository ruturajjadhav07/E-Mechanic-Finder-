<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="Project.css">
<style>
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    color: aliceblue;
}

html {
    scroll-behavior: smooth;
    overflow-y: hidden;
}

body {
    font-family: "Lato", sans-serif;
    background-color: #111;
}

/* Nav Section Starts */



.sidenav {
    height: 100%;
    width: 331px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: black;
    overflow-y: hidden;
    padding-top: 0px;
 	margin-top: 70px;
}

.img {
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 200px;
}

.img img {
    border-radius: 50%;
}


.img-name {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 14px;
}

.img-name h2 {
    padding-top: 11px;
    font-size: 26px;
    font-weight: 100;
    color: white;


    /* for linear-gradient */
    /* background: -webkit-linear-gradient(#ee7752, #e73c7e, #23a6d5, #23d5ab);
    animation: 2s ease infinite;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent; */
}


.img-name h3 {
    font-size: 18px;
    font-weight: 100;
    color: deeppink;
}

.sidenav ul {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 42vh;
    gap: 23px;
    padding-left: 0px;
    margin: 8px;
    padding-right: 33px;
}

.sidenav a {
    padding: 6px 6px 6px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
}

.sidenav a:hover {
    color: deeppink;
    text-decoration: underline;
}



/* Nav Section Ends */


/* Main Section Starts */


section.main {
    margin-left: 360px;
    margin-top: 90px;
    font-weight: initial;
    margin-right: 200px;
}
#profile {
    background-size: cover;
    padding-top: 110px;
    padding-bottom: 260px;
    align-items: center;    
}

/* Styles for table */
table {
    width: 70%;
    border-collapse: collapse;
    margin-top: 10px;
}

table th,
table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}

table th {
    background-color: #333;
    color: #fff;
}

/* Styles for buttons */
.update-btn,
.delete-btn {
    padding: 8px 15px;
    margin-right: 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    border-radius: 4px;
    cursor: pointer;
}

.update-btn {
    background-color: #4CAF50;
    color: white;
}

.delete-btn {
    background-color: #f44336;
    color: white;
}

</style>
<body>

<div class="main">
            <div class="navbar">
                <div class="icon">
                    <h2 class="logo">E <span class="letter">M</span>echanic <span class="letter">F</span>inder</h2>
                </div>

                <div class="menu">
                    <ul class="ul">
                        <li><a href="Home.html">HOME</a></li>
                        <li><a href="Service.html">SERVICE</a></li>
                        <li><a href="About.html">ABOUT</a></li>
                        <li><a href="Contact.html">CONTACT</a></li>
                    </ul>
                </div>

</div>

 <!-- Navbar starts-->
    <section>
        <div class="sidenav">
            <div class="img">
                <div class="img-name">
                    <h1>Admin</h1>
                </div>
            </div>
            <ul>
            	<a href="Admin.jsp">Profile</a>
            	<a href="UserData.jsp">User Data</a>
                <a href="MechanicData.jsp">Mechanic Data</a>
                <a href="AdminFeedback.jsp">FeedBack</a>
                <a href="AdminLogout.jsp">Logout</a>
            </ul>
        </div>
    </section>



 	<section class="main">

        <!-- Profile Section Starts -->

        <div id="profile">
            <%@page import="java.sql.ResultSet"%>
			<%@page import="java.sql.Statement"%>
			<%@page import="java.sql.Connection"%>
			<%@page import="java.sql.DriverManager"%>
			<%@ page import="java.sql.*" %>
		<%
		try {
	 	Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Tanaya@3502");
		PreparedStatement ps = con.prepareStatement("SELECT * FROM feedback");
	    ResultSet rs = ps.executeQuery();
		%>
    <h1>User's Feedback</h1>
    <table border="1" >
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Mechanic Name</th> 
            <th>Experience</th>
  			<th>Action</th>
        </tr>

        <%while (rs.next()) {
        	String UserName = rs.getString("username");
 	  		String Email = rs.getString("email");
 	  		String Contact= rs.getString("contact");
 	  		String MechanicName= rs.getString("mechanicname");
 	  		String Experience= rs.getString("experience");
        %>

            <tr>
                <td><%= UserName %></td>
                <td><%= Email %></td>
                <td><%= Contact %></td>
                <td><%= MechanicName %></td>
                <td><%= Experience %></td>
                <td>
                    <a href="DeleteUser.jsp?username=<%= UserName %>" class="delete-btn">Delete</a>
                </td>
            </tr>

        <%
        }
        %>
    </table>

	<%
     	rs.close();
        ps.close();
    	con.close();
	} catch (Exception e) {
    	out.println(e);
    	e.printStackTrace();
    }
	%>
     </div>
        

        <!-- Profile Section Ends -->
    </section>

    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.11"></script>

<body>

</body>
</html>