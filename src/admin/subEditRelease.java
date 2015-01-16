package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class subEditRelease extends ActionSupport{
	private String id;
	private String title;
	private String begin;
	private String end;
	private String year;
	//�����½�����ʾ��Ϣ
	private String tip;
	public void setId(String id) 
	{
		this.id = id; 
	}
	public String getId()
	{
		return (this.id); 
	}
	public void setTitle(String title) 
	{
		this.title = title; 
	}
	public String getTitle()
	{
		return (this.title); 
	}
	public void setBegin(String begin) 
	{
		this.begin = begin; 
	}
	public String getBegin()
	{
		return (this.begin); 
	}
	public void setEnd(String end) 
	{
		this.end = end; 
	}
	public String getEnd()
	{
		return (this.end); 
	}
	public void setYear(String year) 
	{
		this.year = year; 
	}
	public String getYear()
	{
		return (this.year); 
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
		admin.Service adminService=new admin.Service();
		if(getTitle().indexOf(" ") != -1) {this.title= this.title.replaceAll(" ", "");}
		int iNo=adminService.updatesignup(title,begin,end,year,id);
		if(iNo>=1){
			setTip("�����ɹ�");
			List signups=adminService.getSignupList();
		    request.setAttribute("signups", signups);
			return SUCCESS;
		}
		else
		{
			setTip("����ʧ�ܣ���ο���������־");
			return ERROR;
		}
	}
}
