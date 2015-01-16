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
			tip="�����һ�ʧ�ܣ����֤��Ϊ"+idcard+"���û���δ�ڱ�ϵͳע��";
			return ERROR;
		}
		else{
			request.setAttribute("messageInfo","�������óɹ����ѷ�������ע��ϵͳʱ�������");
			request.setAttribute("display","iframe");
			request.setAttribute("forward","index.jsp");
			return SUCCESS;
		}
	}
}
