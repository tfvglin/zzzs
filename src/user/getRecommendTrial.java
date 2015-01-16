package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getRecommendTrial extends ActionSupport
{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		String Status=userService.getStatus(IDcard);
		request.setAttribute("messageInfo", Status);
		request.setAttribute("display","iframe");
		request.setAttribute("forward","/home/recommend.jsp");
		return SUCCESS;
	}
}