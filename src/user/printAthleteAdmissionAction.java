package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class printAthleteAdmissionAction  extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		String Name=userService.getName("zsb_athlete",IDcard);
		String Sex=userService.getSex("zsb_athlete",IDcard);
		String Province=userService.getProvince("zsb_athlete",IDcard);
		String Subject=userService.getSubject("zsb_athlete",IDcard);
		request.setAttribute("username", Name);
		request.setAttribute("sex", Sex);
		request.setAttribute("province", Province);
		request.setAttribute("subject", Subject);
		String Number=userService.getNumber("zsb_athlete",IDcard);
		request.setAttribute("number", Number);	
		request.setAttribute("idcard", IDcard);
		String HighSchool=userService.getHighSchool("zsb_athlete",IDcard);
		request.setAttribute("highschool", HighSchool);
		String AerobicsDate=userService.getAerobicsDate();
		request.setAttribute("aerobicsdate", AerobicsDate);
		String AerobicsBegin=userService.getAerobicsBegin();
		request.setAttribute("aerobicsbegin", AerobicsBegin);
		String AerobicsEnd=userService.getAerobicsEnd();
		request.setAttribute("aerobicsend", AerobicsEnd);
		String AerobicsAddress=userService.getAerobicsAddress();
		request.setAttribute("aerobicsaddress", AerobicsAddress);
		String SwimDate=userService.getSwimDate();
		request.setAttribute("swimdate", SwimDate);
		String SwimBegin=userService.getSwimBegin();
		request.setAttribute("swimbegin", SwimBegin);
		String SwimEnd=userService.getSwimEnd();
		request.setAttribute("swimend", SwimEnd);
		String SwimAddress=userService.getSwimAddress();
		request.setAttribute("swimaddress", SwimAddress);
		String CulturalDate=userService.getCulturalDate();
		request.setAttribute("culturaldate", CulturalDate);
		String CulturalBegin=userService.getCulturalBegin();
		request.setAttribute("culturalbegin", CulturalBegin);
		String CulturalEnd=userService.getCulturalEnd();
		request.setAttribute("culturalend", CulturalEnd);
		String CulturalAddress=userService.getCulturalAddress();
		request.setAttribute("culturaladdress", CulturalAddress);
		String Photo=userService.getPhoto(IDcard);
		request.setAttribute("photo", Photo);
		return SUCCESS;
	}
}
