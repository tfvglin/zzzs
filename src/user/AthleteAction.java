package user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AthleteAction extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		String Name=userService.getName("zsb_athlete",IDcard);
		String Sex=userService.getSex("zsb_athlete",IDcard);
		String Nation=userService.getNation("zsb_athlete",IDcard);
		String Province=userService.getProvince("zsb_athlete",IDcard);
		String Birthday=userService.getBirthday("zsb_athlete",IDcard);
		String Politic=userService.getPolitic("zsb_athlete",IDcard);
		String EntranceNo=userService.getEntranceNo("zsb_athlete",IDcard);
		String IsYingjie=userService.getIsYingjie("zsb_athlete",IDcard);
		String Subject=userService.getSubject("zsb_athlete",IDcard);
		request.setAttribute("username", Name);
		request.setAttribute("sex", Sex);
		request.setAttribute("nation", Nation);
		request.setAttribute("province", Province);
		request.setAttribute("birthday", Birthday);
		request.setAttribute("politic", Politic);
		request.setAttribute("entranceno", EntranceNo);
		request.setAttribute("isyingjie", IsYingjie);
		request.setAttribute("subject", Subject);
		String Mobile=userService.getMobile("zsb_athlete",IDcard);
		String FirstRelation=userService.getFirstRelation("zsb_athlete",IDcard);
		String HighSchool=userService.getHighSchool("zsb_athlete",IDcard);
		String Project=userService.getProject("zsb_athlete",IDcard);
		String Height=userService.getHeight("zsb_athlete",IDcard);
		request.setAttribute("mobile", Mobile);
		request.setAttribute("firstrelation", FirstRelation);
		request.setAttribute("highschool", HighSchool);
		request.setAttribute("project", Project);
		request.setAttribute("height", Height);
		return SUCCESS;
	}
}
