package admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class subEmail extends ActionSupport
{
	private String idcard;
	private String email;
	public void setIdcard(String idcard) 
	{
		this.idcard = idcard; 
	}
	public String getIdcard()
	{
		return (this.idcard); 
	}
	public void setEmail(String email) 
	{
		this.email = email; 
	}
	public String getEmail()
	{
		return (this.email); 
	}
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
		adminService.updateEmail(email,idcard);
		request.setAttribute("email",email);
		request.setAttribute("idcard",idcard);
		return SUCCESS;
	}
}