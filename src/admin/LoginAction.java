package admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	//����һ��������Ϊ������¼�ɹ���Result��
		private final String STU_RESULT = "stu";
		private final String ADMIN_RESULT = "admin";
		private String username;
		private String password;
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
		public void setPassword(String password) 
		{
			this.password = password; 
		}
		public String getPassword()
		{
			return (this.password); 
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
			/*String ipAddr =ServletActionContext.getRequest().getRemoteAddr(); 
			String ipAddr1=ipAddr.substring(0,ipAddr.lastIndexOf("."));
			String ipAddr2=ipAddr1.substring(0,ipAddr1.lastIndexOf("."));
			if(ipAddr.equals("127.0.0.1")||ipAddr.equals("202.117.120.241")||ipAddr.equals("202.117.120.14")||ipAddr.equals("210.27.7.161")||ipAddr.equals("115.155.55.7")||ipAddr1.equals("210.27.12")||ipAddr1.equals("219.245.114")||ipAddr1.equals("219.245.116")||ipAddr2.equals("10.168")||ipAddr2.equals("10.169")||ipAddr.equals("210.27.0.150"))
			{*/
				ActionContext ctx=ActionContext.getContext();
				HttpServletRequest request = ServletActionContext.getRequest();
				admin.Service adminService=new admin.Service();
				if(getUsername().indexOf(" ") != -1) {this.username= this.username.replaceAll(" ", "");}
				int iNo=adminService.login(getUsername(),getPassword());	
				if(iNo>=1){
					ctx.getSession().put("admin",getUsername());
					return ADMIN_RESULT;
				}
				else
				{
					if(iNo==-1){setTip(getUsername()+"��δע��");}
					if(iNo==-2){setTip("�������"+getPassword()+"�Ǵ�������");}
					return ERROR;
				}
				/*}
			else
			{
				setTip("����IPΪ"+ipAddr+",����������ʵ��б�֮��");
		 	    return ERROR;
			}*/
		}
}
