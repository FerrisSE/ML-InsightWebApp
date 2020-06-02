package rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import service.ArticleService;
import weka.api.ClassifyInstance;

@Path("/articles")
public class ArticlesAPI {
	
	@GET
	@Path("/list/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String listArticles() {
		System.out.println("Testing...");
			JSONArray articles = ArticleService.listArticles();
		//JSONArray articles = ClassifyInstance	
		
		
			return articles.toString();
		
	}	
	
	@POST
	@Path("/update/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String updateArticle() {

		JSONObject result = ArticleService.updateArticle();
		
		return result.toString();

	}	
	@GET
	@Path("/{id}/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String getArticle() {

			JSONObject articles = ArticleService.getArticle();
			
			return articles.toString();
	}	
	@POST
	@Path("/add/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String addArticle(String inputParms) {

		try {
			JSONObject result = ArticleService.addArticle(new JSONObject(inputParms));
			return result.toString();

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "addArticleAPI failed";

	}	
	
	
	@GET
	@Path("/classify/")
	@Produces("text/plain")
	@Consumes("text/plain")
	public String getFile(){
			System.out.println("get file being used");
		try {
			//JSONObject result = new JSONObject(ClassifyInstance.getTestResult());
			String result = ClassifyInstance.getTestResult();
			return result;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("WekaAPI ClassifyInstance failed");
			e.printStackTrace();
			return "WekaAPI ClassifyInstance failed";
		}
		


	}	


	
	
	
	@GET
	@Path("/result/")
	@Produces("String")
	@Consumes("String")
	public String getResult(){

		try {
			//JSONObject result = new JSONObject(ClassifyInstance.getTestResult());
			String result = ClassifyInstance.getTestResult();
			String results = "testResults:"+result+"";

			//String result = ClassifyInstance.getTestResult();
			System.out.println(result);
			return result;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("WekaAPI ClassifyInstance failed");
			e.printStackTrace();
			return "WekaAPI ClassifyInstance failed";
		}
		


	}	

}
 