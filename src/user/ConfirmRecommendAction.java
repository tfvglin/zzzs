package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ConfirmRecommendAction extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		String Year=userService.getYear();
		String Specialty=userService.getProject("zsb_recommend",IDcard);
		String Province=userService.getProvince("zsb_recommend",IDcard);
		String Subject=userService.getSubject("zsb_recommend",IDcard);
		userService.submitUtil("zsb_recommend",IDcard,Year,Specialty,Province,Subject);
		ctx.getSession().put("status","已提交保送生报名申请表");
		return SUCCESS;
	}
}