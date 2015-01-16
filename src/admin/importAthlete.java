package admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class importAthlete extends ActionSupport{
	@Override
	public String execute() throws Exception
	{
		excelServer es=new excelServer();
		es.getData();
		return SUCCESS;
	}
}