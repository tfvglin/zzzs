package admin;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AthleteStatusAction extends ActionSupport
{
	private String idcard;
	private String status;
	private String name;
	public void setIdcard(String idcard) 
	{
		this.idcard = idcard; 
	}
	public String getIdcard()
	{
		return (this.idcard); 
	}
	public void setStatus(String status) 
	{
		this.status = status; 
	}
	public String getStatus()
	{
		return (this.status); 
	}
	public void setName(String name) 
	{
		this.name = name; 
	}
	public String getName()
	{
		return (this.name); 
	}
	@Override
	public String execute() throws Exception
	{
		ActionContext ctx=ActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		return SUCCESS;
	}
}