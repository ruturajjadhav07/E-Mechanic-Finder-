<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

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
    background-color: #1d1919;
    overflow-y: hidden;
    padding-top: 0px;
}


.img {
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 250px;
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
    margin-left: 410px;
    margin-top: 90px;
    font-weight: initial;
    margin-right: 200px;
}


/* profile Section Starts */

#profile {
    background-size: cover;
    padding-top: 30px;
    padding-bottom: 260px;
    /* height: 100vh;
    align-items: center;
    justify-content: center; */
}

#profile .greet {
    font-size: 30px;
    font-weight: initial;
}

#profile .name {
    font-size: 40px;
    padding-bottom: 26px;
    font-weight: initial;
}

#profile .name1 {
    font-size: 40px;
    padding-bottom: 26px;
    font-weight: initial;
    color: #26FF8F;
    /* color: #26FF; */
}


#profile p {
    font-size: 22px;
    font-stretch: expanded;
    letter-spacing: 0.9px;
}

/* profile Section Ends */

/*form*/
        form{
            width: 500px;
            margin: 0px auto;
            padding: 40px 50px;
            padding-bottom:10px;
            margin-left:550px;
            color: white;
            font-size:20px;
        }

        h2 {
        	margin-left:330px;
            margin-bottom: 20px;
            font-size:45px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group input[type="text"],
			input[type="email"],select,option{
			color:black;
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="radio"]{
	       	margin-right: 10px;
    		}

       .form-group button {
            background-color: white;
            color: black;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
		

</style>

<body>
<%
    String username = (String) session.getAttribute("username");
%>

 <!-- Navbar starts-->
    <section>
        <div class="sidenav">
            <div class="img">
                <div class="img-name">
                    <h1><%= username %></h1>
                </div>
            </div>
            <ul><a href="UserProfile.jsp">Profile</a>
                <a href="UserRequest.jsp">Request</a>
                <a href="UserRequestStatus.html">Check Status</a>
                <a href="UserPayment.html">Payment</a>
                <a href="UserFeedback.jsp">Feedback</a>
                <a href="Contact.html">Emergency</a>
                <a href="UserLogout.jsp">Logout</a>
            </ul>
        </div>
    </section>
<body>
<center>

<div id="profile">
            <%@page import="java.sql.ResultSet"%>
			<%@page import="java.sql.Statement"%>
			<%@page import="java.sql.Connection"%>
			<%@page import="java.sql.DriverManager"%>
			<%@ page import="java.sql.*" %>
			<%@ page import="javax.servlet.http.Cookie" %>
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Tanaya@3502");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username = ?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String UserName = rs.getString("username");
            String Email = rs.getString("email");
            String Contact = rs.getString("contact");
            
        
    %>

    <h2>User Details Form</h2>
    <form action="UserVehicleDetails.jsp" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= UserName %>" required><br><br>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= Email %>" required><br><br>
        </div>
        <div class="form-group">
            <label for="contact">Contact:</label>
            <input type="text" id="contact" name="contact" value="<%= Contact %>" required><br><br>
        </div>
        <div class="form-group">
            <button type="submit">Next</button><br><br>
        </div>
    </form>

    <%
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>

</div>
</form>
</center>       
</body>
</html>