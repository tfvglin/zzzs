package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getRecommendSpecialty extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		user.Service userService=new user.Service();
		int iNo=-1;
		ActionContext ctx=ActionContext.getContext();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		HttpServletRequest request = ServletActionContext.getRequest();
		String Name=userService.getName("zsb_recommend",IDcard);
		request.setAttribute("username", Name);
		String Mobile=userService.getMobile("zsb_recommend",IDcard);
		String FirstRelation=userService.getFirstRelation("zsb_recommend",IDcard);
		String HighSchool=userService.getHighSchool("zsb_recommend",IDcard);
		String Project=userService.getProject("zsb_recommend",IDcard);
		String Level=userService.getLevel("zsb_recommend",IDcard);
		String getTime=userService.getGetTime("zsb_recommend",IDcard);
		String Height=userService.getHeight("zsb_recommend",IDcard);
		request.setAttribute("mobile", Mobile);
		request.setAttribute("firstrelation", FirstRelation);
		request.setAttribute("highschool", HighSchool);
		request.setAttribute("specialty", Project);
		request.setAttribute("level", Level);
		request.setAttribute("gettime", getTime);
		request.setAttribute("height", Height);	
		return SUCCESS;
	}
}
