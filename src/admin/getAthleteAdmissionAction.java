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
		String AerobicsDate=adminService.getAerobicsDate();//��ȡ�γ�����
		String SwimDate=adminService.getSwimDate();//��ȡ��ʼʱ��
		String CulturalDate=adminService.getCulturalDate();//��ȡ����ʱ��
		String AerobicsBegin=adminService.getAerobicsBegin();//��ȡ�γ�����
		String SwimBegin=adminService.getSwimBegin();//��ȡ��ʼʱ��
		String CulturalBegin=adminService.getCulturalBegin();
		String AerobicsEnd=adminService.getAerobicsEnd();//��ȡ�γ�����
		String SwimEnd=adminService.getSwimEnd();//��ȡ��ʼʱ��
		String CulturalEnd=adminService.getCulturalEnd();//��ȡ����ʱ��
		String AerobicsAddress=adminService.getAerobicsAddress();//��ȡ�γ�����
		String SwimAddress=adminService.getSwimAddress();//��ȡ��ʼʱ��
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