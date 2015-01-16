package admin;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class subAthleteStatusAction extends ActionSupport
{
	private String idcard;
	private String status;
	public void setIdcard(String idcard) 
	{
		this.idcard = idcard; 
	}
	public String getIdcard()
	{
		return (this.idcard); 
	}
	public void setStatus(String status) 
	{
		this.status = status; 
	}
	public String getStatus()
	{
		return (this.status); 
	}
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
		adminService.updateStatusUtil("zsb_athlete",status,idcard);
		request.setAttribute("idcard", idcard);
		user.Service userService=new user.Service();
		String Name=userService.getName("zsb_athlete",idcard);
		request.setAttribute("name", Name);
		String Province=userService.getProvince("zsb_athlete",idcard);
		request.setAttribute("province", Province);
		String Subject=userService.getSubject("zsb_athlete",idcard);
		request.setAttribute("subject", Subject);
		String HighSchool=userService.getHighSchool("zsb_athlete",idcard);
		request.setAttribute("highschool", HighSchool);
		String Number=userService.getNumber("zsb_athlete",idcard);
		request.setAttribute("number", Number);	
		String Status=userService.getStatus(idcard);
		request.setAttribute("status", Status);	
		return SUCCESS;
	}
}