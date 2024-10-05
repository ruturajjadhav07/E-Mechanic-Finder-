

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserSignUp
 */
@WebServlet("/UserSignUp")
public class UserSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String contact = request.getParameter("contact");
	
		boolean isValid = true;
	  	String usernameError = "";
	  	String emailError = "";
        String passwordError = "";
        String contactError = "";
              
	
    if (!username.matches("^[a-zA-Z\\s]+$")) 
	{
    	  usernameError = "Username should contain only alphabets.";
          isValid = false;
    } 
	else if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) 
	{
        out.print("<center> <h1>Invalid email. Please use a valid email format.</h1> </center>");
        isValid = false;
    } 
	else if (!password.matches("^(?=.*[a-zA-Z])(?=.*[@#$%^&+=!]).{6,}$")) 
	{
		passwordError = "Password should be 6 characters or more and contain at least one special character.";
        isValid = false;
    } 
	else if (!contact.matches("^[0-9]{10}$")) 
	{
       contactError="Invalid contact number. Please use a 10-digit Indian number.";
        isValid = false;
	} 
    if (isValid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Tanaya@3502");	
			
		     	// Check if the email already exists in the database
		     	if (!isEmailAlreadyExists(con, email)) {
		     		PreparedStatement ps = con.prepareStatement("insert into user (username,email,password,contact) values(?,?,?,?)");
					ps.setString(1, username);
					ps.setString(2, email);
					ps.setString(3, password);
					ps.setString(4, contact);
				
		     		int i = ps.executeUpdate();
		     		if (i > 0)
		     		{
		     			out.print("<center> <h1>You are successfully registered...</h1>");
		     			out.println("<a href=Home.html>Login Here</a> </center>");
		     		} 	
		        } 
		     	else 
		     	{
		     		out.print("<h1><i>Email already exists. Please use a different email.</i></h1>");
		        }
			}
			catch(Exception e)
			{
				out.println(e);
				e.printStackTrace();
			}
	   }
    else {
    	// Display individual error messages for each field
        out.print("<center><h1>Registration failed !<br> Please check your data...</h1>");
        out.print("<h3><i>");
        if (!usernameError.isEmpty()) {
            out.print(""+ usernameError + "");
        }
        if (!emailError.isEmpty()) {
            out.print(""+ emailError + "");
        }
        if (!passwordError.isEmpty()) {
            out.print("" + passwordError + "");
        }
        if (!contactError.isEmpty()) {
            out.print(""+ contactError + "");
        }
        out.print("</i></h3></center>");
        
    }
}
	private boolean isEmailAlreadyExists(Connection con, String email) 
	{
		try 
		{
			PreparedStatement ps = con.prepareStatement("SELECT email FROM user WHERE email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			return rs.next(); // Returns true if the email exists in the database
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			return false; // Assume email does not exist in case of an error
		}
	}
}
