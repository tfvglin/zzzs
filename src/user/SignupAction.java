package user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SignupAction extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
		List signups=userService.getSignupList();
		request.setAttribute("signups", signups);
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		String Status=userService.getStatus(IDcard);
		if(Status.equals("高水平运动员初审通过")){
			String athleteAdmission=userService.getIfAdmission("zsb_athlete_admission");			
			ctx.getSession().put("athleteAdmission", athleteAdmission);				
		}
		else if(Status.equals("保送生初审通过")){
			String recommendAdmission=userService.getIfAdmission("zsb_recommend_admission");
			ctx.getSession().put("recommendAdmission", recommendAdmission);
		}
		else if(Status.equals("自主招生初审通过")){
			String selfAdmission=userService.getIfAdmission("zsb_self_admission");
			ctx.getSession().put("selfAdmission", selfAdmission);
		}
		ctx.getSession().put("status", Status);
		String temp_str="";   
		Date dt = new Date(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
		temp_str=sdf.format(dt); 
		request.setAttribute("current",temp_str); 
		return SUCCESS;
	}
}
