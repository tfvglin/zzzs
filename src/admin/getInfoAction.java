package admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class getInfoAction extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
	    long Reg=adminService.getReg();
	    request.setAttribute("reg",Reg);
	    //System.out.println(Reg);
	    long Athlete=adminService.getAthlete();
	    request.setAttribute("athlete",Athlete);
	    long Recommend=adminService.getRecommend();
	    request.setAttribute("recommend",Recommend);
	    long Self=adminService.getSelf();
	    request.setAttribute("self",Self);
	    long admissionamount=adminService.getAdmissionamount();
	    request.setAttribute("admissionamount",admissionamount);
	    String maxRoom=adminService.getMaxRoom();
	    //System.out.println(maxRoom);
	    request.setAttribute("maxroom",maxRoom);
		return SUCCESS;
	}
}
