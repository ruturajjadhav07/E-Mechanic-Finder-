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
    padding-top: 110px;
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



    <section class="main">

        <!-- Profile Section Starts -->

        <div id="profile">
            <h1 class="greet">Hiii <%= username %></h1><br>
            <h1 class="name">I'm <span class="text name1"></span></h1>
            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ipsam similique praesentium repellendus maiores
                sunt nobis rem dolores veniam, voluptatibus vitae? Molestiae tempore culpa quos inventore ex eveniet
                excepturi iure neque!
            </p>
        </div>
        

        <!-- Profile Section Ends -->
    </section>


    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.11"></script>


</body>
</html>