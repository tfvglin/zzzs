package admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class grantAthleteAction  extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
		int iNo=adminService.AdmissionGrant("zsb_athlete","��");
		request.setAttribute("messageInfo","���ųɹ�");
		request.setAttribute("display","iframe");
		request.setAttribute("forward","getAthletes");
		return SUCCESS;
	}
}
