package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ConfirmAthleteAction extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		String Year=userService.getYear();
		String Specialty=userService.getProject("zsb_athlete",IDcard);
		String Province=userService.getProvince("zsb_athlete",IDcard);
		String Subject=userService.getSubject("zsb_athlete",IDcard);
		userService.submitUtil("zsb_athlete",IDcard,Year,Specialty,Province,Subject);
		ctx.getSession().put("status","已提交高水平运动员报名申请表");
		return SUCCESS;
	}
}