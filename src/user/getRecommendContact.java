package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getRecommendContact extends ActionSupport{
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
		String Tel=userService.getTel("zsb_recommend",IDcard);
		String FirstRelation=userService.getFirstRelation("zsb_recommend",IDcard);
		request.setAttribute("firstrelation", FirstRelation);
		String Address=userService.getAddress("zsb_recommend",IDcard);
		String Post=userService.getPost("zsb_recommend",IDcard);		
		request.setAttribute("mobile", Mobile);
		request.setAttribute("hometel", Tel);
		request.setAttribute("homeaddress", Address);
		request.setAttribute("homepost", Post);
		String HighSchool=userService.getHighSchool("zsb_recommend",IDcard);
		request.setAttribute("highschool", HighSchool);
		String Project=userService.getProject("zsb_recommend",IDcard);
		request.setAttribute("project", Project);
		String Height=userService.getHeight("zsb_recommend",IDcard);
		request.setAttribute("height", Height);
		return SUCCESS;
	}
}
