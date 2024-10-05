

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
 * Servlet implementation class UserFeedback
 */
@WebServlet("/UserFeedback")
public class UserFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFeedback() {
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
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		 	String UserName =request.getParameter("name");
	  		String Email = request.getParameter("email");
	  		String Contact= request.getParameter("contact");
	  		String MechanicName= request.getParameter("mechanicname");
	  		String Experience= request.getParameter("rd");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		     	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Tanaya@3502");
		     	
		     	    PreparedStatement ps = con.prepareStatement("insert into feedback values(?,?,?,?,?)");
					ps.setString(1, UserName);
					ps.setString(2, Email);
					ps.setString(3, Contact);
					ps.setString(4, MechanicName);
					ps.setString(5, Experience);
				
		     		int i = ps.executeUpdate();
		     		if (i > 0)
		     		{
		     			out.print("<center> <h1>Feedback Subitted successfully ...</h1>");
		     			out.println("<a href=UserDashboard.jsp>Go Back</a> </center>");
		     		} 	
		     	else 
		     	{
		     		out.print("<h1><i>Failed to Submit Feedback </i></h1>");
		        }
			}
			
		       
		catch(Exception e)
		{
				out.println(e);
				e.printStackTrace();
		}
	}
}
