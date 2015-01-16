package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AthletePersonalAction extends ActionSupport{
	private String xm;
	private String xbm;
	private String mzm;
	private String ssm;
	private String csrq;
	private String zzmmm;
	private String language;
	private String kslbm;
	private String xklb;
	public void setXm(String xm) 
	{
		this.xm = xm; 
	}
	public String getXm()
	{
		return (this.xm); 
	}
	public void setXbm(String xbm) 
	{
		this.xbm = xbm; 
	}
	public String getXbm()
	{
		return (this.xbm); 
	}
	public void setMzm(String mzm) 
	{
		this.mzm = mzm; 
	}
	public String getMzm()
	{
		return (this.mzm); 
	}
	public void setSsm(String ssm) 
	{
		this.ssm = ssm; 
	}
	public String getSsm()
	{
		return (this.ssm); 
	}
	public void setCsrq(String csrq) 
	{
		this.csrq = csrq; 
	}
	public String getCsrq()
	{
		return (this.csrq); 
	}
	public void setZzmmm(String zzmmm) 
	{
		this.zzmmm = zzmmm; 
	}
	public String getZzmmm()
	{
		return (this.zzmmm); 
	}
	public void setLanguage(String language) 
	{
		this.language = language; 
	}
	public String getLanguage()
	{
		return (this.language); 
	}
	public void setKslbm(String kslbm) 
	{
		this.kslbm = kslbm; 
	}
	public String getKslbm()
	{
		return (this.kslbm); 
	}
	public void setXklb(String xklb) 
	{
		this.xklb = xklb; 
	}
	public String getXklb()
	{
		return (this.xklb); 
	}
	@Override
	public String execute() throws Exception
	{
		user.Service userService=new user.Service();
		int iNo=-1;
		ActionContext ctx=ActionContext.getContext();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		iNo=userService.infoUtil("zsb_athlete",IDcard,getXm(),getXbm(),getMzm(),getSsm(),getCsrq(),getZzmmm(),getLanguage(),getKslbm(),getXklb());
		HttpServletRequest request = ServletActionContext.getRequest();
		String Name=userService.getName("zsb_athlete",IDcard);
		request.setAttribute("username", Name);
		String Mobile=userService.getMobile("zsb_athlete",IDcard);
		String Tel=userService.getTel("zsb_athlete",IDcard);
		String FirstRelation=userService.getFirstRelation("zsb_athlete",IDcard);
		request.setAttribute("firstrelation", FirstRelation);
		String Address=userService.getAddress("zsb_athlete",IDcard);
		String Post=userService.getPost("zsb_athlete",IDcard);		
		request.setAttribute("mobile", Mobile);
		request.setAttribute("hometel", Tel);
		request.setAttribute("homeaddress", Address);
		request.setAttribute("homepost", Post);
		String HighSchool=userService.getHighSchool("zsb_athlete",IDcard);
		request.setAttribute("highschool", HighSchool);
		String Project=userService.getProject("zsb_athlete",IDcard);
		request.setAttribute("project", Project);
		String Height=userService.getHeight("zsb_athlete",IDcard);
		request.setAttribute("height", Height);
		return SUCCESS;
	}
}
