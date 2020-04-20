package rest;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import service.ArticleService;
import service.NumericPrediction;
import rest.ClassifyInstance;
import weka.api.HelloWeka;
import weka.api.LoadSaveData;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.functions.SMO;
import weka.classifiers.trees.J48;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;
import weka.knowledgeflow.steps.Classifier;

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
	public String updateArticle(String inputParms) {
		try {
		JSONObject result = ArticleService.updateArticle(new JSONObject(inputParms));
		
		return result.toString();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "updateArticleAPI failed";	
	}	
	@GET
	@Path("/{id}/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String getArticle(@PathParam("id") Integer id) {

			
			JSONObject articles = ArticleService.getArticle(id);
			System.out.println(articles.toString());
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
	@Path("/results/")
	@Produces("text/plain")
	@Consumes("text/plain")
	public String getStuff(){
		String result;
			System.out.println("get file being used");
		try {
			//JSONObject result = new JSONObject(article);
			System.out.println("Try to Get File");
			LoadSaveData.main();
			result = LoadSaveData.getResults();
			//String result = "Works";

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("WekaAPI ClassifyInstance failed");
			e.printStackTrace();
			return "WekaAPI ClassifyInstance failed";
		}
		System.out.println(result);
		return "Result OutPut";

	}
	
	@GET
	@Path("/result/")
	@Produces("text/plain")
	@Consumes("text/plain")
	public String getResult(){
		//String result=NumericPrediction.numericPrediction();
//		System.out.println("ArticlesAPI getResults reached");
//		String result="";
//		try {
//			result = ArticleService.getResults();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//			System.out.println("get file being used");
//		try {
//			//JSONObject result = new JSONObject(article);
//			System.out.println("Try to Get File");
//			LoadSaveData.main();
//			result = LoadSaveData.getResults();
//
//			
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println("WekaAPI ClassifyInstance failed");
//			e.printStackTrace();
//			return "WekaAPI ClassifyInstance failed";
//		}
		String results = "Testing This Feature";
		
		System.out.println("main started");
		try {
			ClassifyInstance.main();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		
		System.out.println(results);
		return results;

	}	
	

}
 