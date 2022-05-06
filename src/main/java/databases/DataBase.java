package databases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Category;
import beans.Pet;
import beans.User;
import beans.Order;

public class DataBase {
	private Connection connexion = null;
	
	//l'insertion d'un user dans la base de donnees
	 public void insert(int user_id, int pet_id) {
		 
		    loadDatabase("pet--shop");
		    try {
		      PreparedStatement ps = connexion.prepareStatement("INSERT INTO `order` ( `user_id`, `pet_id`) VALUES (?,?)");

		      ps.setInt(1, user_id);
		      ps.setInt(2, pet_id);
		      ps.executeUpdate();
		      System.out.println("insert");
		      ps.close();

		    } catch (SQLException e) {
		      e.printStackTrace();
		    }

	  }
	
	//les demandes fait par les users
	public List < Order > getOrders() {
	    List < Order > orders = new ArrayList < Order > ();

	    loadDatabase("pet--shop");
	    try {
	      PreparedStatement ps = connexion.prepareStatement("SELECT * FROM `order`");
	      ResultSet rs = ps.executeQuery();

	      while (rs.next()) {
	        Order order = new Order();
	        order.setUser_id(rs.getInt("user_id"));
	        order.setPet_id(rs.getInt("pet_id"));
	        order.setOrder_id(rs.getInt("order_id"));

	        orders.add(order);

	      }
	      ps.close();

	    } catch (SQLException e) {
	      e.printStackTrace();
	    }
	    return orders;
	  }

	//retourne le nom d'un via son id
	public String select(int id) {
		String name="";
		
	    loadDatabase("pet--shop");
	    
		try {
			PreparedStatement ps = connexion.prepareStatement("SELECT  username FROM tbl_user where user_id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				name=rs.getString("username");
			}
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return name;
	}

	//verifie le (user,pass) si il existe ou non dans la base de donnees
	public int login(String user, String pass) {
		int id =-1;
		
	    loadDatabase("pet--shop");
		try {
			PreparedStatement ps = connexion.prepareStatement("SELECT user_id AS MAX_ID FROM tbl_user where username like ? and  password like ?");
			ps.setString(1, user);
			ps.setString(2, pass);
		
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				id=rs.getInt("MAX_ID");
			}
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return id;
	}
	
	//enregistre le user 
	 public User regester(User u) {
		 loadDatabase("pet--shop");
		 try {
		// boolean rowInserted = false;
		 PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO tbl_user (username, password, email, phone, Company, Adrres) VALUES (?,?,?,?,?,?)");
		 preparedStatement.setString(1, u.getUsername());
		preparedStatement.setString(2, u.getPassword());
		preparedStatement.setString(3, u.getEmail());
		preparedStatement.setString(4, u.getPhone());
		preparedStatement.setString(5, u.getCompany());
		preparedStatement.setString(6, u.getAdrres());
		preparedStatement.executeUpdate();

		PreparedStatement preparedStatement2 = connexion.prepareStatement("SELECT MAX(user_id) AS MAX_ID FROM tbl_user");
		ResultSet rs = preparedStatement2.executeQuery();
		if(rs.next()) {
		    u.setUser_id(rs.getInt("MAX_ID"));
		}
		preparedStatement.close();
		 } catch (SQLException e) {
		 e.printStackTrace();
		 }
		 return u;
		 }
	
	//retourne la liste de tout les pets
	public List<Pet> getPets() {
		 List < Pet > pets = new ArrayList < Pet > ();

		    Statement statement = null;
		    ResultSet resultat = null;
		    loadDatabase("pet--shop");
		    
		    try {
		    statement = connexion.createStatement();
		    // Exécution de la requête
		    resultat = statement.executeQuery("SELECT * FROM tbl_pet");
		    // Récupération des données
		    while (resultat.next()) {

		    
		    Pet pet = new Pet();
		    pet.setPet_name(resultat.getString("pet_name"));
		    pet.setPet_id(resultat.getInt("pet_id"));
		    pet.setPet_description(resultat.getString("pet_description"));
		    pet.setPet_category_id(resultat.getInt("pet_category_id"));
		    pet.setPet_images(resultat.getString("pet_images"));
		    pet.setPet_status(resultat.getString("pet_status"));
		    pet.setPrice(resultat.getDouble("price"));
		    pets.add(pet);
		    }
		    } catch (SQLException e) {
		    } finally {
		    // Fermeture de la connexion
		    try {
		    if (resultat != null)
		    resultat.close();
		    if (statement != null)
		    statement.close();
		    if (connexion != null)
		    connexion.close();
		    } catch (SQLException ignore) {
		    }
		    }
		    
		    return pets;
		}
 
	//retourne la liste de tout les categories
	public List<Category> getCategorys() {
	    List<Category> categorys = new ArrayList<Category>();

	    Statement statement = null;
	    ResultSet resultat = null;
	    
	    loadDatabase("pet--shop");
	    
	    try {
	    statement = connexion.createStatement();
	    // Exécution de la requête
	    resultat = statement.executeQuery("SELECT pet_category_id,pet_category_name FROM tbl_pet_category;");
	    // Récupération des données
	    while (resultat.next()) {
	    int pet_category_id = resultat.getInt("pet_category_id");
	    String pet_category_name = resultat.getString("pet_category_name");
	    
	    Category category = new Category();
	    category.setPet_category_id(pet_category_id);
	    category.setPet_category_name(pet_category_name);

	    categorys.add(category);
	    }
	    } catch (SQLException e) {
	    } finally {
	    // Fermeture de la connexion
	    try {
	    if (resultat != null)
	    resultat.close();
	    if (statement != null)
	    statement.close();
	    if (connexion != null)
	    connexion.close();
	    } catch (SQLException ignore) {
	    }
	    }
	    
	    return categorys;
	    }
	   
	
	//chargement de la base de donnees
	 private void loadDatabase(String Table) {
	 // Chargement du driver
	 try {
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 } catch (ClassNotFoundException e) {
	 }
	 try {
	 connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+Table, "root", "");
	 } catch (SQLException e) {
	 e.printStackTrace();
	 }
	 }
}
