package admin;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getAthleteAdmissionAction extends ActionSupport
{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
		String AerobicsDate=adminService.getAerobicsDate();//获取课程名称
		String SwimDate=adminService.getSwimDate();//获取开始时间
		String CulturalDate=adminService.getCulturalDate();//获取结束时间
		String AerobicsBegin=adminService.getAerobicsBegin();//获取课程名称
		String SwimBegin=adminService.getSwimBegin();//获取开始时间
		String CulturalBegin=adminService.getCulturalBegin();
		String AerobicsEnd=adminService.getAerobicsEnd();//获取课程名称
		String SwimEnd=adminService.getSwimEnd();//获取开始时间
		String CulturalEnd=adminService.getCulturalEnd();//获取结束时间
		String AerobicsAddress=adminService.getAerobicsAddress();//获取课程名称
		String SwimAddress=adminService.getSwimAddress();//获取开始时间
		String CulturalAddress=adminService.getCulturalAddress();
		request.setAttribute("aerobicsdate", AerobicsDate);
		request.setAttribute("swimdate", SwimDate);
		request.setAttribute("culturaldate", CulturalDate);
		request.setAttribute("aerobicsbegin", AerobicsBegin);
		request.setAttribute("swimbegin", SwimBegin);
		request.setAttribute("culturalbegin", CulturalBegin);
		request.setAttribute("aerobicsend", AerobicsEnd);
		request.setAttribute("swimend", SwimEnd);
		request.setAttribute("culturalend", CulturalEnd);
		request.setAttribute("aerobicsaddress", AerobicsAddress);
		request.setAttribute("swimaddress", SwimAddress);
		request.setAttribute("culturaladdress", CulturalAddress);
		return SUCCESS;
	}
}