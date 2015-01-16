package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AthleteContactAction extends ActionSupport{
	private String sjhm;
	private String jtdh;
	private String txdz;
	private String yzbm;
	public void setSjhm(String sjhm) 
	{
		this.sjhm = sjhm; 
	}
	public String getSjhm()
	{
		return (this.sjhm); 
	}
	public void setJtdh(String jtdh) 
	{
		this.jtdh = jtdh; 
	}
	public String getJtdh()
	{
		return (this.jtdh); 
	}
	public void setTxdz(String txdz) 
	{
		this.txdz = txdz; 
	}
	public String getTxdz()
	{
		return (this.txdz); 
	}
	public void setYzbm(String yzbm) 
	{
		this.yzbm = yzbm; 
	}
	public String getYzbm()
	{
		return (this.yzbm); 
	}
	@Override
	public String execute() throws Exception
	{
		user.Service userService=new user.Service();
		int iNo=-1;
		ActionContext ctx=ActionContext.getContext();
		String IDcard=userService.getIDcard((String)ctx.getSession().get("email"));
		iNo=userService.contactUtil("zsb_athlete",IDcard,getSjhm(),getJtdh(),getTxdz(),getYzbm());
		HttpServletRequest request = ServletActionContext.getRequest();
		String Name=userService.getName("zsb_athlete",IDcard);
		request.setAttribute("username", Name);
		String Mobile=userService.getMobile("zsb_athlete",IDcard);
		String Tel=userService.getTel("zsb_athlete",IDcard);
		String Address=userService.getAddress("zsb_athlete",IDcard);
		String Post=userService.getPost("zsb_athlete",IDcard);		
		request.setAttribute("mobile", Mobile);
		request.setAttribute("hometel", Tel);
		request.setAttribute("homeaddress", Address);
		request.setAttribute("homepost", Post);
		String FirstRelation=userService.getFirstRelation("zsb_athlete",IDcard);//获取课程名称
		String FirstName=userService.getFirstName("zsb_athlete",IDcard);//获取开始时间
		String FirstUnit=userService.getFirstUnit("zsb_athlete",IDcard);//获取结束时间
		String FirstEdu=userService.getFirstEdu("zsb_athlete",IDcard);//获取课程名称
		String FirstTel=userService.getFirstTel("zsb_athlete",IDcard);//获取开始时间
		String SecondRelation=userService.getSecondRelation("zsb_athlete",IDcard);//获取课程名称
		String SecondName=userService.getSecondName("zsb_athlete",IDcard);//获取开始时间
		String SecondUnit=userService.getSecondUnit("zsb_athlete",IDcard);//获取结束时间
		String SecondEdu=userService.getSecondEdu("zsb_athlete",IDcard);//获取课程名称
		String SecondTel=userService.getSecondTel("zsb_athlete",IDcard);//获取开始时间
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
		String HighSchool=userService.getHighSchool("zsb_athlete",IDcard);
		request.setAttribute("highschool", HighSchool);
		String Project=userService.getProject("zsb_athlete",IDcard);
		request.setAttribute("project", Project);
		String Height=userService.getHeight("zsb_athlete",IDcard);
		request.setAttribute("height", Height);
		return SUCCESS;
	}
}
