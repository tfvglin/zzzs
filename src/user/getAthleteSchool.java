package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getAthleteSchool extends ActionSupport{
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
		String Tel=userService.getTel("zsb_athlete",IDcard);
		String Address=userService.getAddress("zsb_athlete",IDcard);
		String Post=userService.getPost("zsb_athlete",IDcard);		
		request.setAttribute("mobile", Mobile);
		request.setAttribute("hometel", Tel);
		request.setAttribute("homeaddress", Address);
		request.setAttribute("homepost", Post);	
		String HighSchool=userService.getHighSchool("zsb_athlete",IDcard);
		request.setAttribute("highschool", HighSchool);
		String HighLink=userService.getHighLink("zsb_athlete",IDcard);
		String HighDepartment=userService.getHighDepartment("zsb_athlete",IDcard);
		String HighTel=userService.getHighLinkTel("zsb_athlete",IDcard);
		String HighAddress=userService.getHighAddress("zsb_athlete",IDcard);
		String HighPost=userService.getHighPost("zsb_athlete",IDcard);
		String HighBegin=userService.getHighBegin("zsb_athlete",IDcard);
		String HighEnd=userService.getHighEnd("zsb_athlete",IDcard);
		String MidSchool=userService.getMidSchool("zsb_athlete",IDcard);
		String MidLink=userService.getMidLink("zsb_athlete",IDcard);
		String MidBegin=userService.getMidBegin("zsb_athlete",IDcard);
		String MidEnd=userService.getMidEnd("zsb_athlete",IDcard);
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
		String Project=userService.getProject("zsb_athlete",IDcard);
		request.setAttribute("project", Project);
		String Height=userService.getHeight("zsb_athlete",IDcard);
		request.setAttribute("height", Height);
		String FirstRelation=userService.getFirstRelation("zsb_athlete",IDcard);
		request.setAttribute("firstrelation", FirstRelation);
		return SUCCESS;
	}
}
