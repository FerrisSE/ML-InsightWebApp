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

@Path("/articles")
public class ArticlesAPI {
	
	@GET
	@Path("/list/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String listArticles() {
		System.out.println("Testing...");
			JSONArray articles = ArticleService.listArticles();
			
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

}
 