package user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RecommendAction extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		String Name=userService.getName("zsb_recommend",IDcard);
		String Sex=userService.getSex("zsb_recommend",IDcard);
		String Nation=userService.getNation("zsb_recommend",IDcard);
		String Province=userService.getProvince("zsb_recommend",IDcard);
		String Birthday=userService.getBirthday("zsb_recommend",IDcard);
		String Politic=userService.getPolitic("zsb_recommend",IDcard);
		String EntranceNo=userService.getEntranceNo("zsb_recommend",IDcard);
		String IsYingjie=userService.getIsYingjie("zsb_recommend",IDcard);
		String Subject=userService.getSubject("zsb_recommend",IDcard);
		request.setAttribute("username", Name);
		request.setAttribute("sex", Sex);
		request.setAttribute("nation", Nation);
		request.setAttribute("province", Province);
		request.setAttribute("birthday", Birthday);
		request.setAttribute("politic", Politic);
		request.setAttribute("entranceno", EntranceNo);
		request.setAttribute("isyingjie", IsYingjie);
		request.setAttribute("subject", Subject);
		String Mobile=userService.getMobile("zsb_recommend",IDcard);
		String FirstRelation=userService.getFirstRelation("zsb_recommend",IDcard);
		String HighSchool=userService.getHighSchool("zsb_recommend",IDcard);
		String Project=userService.getProject("zsb_recommend",IDcard);
		String Height=userService.getHeight("zsb_recommend",IDcard);
		request.setAttribute("mobile", Mobile);
		request.setAttribute("firstrelation", FirstRelation);
		request.setAttribute("highschool", HighSchool);
		request.setAttribute("project", Project);
		request.setAttribute("height", Height);
		return SUCCESS;
	}
}
