package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

public class Article {
	int articleID;
	int articleAuthorID;
	String articleTitle;
	String articleContent;
	Date articleCreateDate;
	int articleVisible;
	int categoryID;
	
	public Article() {
		
	}
	public Article(int articleID, int articleAuthorID, String articleTitle, String articleContent) {
		this.articleID = articleID;
		this.articleAuthorID = articleAuthorID;
		this.articleTitle = articleTitle;
		this.articleContent = articleContent;

		
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
					
					String articleID = articlesResults.getString("articleID").trim();
					String articleAuthorID = articlesResults.getString("articleAuthorID").trim();
					String articleTitle = articlesResults.getString("articleTitle").trim();
					String articleContent = articlesResults.getString("articleContent").trim();

					articleJSONObject.put("articleID",articleID);
					articleJSONObject.put("articleAuthorID",articleAuthorID);
					articleJSONObject.put("articleTitle",articleTitle);
					articleJSONObject.put("articleContent",articleContent);
					
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
	
	public String updateArticle() {
		String message = "Article Updated";
	try {	
		MSSQLConnection mssqlConnection = new MSSQLConnection();
		Connection connection = mssqlConnection.getConnection();
		
		String updateArticle = "UPDATE SENG315FinalProjectAdmin.dbo.articles SET " +
				"articleTitle=IsNull(Nullif(?,''), articleTitle), articleContent=IsNull(Nullif(?,''),articleContent) " +
				"WHERE articleID="+articleID+"";
		PreparedStatement ps = connection.prepareStatement(updateArticle);
		ps.setString(1, articleTitle);
		ps.setString(2, articleContent);
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
					"WHERE article = "+articleID+"";
			
				java.sql.ResultSet articlesResults = stmt.executeQuery(articlesQuery);
	
				while(articlesResults.next()){
					
					articleJSONObject = new JSONObject();
					
					String articleID = articlesResults.getString("articleID").trim();
					String articleAuthorID = articlesResults.getString("articleAuthorID").trim();
					String articleTitle = articlesResults.getString("articleTitle").trim();
					String articleContent = articlesResults.getString("articleContent").trim();

					articleJSONObject.put("articleID",articleID);
					articleJSONObject.put("articleAuthorID",articleAuthorID);
					articleJSONObject.put("articleTitle",articleTitle);
					articleJSONObject.put("articleContent",articleContent);
					

					
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
				"(articleAuthorID, articleTitle, articleContent, articleCreateDate, articleVisible, categoryID) VALUES (?,?,?,?,?,?)";
		
		PreparedStatement ps = connection.prepareStatement(addArticle);
		
		Date date = new Date();
		
		ps.setInt(1, articleAuthorID);
		ps.setString(2, articleTitle);
		ps.setString(3, articleContent);
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

	
	public int getArticleID() {
		return articleID;
	}

	public void setArticleID(int articleID) {
		this.articleID = articleID;
	}

	public int getArticleAuthorID() {
		return articleAuthorID;
	}

	public void setArticleAuthorID(int articleAuthorID) {
		this.articleAuthorID = articleAuthorID;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
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
