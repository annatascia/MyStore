package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDao;
import entity.Cart;
import entity.Item;
import entity.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ItemDao itemDao= new ItemDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		
		String action=request.getParameter("action");
		
		
		
			if(action.equals("add")){
				if(addToCart(request,response))
				{
					response.sendRedirect(request.getContextPath()+"/add_success.jsp");
				}
				else
				{
					response.sendRedirect(request.getContextPath()+"/add_failure.jsp");
				}
				
			}
			if(action.equals("delete")){
				if(deleteFormCart(request,response)){
					response.sendRedirect(request.getContextPath()+"/cart.jsp");
				}
				else{
					response.sendRedirect(request.getContextPath()+"/cart.jsp");
				}
			}
			
		
		
	}
	
	public boolean addToCart(HttpServletRequest request, HttpServletResponse response){
		int id=Integer.parseInt(request.getParameter("id"));
		Item item=itemDao.getItemById(id);
		
		if(request.getSession().getAttribute("cart")==null){
			Cart cart=new Cart();
			request.getSession().setAttribute("cart",cart);
		}
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		
		if(cart.addToCart(item))
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}
	
	
	public boolean deleteFormCart(HttpServletRequest request, HttpServletResponse response){
		int id=Integer.parseInt(request.getParameter("id"));
		Item item=itemDao.getItemById(id);
		Cart cart=(Cart)request.getSession().getAttribute("cart");
		if(cart.deleteFromCart(item))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

}
