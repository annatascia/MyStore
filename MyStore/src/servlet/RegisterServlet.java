package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import entity.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		User user=new User();
		UserDao userDao=new UserDao();
		
		try {
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String conPassword=request.getParameter("conPassword");
			String gender=request.getParameter("gender");
			Date birthday=sdf.parse(request.getParameter("birthday"));
			
			if(userDao.getUserByUsername(username)==null){
			
			if(password.equals(conPassword)){
				user.setUsername(username);
				user.setPassword(password);
				user.setGender(gender);
				user.setBirthday(birthday);
				
				userDao.addUser(user);
				
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("ifLogin", "1");
				response.sendRedirect((String) request.getSession().getAttribute("latestUrl"));
				
			}
			else{
				response.sendRedirect(request.getContextPath()+"/register.jsp?error=2");
			}
			}
			else{
				response.sendRedirect(request.getContextPath()+"/register.jsp?error=1");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
