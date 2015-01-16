package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RecommendSpecialtyAction extends ActionSupport{
	private String project;
	private String level;
	private String gettime;
	public void setProject(String project) 
	{
		this.project = project; 
	}
	public String getProject()
	{
		return (this.project); 
	}
	public void setLevel(String level) 
	{
		this.level = level; 
	}
	public String getLevel()
	{
		return (this.level); 
	}
	public void setGettime(String gettime) 
	{
		this.gettime = gettime; 
	}
	public String getGettime()
	{
		return (this.gettime); 
	}
	@Override
	public String execute() throws Exception
	{
		user.Service userService=new user.Service();
		int iNo=-1;
		ActionContext ctx=ActionContext.getContext();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		iNo=userService.projectUtil("zsb_recommend",IDcard,getProject(),getLevel(),getGettime());
		HttpServletRequest request = ServletActionContext.getRequest();
		String Name=userService.getName("zsb_recommend",IDcard);
		request.setAttribute("username", Name);
		String Mobile=userService.getMobile("zsb_recommend",IDcard);
		String FirstRelation=userService.getFirstRelation("zsb_recommend",IDcard);
		String HighSchool=userService.getHighSchool("zsb_recommend",IDcard);
		String Project=userService.getProject("zsb_recommend",IDcard);
		String Height=userService.getHeight("zsb_recommend",IDcard);
		request.setAttribute("mobile", Mobile);
		request.setAttribute("firstrelation", FirstRelation);
		request.setAttribute("highschool", HighSchool);
		request.setAttribute("project", Project);
		request.setAttribute("height", Height);	
		String Weight=userService.getWeight("zsb_recommend",IDcard);
		request.setAttribute("weight", Weight);	
		String Strength=userService.getStrength("zsb_recommend",IDcard);
		request.setAttribute("strength", Strength);	
		String Awards=userService.getAwards("zsb_recommend",IDcard);
		request.setAttribute("awards", Awards);	
		return SUCCESS;
	}
}