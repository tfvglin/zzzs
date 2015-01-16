package admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class searchAccount extends ActionSupport
{
	private String idcard;
	public void setIdcard(String idcard)
	{
		this.idcard = idcard;
	}
	public String getIdcard()
	{
		return this.idcard;
	}
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();	
        request.setAttribute("idcard", idcard);
		String Email=adminService.searchEmail(idcard);
		request.setAttribute("email", Email);
		return SUCCESS;
	}
}