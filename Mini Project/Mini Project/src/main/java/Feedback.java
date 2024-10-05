

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
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Feedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {
			Class.forName("com.mysql.jdbc.Driver");
		     	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Tanaya@3502");
		     	
		     	    PreparedStatement ps = con.prepareStatement("select * from feedback");
		     		ResultSet rs = ps.executeQuery();
		 	        
		     		out.println("<center><h1> Feedback Details </h1>");
					out.println("<table border='1'>");
			        out.println("<tr><th>UserName</th> <th>Email</th> <th>Contact</th> <th>Mechanic Name</th> <th>Expirence</th></tr>");
					
		     		while (rs.next()) {
		 	        String UserName = rs.getString("username");
		 	  		String Email = rs.getString("email");
		 	  		String Contact= rs.getString("contact");
		 	  		String MechanicName= rs.getString("mechanicname");
		 	  		String Expirence= rs.getString("rd");
		 	  		
		 	  		out.println("<tr><td>"+UserName+"</td><td>"+Email+"</td><td>"+Contact+"</td><td>"+MechanicName+"</td><td>"+Expirence+"</td></tr>");	
		 			}
		 	        out.println("</table>");
		 	        out.println("</center>");
		 		}
		       
		catch(Exception e)
		{
				out.println(e);
				e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
