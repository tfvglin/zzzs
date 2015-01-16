package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AthleteAppendAction extends ActionSupport{
	private String height;
	private String weight;
	private String strength;
	private String awards;
	public void setHeight(String height) 
	{
		this.height = height; 
	}
	public String getHeight()
	{
		return (this.height); 
	}
	public void setWeight(String weight) 
	{
		this.weight = weight; 
	}
	public String getWeight()
	{
		return (this.weight); 
	}
	public void setStrength(String strength) 
	{
		this.strength = strength; 
	}
	public String getStrength()
	{
		return (this.strength); 
	}
	public void setAwards(String awards) 
	{
		this.awards = awards; 
	}
	public String getAwards()
	{
		return (this.awards); 
	}
	@Override
	public String execute() throws Exception
	{
		user.Service userService=new user.Service();
		int iNo=-1;
		ActionContext ctx=ActionContext.getContext();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		iNo=userService.appendUtil("zsb_athlete",IDcard,getHeight(),getWeight(),getStrength(),getAwards());
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
		ctx.getSession().put("status","尚未提交高水平运动员申请表");
		return SUCCESS;
	}
}