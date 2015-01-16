package admin;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class subAthleteAdmissionAction extends ActionSupport
{
	private String aerobicsdate;
	private String aerobicsbegin;
	private String aerobicsend;
	private String aerobicsaddress;
	private String swimdate;
	private String swimbegin;
	private String swimend;
	private String swimaddress;
	private String culturaldate;
	private String culturalbegin;
	private String culturalend;
	private String culturaladdress;
	private String tip;
	public void setAerobicsdate(String aerobicsdate) 
	{
		this.aerobicsdate = aerobicsdate; 
	}
	public String getAerobicsdate()
	{
		return (this.aerobicsdate); 
	}
	public void setAerobicsbegin(String aerobicsbegin) 
	{
		this.aerobicsbegin = aerobicsbegin; 
	}
	public String getAerobicsbegin()
	{
		return (this.aerobicsbegin); 
	}
	public void setAerobicsend(String aerobicsend) 
	{
		this.aerobicsend = aerobicsend; 
	}
	public String getAerobicsend()
	{
		return (this.aerobicsend); 
	}
	public void setAerobicsaddress(String aerobicsaddress) 
	{
		this.aerobicsaddress = aerobicsaddress; 
	}
	public String getAerobicsaddress()
	{
		return (this.aerobicsaddress); 
	}
	public void setSwimdate(String swimdate) 
	{
		this.swimdate = swimdate; 
	}
	public String getSwimdate()
	{
		return (this.swimdate); 
	}
	public void setSwimbegin(String swimbegin) 
	{
		this.swimbegin = swimbegin; 
	}
	public String getSwimbegin()
	{
		return (this.swimbegin); 
	}
	public void setSwimend(String swimend) 
	{
		this.swimend = swimend; 
	}
	public String getSwimend()
	{
		return (this.swimend); 
	}
	public void setSwimaddress(String swimaddress) 
	{
		this.swimaddress = swimaddress; 
	}
	public String getSwimaddress()
	{
		return (this.swimaddress); 
	}
	public void setCulturaldate(String culturaldate) 
	{
		this.culturaldate = culturaldate; 
	}
	public String getCulturaldate()
	{
		return (this.culturaldate); 
	}
	public void setCulturalbegin(String culturalbegin) 
	{
		this.culturalbegin = culturalbegin; 
	}
	public String getCulturalbegin()
	{
		return (this.culturalbegin); 
	}
	public void setCulturalend(String culturalend) 
	{
		this.culturalend = culturalend; 
	}
	public String getCulturalend()
	{
		return (this.culturalend); 
	}
	public void setCulturaladdress(String culturaladdress) 
	{
		this.culturaladdress = culturaladdress; 
	}
	public String getCulturaladdress()
	{
		return (this.culturaladdress); 
	}
	//tip属性的setter和getter方法
	public void setTip(String tip)
	{
		this.tip = tip;
	}
	public String getTip()
	{
		return this.tip;
	}
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
		int iNo=adminService.subAdmission("zsb_athlete",aerobicsdate,aerobicsbegin,aerobicsend,aerobicsaddress,swimdate,swimbegin,swimend,swimaddress,culturaldate,culturalbegin,culturalend,culturaladdress);
		request.setAttribute("messageInfo","编辑成功");
		request.setAttribute("display","iframe");
		request.setAttribute("forward","getAthleteAdmission");
		return SUCCESS;
	}
}