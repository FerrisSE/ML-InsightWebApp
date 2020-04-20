package rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import service.CategoryService;
@Path("/categories")
public class CategoryAPI {

	
	@GET
	@Path("/list/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String listCategories() {
			JSONArray categories = CategoryService.listCategories();
			
			return categories.toString();
	}	
	@POST
	@Path("/update/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String updateCategory(String inputParms) {
		try {
		JSONObject result = CategoryService.updateCategory(new JSONObject(inputParms));
		
		return result.toString();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "updateCategoryAPI failed";	
	}	
	@GET
	@Path("/{id}/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String getCategory(@PathParam("id") Integer id) {

			
			JSONObject categories = CategoryService.getCategory(id);
			System.out.println(categories.toString());
			return categories.toString();
	}	
	@POST
	@Path("/add/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String addCategory(String inputParms) {

		try {
			JSONObject result = CategoryService.addCategory(new JSONObject(inputParms));
			return result.toString();

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "addCategoryAPI failed";

	}	
	
	
}
