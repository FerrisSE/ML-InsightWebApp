package model;

import java.sql.Connection;
import java.sql.PreparedStatement;


import org.json.JSONArray;
import org.json.JSONObject;

public class Category {

	int navigationID;
	String categoryName;
	String categoryImage;
	String categoryContent;
	int categoryVisible;
	int categoryOrder;
	
	public Category() {
	}
	
	public  JSONArray listCategories() {
		
		MSSQLConnection mssqlConnection = new MSSQLConnection();
		
		String sqlString = "SELECT * " +
  		"FROM "+mssqlConnection.getDatabase()+".dbo.Categories WITH (NOLOCK) "+
		"ORDER BY categoryOrder";
		
		SQLQuery sqlQuery = new SQLQuery();
		sqlQuery.setSqlString(sqlString); 
		
		return sqlQuery.lstQuery();
		
	}
		
	public  JSONArray listVisibleCategories() {
		
		MSSQLConnection mssqlConnection = new MSSQLConnection();
		
		String sqlString = "SELECT * " +
  		"FROM "+mssqlConnection.getDatabase()+".dbo.Categories WITH (NOLOCK) "+
		"WHERE categoryVisible= '1'"+" ORDER BY categoryOrder";

		SQLQuery sqlQuery = new SQLQuery();
		sqlQuery.setSqlString(sqlString); 
		
		return sqlQuery.lstQuery();
		
	}
	
	public JSONObject getCategory() {
		
		MSSQLConnection mssqlConnection = new MSSQLConnection();
		String sqlString = "SELECT * " +
				"FROM "+mssqlConnection.getDatabase()+".dbo.Categories WITH (NOLOCK) "+
				"WHERE navigationID = "+navigationID+"";
		
		SQLQuery sqlQuery = new SQLQuery();
		sqlQuery.setSqlString(sqlString); 
		
		return sqlQuery.getQuery();
	}
	
	
	public String updateCategory() {
		String message = "Category Updated";
	try {	
		MSSQLConnection mssqlConnection = new MSSQLConnection();
		Connection connection = mssqlConnection.getConnection();
		
		String update = "UPDATE "+mssqlConnection.getDatabase()+".dbo.Categories SET " +
				"categoryName=IsNull(Nullif(?,''), categoryName), categoryImage=IsNull(Nullif(?,''),categoryImage), " +
				 "categoryContent=IsNull(Nullif(?,''),categoryContent),"+"categoryOrder=IsNull(?,categoryOrder),"+"categoryVisible=IsNull(?,categoryVisible),"+
				"WHERE navigationID="+navigationID+"";
		PreparedStatement ps = connection.prepareStatement(update);
		
		
		ps.setString(1, categoryName);
		ps.setString(2, categoryImage);
		ps.setString(3, categoryContent);
		ps.setInt(4, categoryVisible);
		ps.setInt(5, categoryOrder);
		ps.executeUpdate();
		
    	try { if (ps!= null) ps.close(); } catch (Exception e) {};
    	try { if (connection != null) connection.close(); } catch (Exception e) {}; 
	
		
	} catch (Exception e) {
	    System.out.println(e.getMessage());
	}
	return message;
	}
	
	
	public String deleteCategory() {
		String message = "Category"+navigationID+" Deleted!";
	try {	
		MSSQLConnection mssqlConnection = new MSSQLConnection();
		Connection connection = mssqlConnection.getConnection();
		
		String delete = "DELETE FROM  "+mssqlConnection.getDatabase()+".dbo.Categories " +
				"WHERE navigationID="+navigationID;
		
		PreparedStatement ps = connection.prepareStatement(delete);
		
		ps.executeUpdate();
		
    	try { if (ps!= null) ps.close(); } catch (Exception e) {};
    	try { if (connection != null) connection.close(); } catch (Exception e) {}; 
	
		
	} catch (Exception e) {
	    System.out.println(e.getMessage());
	}
	return message;
	}
	
	
	public String addCategory() {
		String message = "Category Added!";
	try {	
		MSSQLConnection mssqlConnection = new MSSQLConnection();
		Connection connection = mssqlConnection.getConnection();
		
		String addCategory = "INSERT "+mssqlConnection.getDatabase()+".dbo.Categories " +
				"(categoryName, categoryImage, categoryContent categoryOrder, categoryVisible) VALUES (?,?,?,?)";
		
		PreparedStatement ps = connection.prepareStatement(addCategory);
		

		ps.setString(1, categoryName);
		ps.setString(2, categoryImage);
		ps.setString(3, categoryContent);
		ps.setInt(4, categoryOrder);
		ps.setInt(5, categoryVisible);



		ps.executeUpdate();
		
    	try { if (ps!= null) ps.close(); } catch (Exception e) {};
    	try { if (connection != null) connection.close(); } catch (Exception e) {}; 
	
		
	} catch (Exception e) {
	    System.out.println(e.getMessage());
	}
	return message;
	}
	
	
	public JSONArray listCatByNav(){

		MSSQLConnection mssqlConnnection = new MSSQLConnection();
		
		String sqlString = "SELECT * " +
			"FROM "+mssqlConnnection.getDatabase()+".dbo.Categories with (NOLOCK) "+
			"WHERE categoryVisible = '1' AND navigationID = '"+navigationID+"' ORDER BY categoryOrder";

		SQLQuery sqlQuery = new SQLQuery();
		sqlQuery.setSqlString(sqlString);
		
		return sqlQuery.lstQuery();

	}
	
	
	
	//Getters and Setters
	
	public int getNavigationID() {
		return navigationID;
	}

	public void setNavigationID(int navigationID) {
		this.navigationID = navigationID;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryImage() {
		return categoryImage;
	}

	public void setCategoryImage(String categoryImage) {
		this.categoryImage = categoryImage;
	}

	public int getCategoryVisible() {
		return categoryVisible;
	}

	public void setCategoryVisible(int categoryVisible) {
		this.categoryVisible = categoryVisible;
	}

	public int getCategoryOrder() {
		return categoryOrder;
	}

	public void setCategoryOrder(int categoryOrder) {
		this.categoryOrder = categoryOrder;
	}

	public String getCategoryContent() {
		return categoryContent;
	}

	public void setCategoryContent(String categoryContent) {
		this.categoryContent = categoryContent;
	}
	
}
