package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getRoomsAction  extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
	    ActionContext ctx=ActionContext.getContext();
	    HttpServletRequest request = ServletActionContext.getRequest();
	    admin.Service adminService=new admin.Service();
	    List rooms=adminService.getRoomList();
	    request.setAttribute("rooms", rooms);
	    return SUCCESS;
	}
}
