package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class athleteDetail extends ActionSupport{
	private String idcard;
	public void setIdcard(String idcard) 
	{
		this.idcard = idcard; 
	}
	public String getIdcard()
	{
		return (this.idcard); 
	}
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
		request.setAttribute("idcard", idcard);
		String Name=userService.getName("zsb_athlete",idcard);
		String Sex=userService.getSex("zsb_athlete",idcard);
		String Nation=userService.getNation("zsb_athlete",idcard);
		String Province=userService.getProvince("zsb_athlete",idcard);
		String Birthday=userService.getBirthday("zsb_athlete",idcard);
		String Politic=userService.getPolitic("zsb_athlete",idcard);
		String EntranceNo=userService.getEntranceNo("zsb_athlete",idcard);
		String IsYingjie=userService.getIsYingjie("zsb_athlete",idcard);
		String Subject=userService.getSubject("zsb_athlete",idcard);
		request.setAttribute("username", Name);
		request.setAttribute("sex", Sex);
		request.setAttribute("nation", Nation);
		request.setAttribute("province", Province);
		request.setAttribute("birthday", Birthday);
		request.setAttribute("politic", Politic);
		request.setAttribute("entranceno", EntranceNo);
		request.setAttribute("isyingjie", IsYingjie);
		request.setAttribute("subject", Subject);
		String Mobile=userService.getMobile("zsb_athlete",idcard);
		String FirstRelation=userService.getFirstRelation("zsb_athlete",idcard);
		String HighSchool=userService.getHighSchool("zsb_athlete",idcard);
		String Project=userService.getProject("zsb_athlete",idcard);
		String Height=userService.getHeight("zsb_athlete",idcard);
		request.setAttribute("mobile", Mobile);
		request.setAttribute("firstrelation", FirstRelation);
		request.setAttribute("highschool", HighSchool);
		request.setAttribute("specialty", Project);
		request.setAttribute("height", Height);
		String Photo=userService.getPhoto(idcard);
		request.setAttribute("photo", Photo);
		String Level=userService.getLevel("zsb_athlete",idcard);
		request.setAttribute("level", Level);
		String getTime=userService.getGetTime("zsb_athlete",idcard);
		request.setAttribute("gettime", getTime);
		String HighLink=userService.getHighLink("zsb_athlete",idcard);
		request.setAttribute("highlink", HighLink);
		String HighDepartment=userService.getHighDepartment("zsb_athlete",idcard);
		request.setAttribute("highdepartment", HighDepartment);
		String HighTel=userService.getHighLinkTel("zsb_athlete",idcard);
		request.setAttribute("hightel", HighTel);
		String HighAddress=userService.getHighAddress("zsb_athlete",idcard);
		request.setAttribute("highaddress", HighAddress);
		String HighPost=userService.getHighPost("zsb_athlete",idcard);
		request.setAttribute("highpost", HighPost);
		String Address=userService.getAddress("zsb_athlete",idcard);
		request.setAttribute("homeaddress", Address);
		String Post=userService.getPost("zsb_athlete",idcard);	
		request.setAttribute("homepost", Post);
		String Tel=userService.getTel("zsb_athlete",idcard);
		request.setAttribute("hometel", Tel);
		String FirstName=userService.getFirstName("zsb_athlete",idcard);
		request.setAttribute("firstname", FirstName);
		String FirstUnit=userService.getFirstUnit("zsb_athlete",idcard);
		request.setAttribute("firstunit", FirstUnit);
		String FirstEdu=userService.getFirstEdu("zsb_athlete",idcard);
		request.setAttribute("firstedu", FirstEdu);
		String FirstTel=userService.getFirstTel("zsb_athlete",idcard);
		request.setAttribute("firsttel", FirstTel);
		String SecondRelation=userService.getSecondRelation("zsb_athlete",idcard);
		request.setAttribute("secondrelation", SecondRelation);
		String SecondName=userService.getSecondName("zsb_athlete",idcard);
		request.setAttribute("secondname", SecondName);
		String SecondUnit=userService.getSecondUnit("zsb_athlete",idcard);
		request.setAttribute("secondunit", SecondUnit);
		String SecondEdu=userService.getSecondEdu("zsb_athlete",idcard);
		request.setAttribute("secondedu", SecondEdu);
		String SecondTel=userService.getSecondTel("zsb_athlete",idcard);
		request.setAttribute("secondtel", SecondTel);
		String HighBegin=userService.getHighBegin("zsb_athlete",idcard);
		request.setAttribute("highbegin", HighBegin);
		String HighEnd=userService.getHighEnd("zsb_athlete",idcard);
		request.setAttribute("highend", HighEnd);
		String MidSchool=userService.getMidSchool("zsb_athlete",idcard);
		request.setAttribute("midschool", MidSchool);
		String MidBegin=userService.getMidBegin("zsb_athlete",idcard);
		request.setAttribute("midbegin", MidBegin);
		String MidEnd=userService.getMidEnd("zsb_athlete",idcard);
		request.setAttribute("midend", MidEnd);
		String MidLink=userService.getMidLink("zsb_athlete",idcard);
		request.setAttribute("midlink", MidLink);
		String Strength=userService.getStrength("zsb_athlete",idcard);
		request.setAttribute("strength", Strength);	
		String Awards=userService.getAwards("zsb_athlete",idcard);
		request.setAttribute("awards", Awards);	
		String Year=userService.getYear();
		request.setAttribute("year", Year);	
		String End=userService.getEnd("高水平运动员");
		request.setAttribute("end", End);	
		String Status=userService.getStatus(idcard);
		request.setAttribute("status", Status);	
		String Number=userService.getNumber("zsb_athlete",idcard);
		request.setAttribute("number", Number);	
		return SUCCESS;
	}
}