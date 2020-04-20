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

import service.NavigationService;
@Path("/navigations")
public class NavigationsAPI {

	@GET
	@Path("/listvisible/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String listVisibleNavigations() {
			JSONArray navigations = NavigationService.listVisibleNavigations();
			
			return navigations.toString();
	}
	
	
	@GET
	@Path("/list/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String listNavigations() {
			JSONArray navigations = NavigationService.listNavigations();
			
			return navigations.toString();
	}	
	@POST
	@Path("/update/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String updateNavigation(String inputParms) {
		try {
		JSONObject result = NavigationService.updateNavigation(new JSONObject(inputParms));
		
		return result.toString();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "updateNavigationAPI failed";	
	}	
	@GET
	@Path("/{id}/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String getNavigation(@PathParam("id") Integer id) {

			
			JSONObject navigations = NavigationService.getNavigation(id);
			System.out.println(navigations.toString());
			return navigations.toString();
	}	
	@POST
	@Path("/add/")
	@Produces("application/JSON")
	@Consumes("application/JSON")
	public String addNavigation(String inputParms) {

		try {
			JSONObject result = NavigationService.addNavigation(new JSONObject(inputParms));
			return result.toString();

		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "addNavigationAPI failed";

	}	
	
	
}
