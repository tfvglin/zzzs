package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class subFindPasswordAction  extends ActionSupport{
	private String idcard;
	private String tip;
	public void setIdcard(String idcard)
	{
		this.idcard = idcard;
	}
	public String getIdcard()
	{
		return this.idcard;
	}
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
		user.Service userService=new user.Service();
		int iNo=userService.changepasswordUtil(idcard);
		if(iNo==-1){
			tip="密码找回失败，身份证号为"+idcard+"的用户尚未在本系统注册";
			return ERROR;
		}
		else{
			request.setAttribute("messageInfo","密码重置成功，已发送至您注册系统时填的邮箱");
			request.setAttribute("display","iframe");
			request.setAttribute("forward","index.jsp");
			return SUCCESS;
		}
	}
}
