package admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class searchAthlete extends ActionSupport
{
	private String name;
	private String number;
	private String idcard;
	public void setName(String name) 
	{
		this.name = name; 
	}
	public String getName()
	{
		return (this.name); 
	}
	public void setNumber(String number) 
	{
		this.number = number; 
	}
	public String getNumber()
	{
		return (this.number); 
	}
	public void setIdcard(String idcard)
	{
		this.idcard = idcard;
	}
	public String getIdcard()
	{
		return this.idcard;
	}
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		user.Service userService=new user.Service();
        if(!idcard.equals("身份证号")&&!idcard.equals("")&&!idcard.equals(null)){
        	request.setAttribute("idcard", idcard);
		}
        else if(!number.equals("报名号")&&!number.equals("")&&!number.equals(null)){
        	idcard=userService.getIDcardByNumber("zsb_athlete",number);
		}
        else if(!name.equals("姓名")&&!name.equals("")&&!name.equals(null)){
        	idcard=userService.getIDcardByName("zsb_athlete",name);        	
		}		
        request.setAttribute("idcard", idcard);
		String Name=userService.getName("zsb_athlete",idcard);
		request.setAttribute("name", Name);
		String Province=userService.getProvince("zsb_athlete",idcard);
		request.setAttribute("province", Province);
		String Subject=userService.getSubject("zsb_athlete",idcard);
		request.setAttribute("subject", Subject);
		String HighSchool=userService.getHighSchool("zsb_athlete",idcard);
		request.setAttribute("highschool", HighSchool);
		String Number=userService.getNumber("zsb_athlete",idcard);
		request.setAttribute("number", Number);	
		String Status=userService.getStatus(idcard);
		request.setAttribute("status", Status);	
		return SUCCESS;
	}
}