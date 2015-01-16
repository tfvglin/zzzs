package admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class recommendList extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		admin.Service adminService=new admin.Service();
		String curPage="1";
		if(request.getParameter("curPage")!=null) curPage=request.getParameter("curPage");
		Map recommends=adminService.getRecommendTrialList(curPage);
		request.setAttribute("pageInfo",recommends);
		return SUCCESS;
	}
}