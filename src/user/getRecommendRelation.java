package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getRecommendRelation extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		user.Service userService=new user.Service();
		int iNo=-1;
		ActionContext ctx=ActionContext.getContext();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		HttpServletRequest request = ServletActionContext.getRequest();
		String Name=userService.getName("zsb_recommend",IDcard);
		request.setAttribute("username", Name);
		String Mobile=userService.getMobile("zsb_recommend",IDcard);
		String Tel=userService.getTel("zsb_recommend",IDcard);
		String Address=userService.getAddress("zsb_recommend",IDcard);
		String Post=userService.getPost("zsb_recommend",IDcard);		
		request.setAttribute("mobile", Mobile);
		request.setAttribute("hometel", Tel);
		request.setAttribute("homeaddress", Address);
		request.setAttribute("homepost", Post);
		String FirstRelation=userService.getFirstRelation("zsb_recommend",IDcard);
		String FirstName=userService.getFirstName("zsb_recommend",IDcard);
		String FirstUnit=userService.getFirstUnit("zsb_recommend",IDcard);
		String FirstEdu=userService.getFirstEdu("zsb_recommend",IDcard);
		String FirstTel=userService.getFirstTel("zsb_recommend",IDcard);
		String SecondRelation=userService.getSecondRelation("zsb_recommend",IDcard);
		String SecondName=userService.getSecondName("zsb_recommend",IDcard);
		String SecondUnit=userService.getSecondUnit("zsb_recommend",IDcard);
		String SecondEdu=userService.getSecondEdu("zsb_recommend",IDcard);
		String SecondTel=userService.getSecondTel("zsb_recommend",IDcard);
		request.setAttribute("firstrelation", FirstRelation);
		request.setAttribute("firstname", FirstName);
		request.setAttribute("firstunit", FirstUnit);
		request.setAttribute("firstedu", FirstEdu);
		request.setAttribute("firsttel", FirstTel);
		request.setAttribute("secondrelation", SecondRelation);
		request.setAttribute("secondname", SecondName);
		request.setAttribute("secondunit", SecondUnit);
		request.setAttribute("secondedu", SecondEdu);
		request.setAttribute("secondtel", SecondTel);
		String HighSchool=userService.getHighSchool("zsb_recommend",IDcard);
		request.setAttribute("highschool", HighSchool);
		String Project=userService.getProject("zsb_recommend",IDcard);
		request.setAttribute("project", Project);
		String Height=userService.getHeight("zsb_recommend",IDcard);
		request.setAttribute("height", Height);
		return SUCCESS;
	}
}
