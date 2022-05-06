package servlets;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Category;
import beans.Order;
import beans.Pet;
import beans.User;
import databases.DataBase;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataBase db;

    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() throws ServletException {
		  db = new DataBase();
	  }

	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String path = request.getServletPath();

	    List < Category > categorys = db.getCategorys();
	    request.setAttribute("modelCategorys", categorys);

	    List < Pet > pets = db.getPets();
	    request.setAttribute("modelPets", pets);

	    HttpSession session = request.getSession();

	    if (path.equals("/index.do")) {

	      request.getRequestDispatcher("home.jsp").forward(request, response);
	    }

	    if (path.equals("/about.do")) {
	      request.getRequestDispatcher("about.jsp").forward(request, response);
	    }

	    if (path.equals("/register.do")) {
	      request.getRequestDispatcher("register.jsp").forward(request, response);
	    } else if (path.equals("/reg.do") && (request.getMethod().equals("POST"))) {

	      String username = request.getParameter("username");
	      String password = request.getParameter("password");
	      String email = request.getParameter("email");
	      String phone = request.getParameter("phone");
	      String company = request.getParameter("company");
	      String adrres = request.getParameter("adrres");

	      if(db.login(username, password)==-1)
	      {
	    	  User I = db.regester(new User(username, password, email, phone, company, adrres));

		      int id = db.login(username, password);
		      String name = db.select(id);
		      session.setAttribute("userid", id);
		      session.setAttribute("username", name);
		      request.getRequestDispatcher("home.jsp").forward(request, response);
	      }
	      else
	      {
	    	  request.setAttribute("verifier", "Le username deja existe");
		      request.getRequestDispatcher("register.jsp").forward(request, response);
	      }

	    } else if (path.equals("/myaccount.do")) {
	      request.getRequestDispatcher("login.jsp").forward(request, response);
	    } else if (path.equals("/login.do") && (request.getMethod().equals("POST"))) {

	      String username = request.getParameter("username");
	      String password = request.getParameter("password");
	      int id = db.login(username, password);
	      String name = db.select(id);
	      if (id == -1) {
	        request.getRequestDispatcher("myaccount.do").forward(request, response);
	      } else {

	        session.setAttribute("userid", id);
	        session.setAttribute("username", name);
	        request.getRequestDispatcher("home.jsp").forward(request, response);

	      }

	    } else if (path.equals("/specials.do")) {
	      request.getRequestDispatcher("specials.jsp").forward(request, response);
	    } else if (path.equals("/pets.do")) {

	      request.getRequestDispatcher("pets.jsp").forward(request, response);
	    }

	    if (path.equals("/contact.do")) {
	      request.getRequestDispatcher("contact.jsp").forward(request, response);
	    }

	    if (path.equals("/logout.do")) {

	      session.invalidate();
	      request.getRequestDispatcher("home.jsp").forward(request, response);
	    }

	    if (path.contains("/details.do")) {
	      int pet_id = Integer.parseInt(request.getParameter("id"));
	      for (Pet p: pets) {
	        if (p.getPet_id() == pet_id) {
	          request.setAttribute("pet_selected", p);
	        }
	      }

	      request.getRequestDispatcher("detail.jsp").forward(request, response);
	    }

	    if (path.contains("/category.do")) {
	      int c_id = Integer.parseInt(request.getParameter("id"));
	      List < Pet > petCat = new ArrayList < Pet > ();
	      for (Pet p: pets) {
	        if (p.getPet_category_id() == c_id) {
	          petCat.add(p);
	          request.setAttribute("cat_selected", petCat);
	        }
	      }

	      request.getRequestDispatcher("category.jsp").forward(request, response);
	    }

	    if (path.equals("/order.do")) {
	      int userid = Integer.parseInt(request.getParameter("userid"));
	      int pet_id = Integer.parseInt(request.getParameter("pet_id"));

	      db.insert(userid, pet_id);

	      request.getRequestDispatcher("home.jsp").forward(request, response);
	    }

	    if (path.equals("/cart.do")) {
	      double c = 0;
	      List < Order > orders = db.getOrders();
	      List < Pet > petOrder = new ArrayList < Pet > ();
	      int userid = Integer.parseInt(request.getParameter("userid"));
	      for (Order o: orders) {
	        if (o.getUser_id() == userid) {
	          for (Pet p: pets) {
	            if (p.getPet_id() == o.getPet_id()) {
	              petOrder.add(p);
	              c += p.getPrice();

	            }
	          }
	        }
	      }
	      String formatted = String.format("%.2f", c);
	      request.setAttribute("total", formatted);
	      request.setAttribute("pet_order", petOrder);
	      request.getRequestDispatcher("cart.jsp").forward(request, response);
	    }

	  }

	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);
	  }

}
