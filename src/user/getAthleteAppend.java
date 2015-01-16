package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getAthleteAppend extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		user.Service userService=new user.Service();
		int iNo=-1;
		ActionContext ctx=ActionContext.getContext();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		HttpServletRequest request = ServletActionContext.getRequest();
		String Name=userService.getName("zsb_athlete",IDcard);
		request.setAttribute("username", Name);
		String Mobile=userService.getMobile("zsb_athlete",IDcard);
		String FirstRelation=userService.getFirstRelation("zsb_athlete",IDcard);
		String HighSchool=userService.getHighSchool("zsb_athlete",IDcard);
		String Project=userService.getProject("zsb_athlete",IDcard);
		String Height=userService.getHeight("zsb_athlete",IDcard);
		request.setAttribute("mobile", Mobile);
		request.setAttribute("firstrelation", FirstRelation);
		request.setAttribute("highschool", HighSchool);
		request.setAttribute("project", Project);
		request.setAttribute("height", Height);	
		String Weight=userService.getWeight("zsb_athlete",IDcard);
		request.setAttribute("weight", Weight);	
		String Strength=userService.getStrength("zsb_athlete",IDcard);
		request.setAttribute("strength", Strength);	
		String Awards=userService.getAwards("zsb_athlete",IDcard);
		request.setAttribute("awards", Awards);	
		return SUCCESS;
	}
}
