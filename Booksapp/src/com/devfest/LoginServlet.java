package com.devfest;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.devfest.model.Person;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class LoginServlet extends HttpServlet {
	
	private PersistenceManager pm;
	

	public LoginServlet() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String url=req.getServletPath();
		HttpSession session=req.getSession();
		pm=PMF.get().getPersistenceManager();
		if(url.endsWith("/login"))
		{
		
		Person p;
		UserService userService = UserServiceFactory.getUserService();
		// Test if the user is logged or not 
		if (userService.getCurrentUser() != null) {
			try{
        	Query q = pm.newQuery(Person.class,"email == '"+userService.getCurrentUser()+"'");
            List<Person> list=(List<Person>) q.execute();
            if(list.isEmpty()){
            	p=new Person();
            	p.setName(userService.getCurrentUser().getNickname());
	        	p.setEmail(userService.getCurrentUser().getEmail());
	        	session.setAttribute("user", pm.makePersistent(p));        	
              }
            else
            {
            	session.setAttribute("user", list.get(0));
            }
        	
        	
			}
			catch (Exception ex)
			{
				ex.printStackTrace();
			}
			
			finally{
				pm.close();
				resp.sendRedirect("/books");
			}
       
        	
        } else {
        	// redirect to login page
        	resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
                                                
        }
		}
		if(url.endsWith("/signout"))
		{
			session.invalidate();
			resp.sendRedirect("index.jsp");
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name=req.getParameter("login").toUpperCase();
		String pwd=req.getParameter("pwd").toUpperCase();
		HttpSession session=req.getSession();
		if(name.equals("GUEST") && pwd.equals("GUEST"))
				{
			      
			       Person p=new Person();
			       p.setEmail("guest");
			       p.setName("guest");
			       session.setAttribute("user", p);
			       resp.sendRedirect("/books");
				}
		else
		{
			req.setAttribute("msg", "name or password invalid !");
			req.getRequestDispatcher("/").forward(req, resp);
			
		}
	}
	
	

}
