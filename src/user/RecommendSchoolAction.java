package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RecommendSchoolAction extends ActionSupport{
	private String highschool;
	private String highlink;
	private String highdepartment;
	private String highlinktel;
	private String highaddress;
	private String highpost;
	private String highbegin;
	private String highend;
	private String midschool;
	private String midlink;
	private String midbegin;
	private String midend;
	public void setHighschool(String highschool) 
	{
		this.highschool = highschool; 
	}
	public String getHighschool()
	{
		return (this.highschool); 
	}
	public void setHighlink(String highlink) 
	{
		this.highlink = highlink; 
	}
	public String getHighlink()
	{
		return (this.highlink); 
	}
	public void setHighdepartment(String highdepartment) 
	{
		this.highdepartment = highdepartment; 
	}
	public String getHighdepartment()
	{
		return (this.highdepartment); 
	}
	public void setHighlinktel(String highlinktel) 
	{
		this.highlinktel = highlinktel; 
	}
	public String getHighlinktel()
	{
		return (this.highlinktel); 
	}
	public void setHighaddress(String highaddress) 
	{
		this.highaddress = highaddress; 
	}
	public String getHighaddress()
	{
		return (this.highaddress); 
	}
	public void setHighpost(String highpost) 
	{
		this.highpost = highpost; 
	}
	public String getHighpost()
	{
		return (this.highpost); 
	}
	public void setHighbegin(String highbegin) 
	{
		this.highbegin = highbegin; 
	}
	public String getHighbegin()
	{
		return (this.highbegin); 
	}
	public void setHighend(String highend) 
	{
		this.highend = highend; 
	}
	public String getHighend()
	{
		return (this.highend); 
	}
	public void setMidschool(String midschool) 
	{
		this.midschool = midschool; 
	}
	public String getMidschool()
	{
		return (this.midschool); 
	}
	public void setMidlink(String midlink) 
	{
		this.midlink = midlink; 
	}
	public String getMidlink()
	{
		return (this.midlink); 
	}
	public void setMidbegin(String midbegin) 
	{
		this.midbegin = midbegin; 
	}
	public String getMidbegin()
	{
		return (this.midbegin); 
	}
	public void setMidend(String midend) 
	{
		this.midend = midend; 
	}
	public String getMidend()
	{
		return (this.midend); 
	}
	@Override
	public String execute() throws Exception
	{
		user.Service userService=new user.Service();
		int iNo=-1;
		ActionContext ctx=ActionContext.getContext();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		iNo=userService.studyUtil("zsb_recommend",IDcard,getHighschool(),getHighlink(),getHighdepartment(),getHighlinktel(),getHighaddress(),getHighpost(),getHighbegin(),getHighend(),getMidschool(),getMidlink(),getMidbegin(),getMidend());
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