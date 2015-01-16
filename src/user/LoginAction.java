package user;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport
{
	//����һ��������Ϊ������¼�ɹ���Result��
	private final String STU_RESULT = "stu";
	private String username;
	private String userpass;
	//�����½�����ʾ��Ϣ
	private String tip;
	public void setUsername(String username) 
	{
		this.username = username; 
	}
	public String getUsername()
	{
		return (this.username); 
	}
	public void setUserpass(String userpass) 
	{
		this.userpass = userpass; 
	}
	public String getUserpass()
	{
		return (this.userpass); 
	}
	//tip���Ե�setter��getter����
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
		if(getUsername().indexOf(" ") != -1) {this.username= this.username.replaceAll(" ", "");}
		int iNo=userService.login(getUsername(),getUserpass());	
		if(iNo>=1){
			ctx.getSession().put("email",getUsername());
			ctx.getSession().put("userpass",getUserpass());	
			String IDcard=userService.getIDcard(getUsername());
			request.setAttribute("IDcard", IDcard);
			return STU_RESULT;
		}
		else
		{
			if(iNo==-1){setTip(getUsername()+"��δע��");}
			if(iNo==-2){setTip("��������Ǵ�������");}
			return ERROR;
		}
	}
}
