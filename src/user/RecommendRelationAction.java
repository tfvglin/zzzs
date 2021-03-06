package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RecommendRelationAction extends ActionSupport{
	private String firstrelation;
	private String firstname;
	private String firstunit;
	private String firstedu;
	private String firsttel;
	private String secondrelation;
	private String secondname;
	private String secondunit;
	private String secondedu;
	private String secondtel;
	public void setFirstrelation(String firstrelation) 
	{
		this.firstrelation = firstrelation; 
	}
	public String getFirstrelation()
	{
		return (this.firstrelation); 
	}
	public void setFirstname(String firstname) 
	{
		this.firstname = firstname; 
	}
	public String getFirstname()
	{
		return (this.firstname); 
	}
	public void setFirstunit(String firstunit) 
	{
		this.firstunit = firstunit; 
	}
	public String getFirstunit()
	{
		return (this.firstunit); 
	}
	public void setFirstedu(String firstedu) 
	{
		this.firstedu = firstedu; 
	}
	public String getFirstedu()
	{
		return (this.firstedu); 
	}
	public void setFirsttel(String firsttel) 
	{
		this.firsttel = firsttel; 
	}
	public String getFirsttel()
	{
		return (this.firsttel); 
	}
	public void setSecondrelation(String secondrelation) 
	{
		this.secondrelation = secondrelation; 
	}
	public String getSecondrelation()
	{
		return (this.secondrelation); 
	}
	public void setSecondname(String secondname) 
	{
		this.secondname = secondname; 
	}
	public String getSecondname()
	{
		return (this.secondname); 
	}
	public void setSecondunit(String secondunit) 
	{
		this.secondunit = secondunit; 
	}
	public String getSecondunit()
	{
		return (this.secondunit); 
	}
	public void setSecondedu(String secondedu) 
	{
		this.secondedu = secondedu; 
	}
	public String getSecondedu()
	{
		return (this.secondedu); 
	}
	public void setSecondtel(String secondtel) 
	{
		this.secondtel = secondtel; 
	}
	public String getSecondtel()
	{
		return (this.secondtel); 
	}
	@Override
	public String execute() throws Exception
	{
		user.Service userService=new user.Service();
		int iNo=-1;
		ActionContext ctx=ActionContext.getContext();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		iNo=userService.relationUtil("zsb_recommend",IDcard,getFirstrelation(),getFirstname(),getFirstunit(),getFirstedu(),getFirsttel(),getSecondrelation(),getSecondname(),getSecondunit(),getSecondedu(),getSecondtel());
		HttpServletRequest request = ServletActionContext.getRequest();
		String Name=userService.getName("zsb_recommend",IDcard);
		request.setAttribute("username", Name);
		String Mobile=userService.getMobile("zsb_recommend",IDcard);
		String Tel=userService.getTel("zsb_recommend",IDcard);
		String Address=userService.getAddress("zsb_recommend",IDcard);
		String Post=userService.getPost("zsb_recommend",IDcard);		
		request.setAttribute("mobile", Mobile);
		request.setAttribute("hometel", Tel);
		request.setAttribute("homeaddress", Address);
		request.setAttribute("homepost", Post);	
		String HighSchool=userService.getHighSchool("zsb_recommend",IDcard);
		request.setAttribute("highschool", HighSchool);
		String HighLink=userService.getHighLink("zsb_recommend",IDcard);
		String HighDepartment=userService.getHighDepartment("zsb_recommend",IDcard);
		String HighTel=userService.getHighLinkTel("zsb_recommend",IDcard);
		String HighAddress=userService.getHighAddress("zsb_recommend",IDcard);
		String HighPost=userService.getHighPost("zsb_recommend",IDcard);
		String HighBegin=userService.getHighBegin("zsb_recommend",IDcard);
		String HighEnd=userService.getHighEnd("zsb_recommend",IDcard);
		String MidSchool=userService.getMidSchool("zsb_recommend",IDcard);
		String MidLink=userService.getMidLink("zsb_recommend",IDcard);
		String MidBegin=userService.getMidBegin("zsb_recommend",IDcard);
		String MidEnd=userService.getMidEnd("zsb_recommend",IDcard);
		request.setAttribute("highlink", HighLink);
		request.setAttribute("highdepartment", HighDepartment);
		request.setAttribute("hightel", HighTel);
		request.setAttribute("highaddress", HighAddress);
		request.setAttribute("highpost", HighPost);
		request.setAttribute("highbegin", HighBegin);
		request.setAttribute("highend", HighEnd);
		request.setAttribute("midschool", MidSchool);
		request.setAttribute("midlink", MidLink);
		request.setAttribute("midbegin", MidBegin);
		request.setAttribute("midend", MidEnd);
		String Project=userService.getProject("zsb_recommend",IDcard);
		request.setAttribute("project", Project);
		String Height=userService.getHeight("zsb_recommend",IDcard);
		request.setAttribute("height", Height);
		return SUCCESS;
	}
}