package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import weka.api.ClassifyInstance;

public class Article {
	int testID;
	int userID;
	String testTitle;
	String testResult;
	Date articleCreateDate;
	int articleVisible;
	int categoryID;
	
	public Article() {
		
	}
	public Article(int testID, int userID, String testTitle, String testResult) {
		this.testID = testID;
		this.userID = userID;
		this.testTitle = testTitle;
		this.testResult = testResult;

		
	}

	public JSONArray listArticles() {
		
		JSONObject articleJSONObject = null;
		JSONArray articlesJSONArray = new JSONArray();
		try {
			
			MSSQLConnection mssqlConnection = new MSSQLConnection();
			Connection connection = mssqlConnection.getConnection();
		Statement stmt = connection.createStatement(
					java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE, java.sql.ResultSet.CONCUR_READ_ONLY);
			
			String articlesQuery = "SELECT * " +
			  		"FROM SENG315FinalProjectAdmin.dbo.articles WITH (NOLOCK) ";
			
				java.sql.ResultSet articlesResults = stmt.executeQuery(articlesQuery);
			
						
				while(articlesResults.next()){
					
					articleJSONObject = new JSONObject();
					
					String testID = articlesResults.getString("testID").trim();
					String userID = articlesResults.getString("userID").trim();
					String testTitle = articlesResults.getString("testTitle").trim();
					String testResult = articlesResults.getString("testResult").trim();

					articleJSONObject.put("testID",testID);
					articleJSONObject.put("userID",userID);
					articleJSONObject.put("testTitle",testTitle);
					articleJSONObject.put("testResult",testResult);
					
					articlesJSONArray.put(articleJSONObject	);
					
				}
				System.out.println(articlesJSONArray);
		    
			//Close Connections
			try { if (articlesResults != null) articlesResults.close(); } catch (Exception e) {}; 
	    	try { if (stmt!= null) stmt.close(); } catch (Exception e) {};
	    	try { if (connection != null) connection.close(); } catch (Exception e) {}; 
		
		} catch (Exception e) {
		    System.out.println(e.getMessage());
		}
		
		return articlesJSONArray;
	}
	
	
	/*
	public String listArticles() throws Exception{
		String testResult = ClassifyInstance.getTestResult();
		System.out.println(testResult);
		return testResult;
	}
	*/
	
	public String updateArticle() {
		String message = "Article Updated";
	try {	
		MSSQLConnection mssqlConnection = new MSSQLConnection();
		Connection connection = mssqlConnection.getConnection();
		
		String updateArticle = "UPDATE SENG315FinalProjectAdmin.dbo.articles SET " +
				"testTitle=IsNull(Nullif(?,''), testTitle), testResult=IsNull(Nullif(?,''),testResult) " +
				"WHERE testID="+testID+"";
		PreparedStatement ps = connection.prepareStatement(updateArticle);
		ps.setString(1, testTitle);
		ps.setString(2, testResult);
		ps.executeUpdate();
		
    	try { if (ps!= null) ps.close(); } catch (Exception e) {};
    	try { if (connection != null) connection.close(); } catch (Exception e) {}; 
	
		
	} catch (Exception e) {
	    System.out.println(e.getMessage());
	}
	return message;
	}
	
	public JSONObject getArticle() {
		
		JSONObject articleJSONObject = null;

		try {
			
			MSSQLConnection mssqlConnection = new MSSQLConnection();
			Connection connection = mssqlConnection.getConnection();
			Statement stmt = connection.createStatement(
					java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE, java.sql.ResultSet.CONCUR_READ_ONLY);
			
			String articlesQuery = "SELECT * " +
			  		"FROM SENG315FinalProjectAdmin.dbo.articles WITH (NOLOCK) " + 
					"WHERE article = "+testID+"";
			
				java.sql.ResultSet articlesResults = stmt.executeQuery(articlesQuery);
	
				while(articlesResults.next()){
					
					articleJSONObject = new JSONObject();
					
					String testID = articlesResults.getString("testID").trim();
					String userID = articlesResults.getString("userID").trim();
					String testTitle = articlesResults.getString("testTitle").trim();
					String testResult = articlesResults.getString("testResult").trim();

					articleJSONObject.put("testID",testID);
					articleJSONObject.put("userID",userID);
					articleJSONObject.put("testTitle",testTitle);
					articleJSONObject.put("testResult",testResult);
					

					
				}

			//Close Connections
			try { if (articlesResults != null) articlesResults.close(); } catch (Exception e) {}; 
	    	try { if (stmt!= null) stmt.close(); } catch (Exception e) {};
	    	try { if (connection != null) connection.close(); } catch (Exception e) {}; 
		
		} catch (Exception e) {
		    System.out.println(e.getMessage());
		}
		
		return articleJSONObject;
	}
	

	public String addArticle() {
		String message = "Article Added!";
	try {	
		MSSQLConnection mssqlConnection = new MSSQLConnection();
		Connection connection = mssqlConnection.getConnection();
		
		String addArticle = "INSERT SENG315FinalProjectAdmin.dbo.articles " +
				"(userID, testTitle, testResult, articleCreateDate, articleVisible, categoryID) VALUES (?,?,?,?,?,?)";

		PreparedStatement ps = connection.prepareStatement(addArticle);
		
		Date date = new Date();
		
		ps.setInt(1, userID);
		ps.setString(2, testTitle);
		ps.setString(3, testResult);
		ps.setTimestamp(4, new java.sql.Timestamp(date.getTime()));
		ps.setInt(5, articleVisible);
		ps.setInt(6, categoryID);



		ps.executeUpdate();
		
    	try { if (ps!= null) ps.close(); } catch (Exception e) {};
    	try { if (connection != null) connection.close(); } catch (Exception e) {}; 
	
		
	} catch (Exception e) {
	    System.out.println(e.getMessage());
	}
	return message;
	}

	
	public int getTestID() {
		return testID;
	}

	public void setTestID(int testID) {
		this.testID = testID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getTestTitle() {
		return testTitle;
	}

	public void setTestTitle(String testTitle) {
		this.testTitle = testTitle;
	}

	public String getTestResult() {
		return testResult;
	}

	public void setTestResult(String testResult) {
		this.testResult = testResult;
	}
	public Date getArticleCreateDate() {
		return articleCreateDate;
	}
	public void setArticleCreateDate(Date articleCreateDate) {
		this.articleCreateDate = articleCreateDate;
	}
	public int getArticleVisible() {
		return articleVisible;
	}
	public void setArticleVisible(int articleVisible) {
		this.articleVisible = articleVisible;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	
}
