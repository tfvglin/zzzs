package user;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.*;
public class RegistAction extends ActionSupport
{
	private final String STU_RESULT = "stu";
	private String email;
	private String userpass;
	private String sfzh;
	private File upload;	
	//封装上传文件类型的属性
	private String uploadContentType;
	//封装上传文件名的属性
	private String uploadFileName;
	//直接在struts.xml文件中配置的属性
	private String savePath;	
	private String tip;
	public void setEmail(String email) 
	{
		this.email = email; 
	}
	public String getEmail()
	{
		return (this.email); 
	}
	public void setUserpass(String userpass) 
	{
		this.userpass = userpass; 
	}
	public String getUserpass()
	{
		return (this.userpass); 
	}
	public void setSfzh(String sfzh) 
	{
		this.sfzh = sfzh; 
	}
	public String getSfzh()
	{
		return (this.sfzh); 
	}
	//接受struts.xml文件配置值的方法
	public void setSavePath(String value)
	{
		this.savePath = value;
	}
	//返回上传文件的保存位置
	private String getSavePath() throws Exception 
	{
		return ServletActionContext.getServletContext()
			.getRealPath(savePath);
	}

	//上传文件对应文件内容的setter和getter方法
	public void setUpload(File upload) 
	{
		this.upload = upload; 
	}
	public File getUpload() 
	{
		return (this.upload); 
	}

	//上传文件的文件类型的setter和getter方法
	public void setUploadContentType(String uploadContentType) 
	{
		this.uploadContentType = uploadContentType; 
	}
	public String getUploadContentType()
	{
		return (this.uploadContentType); 
	}

	//上传文件的文件名的setter和getter方法
	public void setUploadFileName(String uploadFileName) 
	{
		this.uploadFileName = System.currentTimeMillis()+".jpg"; 
	}
	public String getUploadFileName() 
	{
		
		return this.uploadFileName;
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
		if(getEmail().indexOf(" ") != -1) {this.email= this.email.replaceAll(" ", "");}
		FileOutputStream fos = new FileOutputStream(getSavePath()+ "\\" + getUploadFileName());
		FileInputStream fis = new FileInputStream(getUpload());
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = fis.read(buffer)) > 0)
		{
			try{fos.write(buffer , 0 , len);}
			catch(Exception e){System.out.println("写入失败："+e);}
		}	
		fos.close();
		int iNo=-1;
		user.Service userService=new user.Service();		
		iNo=userService.regUtil(userpass,sfzh,email,getUploadFileName());		
		if(iNo==1){
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("email", email);
			request.setAttribute("userpass", userpass);
			request.setAttribute("sfzh", sfzh);
			System.out.println(sfzh+"aaaaaaaaaaaaaaa");
			return STU_RESULT;
		}
		else if(iNo==0){
			setTip("注册失败，请检查数据库连接"); 
			return ERROR;
		}
 	    else if(iNo==-1){
 	    	setTip("您的身份证号已存在，请勿重复注册");
 	    	return ERROR;
 	    }
 	    else
 	    {
 	    	setTip("您的邮箱已存在，请勿重复注册");
 	    	return ERROR;
 	    }
	}
}