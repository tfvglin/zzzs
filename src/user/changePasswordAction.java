package user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class changePasswordAction   extends ActionSupport{
    private String oldpassword;
    private String password;
    private String tip;
    public void setOldpassword(String oldpassword)
	{
		this.oldpassword = oldpassword;
	}
	public String getOldpassword()
	{
		return this.oldpassword;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getPassword()
	{
		return this.password;
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
		int iNo=userService.passwordUtil((String)ctx.getSession().get("email"),oldpassword,password);
		String forward="";
		if(iNo==1)
 	    {
    		tip="密码修改成功，请牢记您的新密码并重新登录";
			return SUCCESS;
 	    }
		else if(iNo==-1)
 	    {
 		   tip="账号错误，请确认旧密码输入正确。";
 		  return ERROR;
 	    }
		else{
			tip="网络异常，请稍后重试或联系管理员crytoll@163.com";
			return ERROR;
		}
	}
}
