package admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class delAthlete extends ActionSupport{
	private String idcard;
	public void setIdcard(String idcard) 
	{
		this.idcard = idcard; 
	}
	public String getIdcard()
	{
		return (this.idcard); 
	}
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
		adminService.deleteAthlete(idcard);
		String curPage="1";
		Map athletes=adminService.getAthleteList(curPage);
		request.setAttribute("pageInfo",athletes);
		return SUCCESS;
	}
}