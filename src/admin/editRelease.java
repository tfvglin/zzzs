package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class editRelease extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
		String releaseId=request.getParameter("releaseId");
		String releaseName=adminService.getSignupName(releaseId);//获取课程名称
		String releaseBegin=adminService.getSignupBegin(releaseId);//获取开始时间
		String releaseEnd=adminService.getSignupEnd(releaseId);//获取结束时间
		String year=adminService.getSignupYear(releaseId);//获取结束时间
		request.setAttribute("releaseName", releaseName);
		request.setAttribute("releaseBegin", releaseBegin);
		request.setAttribute("releaseEnd", releaseEnd);
		request.setAttribute("releaseId", releaseId);
		request.setAttribute("year", year);
		return SUCCESS;
	}
}
