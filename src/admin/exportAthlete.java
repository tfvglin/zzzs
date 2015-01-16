package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class exportAthlete extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
		List athleteExcel=adminService.getAthleteExcel();
	    request.setAttribute("athleteExcel", athleteExcel);
		return SUCCESS;
	}
}