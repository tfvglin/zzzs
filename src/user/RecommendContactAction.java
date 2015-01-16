package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RecommendContactAction extends ActionSupport{
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
		iNo=userService.contactUtil("zsb_recommend",IDcard,getSjhm(),getJtdh(),getTxdz(),getYzbm());
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
		String FirstRelation=userService.getFirstRelation("zsb_recommend",IDcard);//��ȡ�γ�����
		String FirstName=userService.getFirstName("zsb_recommend",IDcard);//��ȡ��ʼʱ��
		String FirstUnit=userService.getFirstUnit("zsb_recommend",IDcard);//��ȡ����ʱ��
		String FirstEdu=userService.getFirstEdu("zsb_recommend",IDcard);//��ȡ�γ�����
		String FirstTel=userService.getFirstTel("zsb_recommend",IDcard);//��ȡ��ʼʱ��
		String SecondRelation=userService.getSecondRelation("zsb_recommend",IDcard);//��ȡ�γ�����
		String SecondName=userService.getSecondName("zsb_recommend",IDcard);//��ȡ��ʼʱ��
		String SecondUnit=userService.getSecondUnit("zsb_recommend",IDcard);//��ȡ����ʱ��
		String SecondEdu=userService.getSecondEdu("zsb_recommend",IDcard);//��ȡ�γ�����
		String SecondTel=userService.getSecondTel("zsb_recommend",IDcard);//��ȡ��ʼʱ��
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
