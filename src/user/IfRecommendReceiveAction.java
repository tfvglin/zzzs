package user;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IfRecommendReceiveAction extends ActionSupport
{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		String Status=userService.getStatus(IDcard);
		if(!Status.equals("��ˮƽ�˶�Ա�����ѼĴ�")) Status="��ˮƽ�˶�Ա����δ�Ĵ�";
		request.setAttribute("messageInfo", Status);
		request.setAttribute("display","iframe");
		request.setAttribute("forward","/home/recommend.jsp");
		return SUCCESS;
	}
}