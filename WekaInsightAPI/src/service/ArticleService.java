package service;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.Article;
import weka.api.ClassifyInstance;

public class ArticleService {

	public static JSONArray listArticles() {
		JSONArray articles = new JSONArray();
		
		Article article = new Article();
		articles = article.listArticles();
		
		return articles;
	}
	
	/*
	public static String listArticles() throws Exception{
	//	JSONArray articles = new JSONArray();
		
	//	Article article = new Article();
	//	articles = article.listArticles();
		
		return ClassifyInstance.getTestResult();
	}
	*/
	
	public static JSONObject updateArticle(){
		
		String message = " ";
		
		JSONObject result = new JSONObject();
			
			try {
				Article article =new Article();
				article.setTestID(1);
				article.setTestTitle("Test 8");
				article.setTestResult("");
				
				message = article.updateArticle();
			
				result.put("message", message);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}
	public static JSONObject getArticle() {
		JSONObject articleJO = new JSONObject();
		
		Article article = new Article();
		article.setTestID(1);
		
		articleJO = article.getArticle();
		
		return articleJO;
	}
	
	
	public static JSONObject addArticle(JSONObject inputParms){
		
		String message = " ";
		
		JSONObject result = new JSONObject();
			
			try {
				
				String testTitle = inputParms.getString("testTitle");
				String testResult = inputParms.getString("testResult");
				int userID = inputParms.getInt("userID");
				int categoryID = inputParms.getInt("categoryID");

				
				Article article =new Article();
				article.setTestTitle(testTitle);
				article.setTestResult(testResult);
				article.setUserID(userID);
				article.setArticleVisible(1);
				article.setCategoryID(categoryID);
				
				message = article.addArticle();
			
				result.put("message", message);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}
	


}
