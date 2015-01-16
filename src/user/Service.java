package user;

import javax.naming.*;
import javax.sql.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.io.*;

import javax.mail.*; 
import javax.mail.internet.*; 

import java.util.Properties; 
import java.util.Date; 
public class Service extends common.BaseService{
	public static final String REG_USERId_SQL = "select Number from zsb_info order by Id desc";
    public static final String LOGIN_SQL="select ID from zsb_reg where `Email`=? and Password=?";
    public int login(String number,String password){
    	String user_sql=LOGIN_SQL;
    	int no=-1;
    	no=getInt("select ID from zsb_reg where `Email`='"+number+"' and Password='"+common.MD5Util.MD5(password)+"'");
    	if(no<1)//账号错误
    	{
    		String Email_SQL="select ID from zsb_reg where `Email`='"+number+"'";
    		no=getInt(Email_SQL);
    		if(no<1)//邮箱错误
    		{
    			no=-1;
    		}
    		if(no>=1)//密码错误
    		{
    			System.out.println("传递过来的邮箱为"+number+"，密码为"+password);
    			no=-2;
    		}
    	}
    	return no;
    }
	public int regUtil(String Password,String IDcard,String Email,String Photo) {
		int Number = 0;
		int CheckId=0;
		int CheckEmail=0;
		String check_sql="select ID from zsb_reg where IDcard=?";
		String email_sql="select ID from zsb_reg where Email=?";
		CheckId=getInt(check_sql,new Object[]{IDcard});
		CheckEmail=getInt(email_sql,new Object[]{Email});
		if(CheckId>0){
			Number=-1;
		}
		if(CheckEmail>0){
			Number=-2;
		}
		if(CheckId==0&&CheckEmail==0)
		{
			String user_sql = "insert into zsb_reg(Password,IDcard,Email,Photo)values(?,?,?,?)";				
			Number=update(user_sql,new Object[]{common.MD5Util.MD5(Password),IDcard,Email,Photo});				
		}
		return Number;
	}
	public int passwordUtil(String Email,String OldPassword,String Password) {
		int Number = 0;
		int CheckId=0;
		String email_sql="select `ID` from `zsb_reg` where `Email`='"+Email+"' and `Password`='"+common.MD5Util.MD5(OldPassword)+"'";
		CheckId=getInt(email_sql);
		if(CheckId>0){
			String user_sql = "update `zsb_reg` set `Password`='"+common.MD5Util.MD5(Password)+"' where `Email`='"+Email+"'";				
			Number=update(user_sql);			
		}
		else if(CheckId<=0){
			Number=-1;
		}
		return Number;
	}
	public static String getRandomString(int length) { //length表示生成字符串的长度
	    String base = "abcdefghijklmnopqrstuvwxyz0123456789";   
	    Random random = new Random();   
	    StringBuffer sb = new StringBuffer();   
	    for (int i = 0; i < length; i++) {   
	        int number = random.nextInt(base.length());   
	        sb.append(base.charAt(number));   
	    }   
	    return sb.toString();   
	 }   

	public int changepasswordUtil(String IDcard) {
		int Number = 0;
		String CheckId="";
		String to_sql="select `Email` from `zsb_reg` where `IDcard`='"+IDcard+"'";
		CheckId=getString(to_sql);
		//System.out.println(CheckId);
		if(CheckId!=null){
			String Password=getRandomString(6);
			//System.out.println(Password);
			String PasswordMd5=common.MD5Util.MD5(Password);
			update("update `zsb_reg` set `Password`='"+PasswordMd5+"' where `IDcard`='"+IDcard+"'");
			try{
                Properties props=new Properties();//也可用Properties props = System.getProperties(); 
				props.put("mail.smtp.host","smtp.163.com");//存储发送邮件服务器的信息
				props.put("mail.smtp.auth","true");//同时通过验证
				Session s=Session.getInstance(props);//根据属性新建一个邮件会话
				s.setDebug(true);
				MimeMessage message=new MimeMessage(s);//由邮件会话新建一个消息对象
				//设置邮件
				InternetAddress from=new InternetAddress("Crytoll@163.com");
				message.setFrom(from);//设置发件人
				InternetAddress to=new InternetAddress(CheckId);
				message.setRecipient(Message.RecipientType.TO,to);//设置收件人,并设置其接收类型为TO
				message.setSubject("找回密码");//设置主题
				message.setText("您的密码被重置为"+Password);//设置信件内容
				message.setSentDate(new Date());//设置发信时间
				//发送邮件
				message.saveChanges();//存储邮件信息
				Transport transport=s.getTransport("smtp");
				transport.connect("smtp.163.com","Crytoll","supercrytoll");//以smtp方式登录邮箱
				transport.sendMessage(message,message.getAllRecipients());//发送邮件,其中第二个参数是所有
				//已设好的收件人地址
				transport.close();
				}catch(MessagingException e){
				System.out.println(e.toString());
				}  
			Number=1;
		}
		else if(CheckId==null){
			Number=-1;
		}
		return Number;
	}
	public List getSignupList(){
    	List l=new ArrayList();
    	String temp_str="";   
        Date dt = new Date();   
        //最后的aa表示“上午”或“下午”    HH表示24小时制    如果换成hh表示12小时制   
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
        temp_str=sdf.format(dt);
    	String sql="select Id,Name,Begin,End from zsb_signup where Begin<='"+temp_str+"'";
    	//System.out.println(sql);
    	l=this.getList(sql);
    	return l;
    }
	public int infoUtil(String Table,String IDcard,String Name,String Sex,String Nation,String Province,String Birthday,String Politic,String EntranceNo,String Type,String Subject) {
		String info_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from `"+Table+"` where `IDcard`='"+IDcard+"'";
		CheckId=getInt(check_sql);
		//System.out.println(CheckId);
		if(CheckId>0){
			info_sql = "update `"+Table+"` set `Name`='"+Name+"',`Sex`='"+Sex+"',`Nation`='"+Nation+"',`Province`='"+Province+"',`Birthday`='"+Birthday+"',`Politic`='"+Politic+"',`EntranceNo`='"+EntranceNo+"',`IsYingjie`='"+Type+"',`Subject`='"+Subject+"' where `IDcard`='"+IDcard+"'";
			Number=update(info_sql);
		}
		else if(CheckId<=0)
		{
			info_sql = "insert into `"+Table+"`(`IDcard`,`Name`,`Sex`,`Nation`,`Province`,`Birthday`,`Politic`,`EntranceNo`,`IsYingjie`,`Subject`,`Status`) values('"+IDcard+"','"+Name+"','"+Sex+"','"+Nation+"','"+Province+"','"+Birthday+"','"+Politic+"','"+EntranceNo+"','"+Type+"','"+Subject+"','尚未提交高水平运动员申请表')";				
			Number=update(info_sql);
		}		
		return Number;
	}
	public int recommendPersonalUtil(String Email,String EntranceNo,String Name,String Sex,String Nation,String Province,String Birthday,String Politic,String Language,String Type,String Subject) {
		String info_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_recommend where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			info_sql = "update zsb_recommend set EntranceNo=?,Name=?,Sex=?,Nation=?,Province=?,Birthday=?,Politic=?,Language=?,IsYingjie=?,Subject=? where Email=?";
			Number=update(info_sql,new Object[]{EntranceNo,Name,Sex,Nation,Province,Birthday,Politic,Language,Type,Subject,Email});
		}
		else if(CheckId<=0)
		{
			info_sql = "insert into zsb_recommend(Email,EntranceNo,Name,Sex,Nation,Province,Birthday,Politic,Language,IsYingjie,Subject)values(?,?,?,?,?,?,?,?,?,?,?)";				
			//System.out.println(info_sql);	
			Number=update(info_sql,new Object[]{Email,EntranceNo,Name,Sex,Nation,Province,Birthday,Politic,Language,Type,Subject});
		}		
		return Number;
	}
	public int selfPersonalUtil(String Email,String EntranceNo,String Name,String Sex,String Nation,String Province,String Birthday,String Politic,String Language,String Type,String Subject) {
		String info_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_self where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			info_sql = "update zsb_self set EntranceNo=?,Name=?,Sex=?,Nation=?,Province=?,Birthday=?,Politic=?,Language=?,IsYingjie=?,Subject=? where Email=?";
			Number=update(info_sql,new Object[]{EntranceNo,Name,Sex,Nation,Province,Birthday,Politic,Language,Type,Subject,Email});
		}
		else if(CheckId<=0)
		{
			info_sql = "insert into zsb_self(Email,EntranceNo,Name,Sex,Nation,Province,Birthday,Politic,Language,IsYingjie,Subject)values(?,?,?,?,?,?,?,?,?,?,?)";				
			//System.out.println(info_sql);	
			Number=update(info_sql,new Object[]{Email,EntranceNo,Name,Sex,Nation,Province,Birthday,Politic,Language,Type,Subject});
		}		
		return Number;
	}
	public int contactUtil(String Table,String IDcard,String Mobile,String Tel,String Address,String Post) {
		String contact_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from `"+Table+"` where `IDcard`='"+IDcard+"'";		
		CheckId=getInt(check_sql);
		//System.out.println(CheckId);
		if(CheckId>0){
			contact_sql = "update `"+Table+"` set `Mobile`='"+Mobile+"',`HomeTel`='"+Tel+"',`HomeAddress`='"+Address+"',`HomePost`='"+Post+"' where `IDcard`='"+IDcard+"'";
			//System.out.println(contact_sql);
			Number=update(contact_sql);	
		}
		else if(CheckId<=0)
		{
			contact_sql = "insert into `"+Table+"`(`IDcard`,`Mobile`,`HomeTel`,`HomeAddress`,`HomePost`)values('"+IDcard+"','"+Mobile+"','"+Tel+"','"+Address+"','"+Post+"'";		
			//System.out.println(info_sql);		
			Number=update(contact_sql);	
		}		
		return Number;
	}
	public int recommendcontactUtil(String Email,String Mobile,String Tel,String Address,String Post) {
		String contact_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_recommend where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(Address);//此处生僻字正常
		if(CheckId>0){
			contact_sql = "update zsb_recommend set Mobile=?,HomeTel=?,HomeAddress=?,HomePost=? where Email=?";
			//System.out.println(contact_sql);
			Number=update(contact_sql,new Object[]{Mobile,Tel,Address,Post,Email});	
		}
		else if(CheckId<=0)
		{
			contact_sql = "insert into zsb_recommend(Email,Mobile,HomeTel,HomeAddress,HomePost)values(?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(contact_sql,new Object[]{Email,Mobile,Tel,Address,Post});	
		}		
		return Number;
	}
	public int selfcontactUtil(String Email,String Mobile,String Tel,String Address,String Post) {
		String contact_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_self where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			contact_sql = "update zsb_self set Mobile=?,HomeTel=?,HomeAddress=?,HomePost=? where Email=?";
			//System.out.println(contact_sql);
			Number=update(contact_sql,new Object[]{Mobile,Tel,Address,Post,Email});	
		}
		else if(CheckId<=0)
		{
			contact_sql = "insert into zsb_self(Email,Mobile,HomeTel,HomeAddress,HomePost)values(?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(contact_sql,new Object[]{Email,Mobile,Tel,Address,Post});	
		}		
		return Number;
	}
	public int relationUtil(String Table,String IDcard,String FirstRelation,String FirstName,String FirstUnit,String FirstEdu,String FirstTel,String SecondRelation,String SecondName,String SecondUnit,String SecondEdu,String SecondTel) {
		String relation_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from `"+Table+"` where `IDcard`='"+IDcard+"'";
		CheckId=getInt(check_sql);
		if(CheckId>0){
			relation_sql = "update `"+Table+"` set `FirstRelation`='"+FirstRelation+"',`FirstName`='"+FirstName+"',`FirstUnit`='"+FirstUnit+"',`FirstEdu`='"+FirstEdu+"',`FirstTel`='"+FirstTel+"',`SecondRelation`='"+SecondRelation+"',`SecondName`='"+SecondName+"',`SecondUnit`='"+SecondUnit+"',`SecondEdu`='"+SecondEdu+"',`SecondTel`='"+SecondTel+"' where `IDcard`='"+IDcard+"'";
			Number=update(relation_sql);	
		}
		else if(CheckId<=0)
		{
			relation_sql = "insert into `"+Table+"`(`IDcard`,`FirstRelation`,`FirstName`,`FirstUnit`,`FirstEdu`,`FirstTel`,`SecondRelation`,`SecondName`,`SecondUnit`,`SecondEdu`,`SecondTel`)values('"+IDcard+"','"+FirstRelation+"','"+FirstName+"','"+FirstUnit+"','"+FirstEdu+"','"+FirstTel+"','"+SecondRelation+"','"+SecondName+"','"+SecondUnit+"','"+SecondEdu+"','"+SecondTel+"'";		
			Number=update(relation_sql);	
		}		
		return Number;
	}
	public int recommendrelationUtil(String Email,String FirstRelation,String FirstName,String FirstUnit,String FirstEdu,String FirstTel,String SecondRelation,String SecondName,String SecondUnit,String SecondEdu,String SecondTel) {
		String relation_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_recommend where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			relation_sql = "update zsb_recommend set FirstRelation=?,FirstName=?,FirstUnit=?,FirstEdu=?,FirstTel=?,SecondRelation=?,SecondName=?,SecondUnit=?,SecondEdu=?,SecondTel=? where Email=?";
			//System.out.println(contact_sql);
			Number=update(relation_sql,new Object[]{FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,Email});	
		}
		else if(CheckId<=0)
		{
			relation_sql = "insert into zsb_recommend(Email,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel)values(?,?,?,?,?,?,?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(relation_sql,new Object[]{Email,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel});	
		}		
		return Number;
	}
	public int selfrelationUtil(String Email,String FirstRelation,String FirstName,String FirstUnit,String FirstEdu,String FirstTel,String SecondRelation,String SecondName,String SecondUnit,String SecondEdu,String SecondTel) {
		String relation_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_self where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			relation_sql = "update zsb_self set FirstRelation=?,FirstName=?,FirstUnit=?,FirstEdu=?,FirstTel=?,SecondRelation=?,SecondName=?,SecondUnit=?,SecondEdu=?,SecondTel=? where Email=?";
			//System.out.println(contact_sql);
			Number=update(relation_sql,new Object[]{FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,Email});	
		}
		else if(CheckId<=0)
		{
			relation_sql = "insert into zsb_self(Email,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel)values(?,?,?,?,?,?,?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(relation_sql,new Object[]{Email,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel});	
		}		
		return Number;
	}
	public int studyUtil(String Table,String IDcard,String HighSchool,String HighLink,String HighDepartment,String HighLinkTel,String HighAddress,String HighPost,String HighBegin,String HighEnd,String MidSchool,String MidLink,String MidBegin,String MidEnd) {
		String study_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from `"+Table+"` where `IDcard`='"+IDcard+"'";
		CheckId=getInt(check_sql);
		if(CheckId>0){
			study_sql = "update `"+Table+"` set `HighSchool`='"+HighSchool+"',`HighLink`='"+HighLink+"',`HighDepartment`='"+HighDepartment+"',`HighTel`='"+HighLinkTel+"',`HighAddress`='"+HighAddress+"',`HighPost`='"+HighPost+"',`HighBegin`='"+HighBegin+"',`HighEnd`='"+HighEnd+"',`MidSchool`='"+MidSchool+"',`MidLink`='"+MidLink+"',`MidBegin`='"+MidBegin+"',`MidEnd`='"+MidEnd+"' where `IDcard`='"+IDcard+"'";
			Number=update(study_sql);	
		}
		else if(CheckId<=0)
		{
			study_sql = "insert into zsb_athlete(Email,HighSchool,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HighBegin,HighEnd,MidSchool,MidLink,MidBegin,MidEnd)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(study_sql);	
		}		
		return Number;
	}
	public int recommendstudyUtil(String Email,String HighSchool,String IsKey,String HighLink,String HighDepartment,String HighLinkTel,String HighAddress,String HighPost,String HighBegin,String HighEnd,String MidSchool,String MidLink,String MidBegin,String MidEnd) {
		String study_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_recommend where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			study_sql = "update zsb_recommend set HighSchool=?,IsKey=?,HighLink=?,HighDepartment=?,HighLinkTel=?,HighAddress=?,HighPost=?,HighBegin=?,HighEnd=?,MidSchool=?,MidLink=?,MidBegin=?,MidEnd=? where Email=?";
			//System.out.println(contact_sql);
			Number=update(study_sql,new Object[]{HighSchool,IsKey,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HighBegin,HighEnd,MidSchool,MidLink,MidBegin,MidEnd,Email});	
		}
		else if(CheckId<=0)
		{
			study_sql = "insert into zsb_recommend(Email,HighSchool,IsKey,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HighBegin,HighEnd,MidSchool,MidLink,MidBegin,MidEnd)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(study_sql,new Object[]{Email,HighSchool,IsKey,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HighBegin,HighEnd,MidSchool,MidLink,MidBegin,MidEnd});	
		}		
		return Number;
	}
	public int selfstudyUtil(String Email,String HighSchool,String IsKey,String HighLink,String HighDepartment,String HighLinkTel,String HighAddress,String HighPost,String HighBegin,String HighEnd,String MidSchool,String MidLink,String MidBegin,String MidEnd) {
		String study_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_self where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			study_sql = "update zsb_self set HighSchool=?,IsKey=?,HighLink=?,HighDepartment=?,HighLinkTel=?,HighAddress=?,HighPost=?,HighBegin=?,HighEnd=?,MidSchool=?,MidLink=?,MidBegin=?,MidEnd=? where Email=?";
			//System.out.println(contact_sql);
			Number=update(study_sql,new Object[]{HighSchool,IsKey,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HighBegin,HighEnd,MidSchool,MidLink,MidBegin,MidEnd,Email});	
		}
		else if(CheckId<=0)
		{
			study_sql = "insert into zsb_self(Email,HighSchool,IsKey,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HighBegin,HighEnd,MidSchool,MidLink,MidBegin,MidEnd)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(study_sql,new Object[]{Email,HighSchool,IsKey,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HighBegin,HighEnd,MidSchool,MidLink,MidBegin,MidEnd});	
		}		
		return Number;
	}
	public int projectUtil(String Table,String IDcard,String Project,String Level,String GetTime) {
		String project_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from `"+Table+"` where `IDcard`='"+IDcard+"'";
		CheckId=getInt(check_sql);
		if(CheckId>0){
			project_sql = "update `"+Table+"` set `Project`='"+Project+"',`Level`='"+Level+"',`GetTime`='"+GetTime+"'";
			Number=update(project_sql);	
		}
		else if(CheckId<=0)
		{
			project_sql = "insert into zsb_athlete(Email,Project,Level,GetTime)values(?,?,?,?)";				
			Number=update(project_sql);	
		}		
		return Number;
	}
	public int recommendprojectUtil(String Email,String FirstSpecialty,String SecondSpecialty,String ThirdSpecialty,String FourthSpecialty,String FifthSpecialty,String SixthSpecialty,String TiaoJi) {
		String project_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_recommend where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			project_sql = "update zsb_recommend set FirstSpecialty=?,SecondSpecialty=?,ThirdSpecialty=?,FourthSpecialty=?,FifthSpecialty=?,SixthSpecialty=?,TiaoJi=? where Email=?";
			//System.out.println(contact_sql);
			Number=update(project_sql,new Object[]{FirstSpecialty,SecondSpecialty,ThirdSpecialty,FourthSpecialty,FifthSpecialty,SixthSpecialty,TiaoJi,Email});	
		}
		else if(CheckId<=0)
		{
			project_sql = "insert into zsb_recommend(Email,FirstSpecialty,SecondSpecialty,ThirdSpecialty,FourthSpecialty,FifthSpecialty,SixthSpecialty,TiaoJi)values(?,?,?,?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(project_sql,new Object[]{Email,FirstSpecialty,SecondSpecialty,ThirdSpecialty,FourthSpecialty,FifthSpecialty,SixthSpecialty,TiaoJi});	
		}		
		return Number;
	}
	public int selfprojectUtil(String IDcard,String FirstSpecialty,String SecondSpecialty,String ThirdSpecialty,String FourthSpecialty,String FifthSpecialty,String SixthSpecialty,String TiaoJi) {
		String project_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_self_trial where IDcard=?";		
		CheckId=getInt(check_sql,new Object[]{IDcard});
		//System.out.println(CheckId);
		if(CheckId>0){
			project_sql = "update zsb_self_trial set FirstSpecialty=?,SecondSpecialty=?,ThirdSpecialty=?,FourthSpecialty=?,FifthSpecialty=?,SixthSpecialty=?,Tiaoji=? where IDcard=?";
			//System.out.println(contact_sql);
			Number=update(project_sql,new Object[]{FirstSpecialty,SecondSpecialty,ThirdSpecialty,FourthSpecialty,FifthSpecialty,SixthSpecialty,TiaoJi,IDcard});	
		}
		else if(CheckId<=0)
		{
			project_sql = "insert into zsb_self_trial(IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,FourthSpecialty,FifthSpecialty,SixthSpecialty,TiaoJi)values(?,?,?,?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(project_sql,new Object[]{IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,FourthSpecialty,FifthSpecialty,SixthSpecialty,TiaoJi});	
		}		
		return Number;
	}
	public int appendUtil(String Table,String IDcard,String Height,String Weight,String Strength,String Awards) {
		String append_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select `Id` from `"+Table+"` where `IDcard`='"+IDcard+"'";		
		CheckId=getInt(check_sql);
		if(CheckId>0){
			append_sql = "update `"+Table+"` set `Height`='"+Height+"',`Weight`='"+Weight+"',`Strength`='"+Strength+"',`Awards`='"+Awards+"' where `IDcard`='"+IDcard+"'";
			Number=update(append_sql);	
		}
		else if(CheckId<=0)
		{
			append_sql = "insert into `"+Table+"`(`IDcard`,`Height`,`Weight`,`Strength`,`Awards`)values('"+IDcard+"','"+Height+"','"+Weight+"','"+Strength+"','"+Awards+"'";
			Number=update(append_sql);	
		}		
		return Number;
	}
	public int recommendappendUtil(String Email,String Contest,String Awards,String Activities) {
		String append_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_recommend where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			append_sql = "update zsb_recommend set Contest=?,Awards=?,Activities=? where Email=?";
			//System.out.println(contact_sql);
			Number=update(append_sql,new Object[]{Contest,Awards,Activities,Email});	
		}
		else if(CheckId<=0)
		{
			append_sql = "insert into zsb_recommend(Email,Contest,Awards,Activities)values(?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(append_sql,new Object[]{Email,Contest,Awards,Activities});	
		}		
		return Number;
	}
	public int selfappendUtil(String Email,String Plan,String Contest,String Awards,String Activities) {
		String append_sql = "";
		int Number = 0;
		int CheckId=0;
		String check_sql="select Id from zsb_self where Email=?";		
		CheckId=getInt(check_sql,new Object[]{Email});
		//System.out.println(CheckId);
		if(CheckId>0){
			append_sql = "update zsb_self set Plan=?,Contest=?,Awards=?,Activities=? where Email=?";
			//System.out.println(contact_sql);
			Number=update(append_sql,new Object[]{Plan,Contest,Awards,Activities,Email});	
		}
		else if(CheckId<=0)
		{
			append_sql = "insert into zsb_self(Plan,Email,Contest,Awards,Activities)values(?,?,?,?,?)";				
			//System.out.println(info_sql);		
			Number=update(append_sql,new Object[]{Plan,Email,Contest,Awards,Activities});	
		}		
		return Number;
	}
	public int photoUtil(String Photo,String Email) {
		String photo_sql = "";
		int Number = 0;
		photo_sql = "update zsb_reg set Photo=? where Email=?";		
		Number=update(photo_sql,new Object[]{Photo,Email});
		return Number;
	}
	public int submitUtil(String Table,String IDcard,String Year,String Specialty,String Province,String Subject) {
		int iNo=0;
		String Status="已提交高水平运动员报名申请表";
		String submit_sql = "";
		String Sequence="";
		String CheckId="";
		String check_sql="";
		check_sql="select max(`Sequence`) from `"+Table+"`";
		CheckId=getString(check_sql);
		String Final="";
		int SerialNum=0;
		if(CheckId!=null){
			SerialNum=Integer.parseInt(CheckId);
			SerialNum=SerialNum+1;
			DecimalFormat df = new DecimalFormat("0000");
			Final= df.format(SerialNum);
		}
		else if(CheckId==null)
		{
			Final="0001";	
		}
		Sequence=Final;
		String Number=Year+common.Const.Type.get(Specialty)+common.Const.Province.get(Province)+common.Const.Subject.get(Subject)+Sequence;
		submit_sql = "update `"+Table+"`  set `Sequence`='"+Sequence+"',`Number`='"+Number+"',`Status`='"+Status+"' where `IDcard`='"+IDcard+"'";
		iNo=update(submit_sql);
		return iNo;
	}
	public int recommendsubmitUtil(String Email,String Year,String Project,String Province,String Subject) {
		int iNo=0;
		String Status="2";
		String submit_sql = "";
		String Number="";
		String CheckId="";
		//int CurrentId=0;
		//String Id_sql="select Id from zsb_athlete order by Id desc";		
		//CurrentId=getInt(Id_sql);
		//int Id=CurrentId-1; 
		String check_sql="select max(Number) from zsb_recommend";
		//String MaxId=Id+"";
		//CheckId=getString(check_sql,new Object[]{MaxId});
		CheckId=getString(check_sql);
		String Serial="";
		String Final="";
		int SerialNum=0;
		//System.out.println(CheckId);
		if(CheckId!=null){
			SerialNum=Integer.parseInt(CheckId);
			//System.out.println(SerialNum);
			SerialNum=SerialNum+1;
			//System.out.println(SerialNum);
			DecimalFormat df = new DecimalFormat("0000");
			Final= df.format(SerialNum);
			//System.out.println(Final);
			//System.out.println(Serial);
		}
		else if(CheckId==null)
		{
			Final="0001";	
		}
		Number=Final;
		submit_sql = "update zsb_recommend set Number=?,Status=? where Email=?";
		//System.out.println(submit_sql);
		iNo=update(submit_sql,new Object[]{Number,Status,Email});
		return iNo;
	}
	public int selfsubmitUtil(String Email,String Year,String Project,String Province,String Subject) {
		int iNo=0;
		String Status="2";
		String submit_sql = "";
		String Number="";
		String CheckId="";
		//int CurrentId=0;
		//String Id_sql="select Id from zsb_athlete order by Id desc";		
		//CurrentId=getInt(Id_sql);
		//int Id=CurrentId-1; 
		String check_sql="select max(Number) from zsb_self";
		//String MaxId=Id+"";
		//CheckId=getString(check_sql,new Object[]{MaxId});
		CheckId=getString(check_sql);
		String Serial="";
		String Final="";
		int SerialNum=0;
		//System.out.println(CheckId);
		if(CheckId!=null){
			SerialNum=Integer.parseInt(CheckId);
			//System.out.println(SerialNum);
			SerialNum=SerialNum+1;
			//System.out.println(SerialNum);
			DecimalFormat df = new DecimalFormat("0000");
			Final= df.format(SerialNum);
			//System.out.println(Final);
			//System.out.println(Serial);
		}
		else if(CheckId==null)
		{
			Final="0001";	
		}
		Number=Final;
		submit_sql = "update zsb_self set Number=?,Status=? where Email=?";
		//System.out.println(submit_sql);
		iNo=update(submit_sql,new Object[]{Number,Status,Email});
		return iNo;
	}
	public void test() {
		regUtil("superzhaosheng","32038219901004942X","crytoll@163.com","photo.jpg");
	}
    public void logintest(){
    	int result=-1;
    	result=login("crytoll@163.com","superzzzs");
    }
    public List getInfoList(String Type,String IDcard){
    	List l=new ArrayList();    	
    	String sql="select Name,Sex,Nation,Province,Birthday,Politic,Language,Type,Subject from `"+Type+"` where IDcard="+IDcard;    	
    	l=this.getList(sql);
    	return l;
    }
    public String getEntranceNo(String Type,String IDcard){
    	String name_sql="select EntranceNo from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String name="";
    	name=getString(name_sql);
    	return name;
    }
    public String getName(String Type,String IDcard){
    	String name_sql="select `Name` from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	String name=getString(name_sql);
    	return name;
    }
    public String getRecommendName(String IDcard){
    	String name_sql="select Name from zsb_recommend where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String name="";
    	name=getString(name_sql);
    	return name;
    }
    public String getSelfName(String IDcard){
    	String name_sql="select Name from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String name="";
    	name=getString(name_sql);
    	return name;
    }
    public String getSex(String Type,String IDcard){
    	String sex_sql="select Sex from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String sex="";
    	sex=getString(sex_sql);
    	return sex;
    }
    public String getRecommendSex(String IDcard){
    	String sex_sql="select Sex from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String sex="";
    	sex=getString(sex_sql);
    	return sex;
    }
    public String getSelfSex(String IDcard){
    	String sex_sql="select Sex from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String sex="";
    	sex=getString(sex_sql);
    	return sex;
    }
    public String getNation(String Type,String IDcard){
    	String nation_sql="select Nation from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String nation="";
    	nation=getString(nation_sql);
    	return nation;
    }
    public String getRecommendNation(String IDcard){
    	String nation_sql="select Nation from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String nation="";
    	nation=getString(nation_sql);
    	return nation;
    }
    public String getSelfNation(String IDcard){
    	String nation_sql="select Nation from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String nation="";
    	nation=getString(nation_sql);
    	return nation;
    }
    public String getProvince(String Type,String IDcard){
    	String province_sql="select Province from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String province="";
    	province=getString(province_sql);
    	return province;
    }
    public String getRecommendProvince(String IDcard){
    	String province_sql="select Province from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String province="";
    	province=getString(province_sql);
    	return province;
    }
    public String getSelfProvince(String IDcard){
    	String province_sql="select Province from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String province="";
    	province=getString(province_sql);
    	return province;
    }
    public String getBirthday(String Type,String IDcard){
    	String birthday_sql="select Birthday from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String birthday="";
    	birthday=getString(birthday_sql);
    	return birthday;
    }
    public String getRecommendBirthday(String IDcard){
    	String birthday_sql="select Birthday from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String birthday="";
    	birthday=getString(birthday_sql);
    	return birthday;
    }
    public String getSelfBirthday(String IDcard){
    	String birthday_sql="select Birthday from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String birthday="";
    	birthday=getString(birthday_sql);
    	return birthday;
    }
    public String getPolitic(String Type,String IDcard){
    	String politic_sql="select Politic from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String politic="";
    	politic=getString(politic_sql);
    	return politic;
    }
    public String getRecommendPolitic(String IDcard){
    	String politic_sql="select Politic from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String politic="";
    	politic=getString(politic_sql);
    	return politic;
    }
    public String getSelfPolitic(String IDcard){
    	String politic_sql="select Politic from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String politic="";
    	politic=getString(politic_sql);
    	return politic;
    }
    public String getLanguage(String Type,String IDcard){
    	String language_sql="select Language from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String language="";
    	language=getString(language_sql);
    	return language;
    }
    public String getRecommendLanguage(String IDcard){
    	String language_sql="select Language from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String language="";
    	language=getString(language_sql);
    	return language;
    }
    public String getSelfLanguage(String IDcard){
    	String language_sql="select Language from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String language="";
    	language=getString(language_sql);
    	return language;
    }
    public String getIsYingjie(String Type,String IDcard){
    	String type_sql="select IsYingjie from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql);
    	return type;
    }
    public String getSubject(String Type,String IDcard){
    	String subject_sql="select Subject from `"+Type+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String subject="";
    	subject=getString(subject_sql);
    	return subject;
    }
    public String getRecommendSubject(String IDcard){
    	String subject_sql="select Subject from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String subject="";
    	subject=getString(subject_sql);
    	return subject;
    }
    public String getSelfSubject(String IDcard){
    	String subject_sql="select Subject from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String subject="";
    	subject=getString(subject_sql);
    	return subject;
    }
    public String getSelfTrialSubject(String IDcard){
    	String subject_sql="select Subject from zsb_self_trial where IDcard=?";
    	//System.out.println(release_sql);
    	String subject="";
    	subject=getString(subject_sql);
    	//System.out.println(subject);
    	return subject;
    }
    public String getMobile(String Table,String IDcard){
    	String mobile_sql="select Mobile from `"+Table+"` where IDcard='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String mobile="";
    	mobile=getString(mobile_sql);
    	return mobile;
    }
    public String getRecommendMobile(String IDcard){
    	String mobile_sql="select Mobile from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String mobile="";
    	mobile=getString(mobile_sql);
    	return mobile;
    }
    public String getSelfMobile(String IDcard){
    	String mobile_sql="select Mobile from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String mobile="";
    	mobile=getString(mobile_sql);
    	return mobile;
    }
    public String getTel(String Table,String IDcard){
    	String tel_sql="select HomeTel from `"+Table+"` where IDcard='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String tel="";
    	tel=getString(tel_sql);
    	return tel;
    }
    public String getRecommendTel(String IDcard){
    	String tel_sql="select HomeTel from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String tel="";
    	tel=getString(tel_sql);
    	return tel;
    }
    public String getSelfTel(String IDcard){
    	String tel_sql="select HomeTel from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String tel="";
    	tel=getString(tel_sql);
    	return tel;
    }
    public String getAddress(String Table,String IDcard){
    	String address_sql="select HomeAddress from `"+Table+"` where IDcard='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String address="";
    	address=getString(address_sql);
    	return address;
    }
    public String getRecommendAddress(String IDcard){
    	String address_sql="select HomeAddress from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String address="";
    	address=getString(address_sql);
    	return address;
    }
    public String getSelfAddress(String IDcard){
    	String address_sql="select HomeAddress from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String address="";
    	address=getString(address_sql);
    	return address;
    }
    public String getPost(String Table,String IDcard){
    	String post_sql="select HomePost from `"+Table+"` where IDcard='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String post="";
    	post=getString(post_sql);
    	return post;
    }
    public String getRecommendPost(String IDcard){
    	String post_sql="select HomePost from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String post="";
    	post=getString(post_sql);
    	return post;
    }
    public String getSelfPost(String IDcard){
    	String post_sql="select HomePost from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String post="";
    	post=getString(post_sql);
    	return post;
    }
    public String getFirstRelation(String Table,String IDcard){
    	String firstrelation_sql="select FirstRelation from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String firstrelation="";
    	firstrelation=getString(firstrelation_sql);
    	return firstrelation;
    }
    public String getRecommendFirstRelation(String IDcard){
    	String firstrelation_sql="select FirstRelation from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String firstrelation="";
    	firstrelation=getString(firstrelation_sql);
    	return firstrelation;
    }
    public String getSelfFirstRelation(String IDcard){
    	String firstrelation_sql="select FirstRelation from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String firstrelation="";
    	firstrelation=getString(firstrelation_sql);
    	return firstrelation;
    }
    public String getFirstName(String Table,String IDcard){
    	String firstname_sql="select FirstName from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String firstname="";
    	firstname=getString(firstname_sql);
    	return firstname;
    }
    public String getRecommendFirstName(String IDcard){
    	String firstname_sql="select FirstName from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String firstname="";
    	firstname=getString(firstname_sql);
    	return firstname;
    }
    public String getSelfFirstName(String IDcard){
    	String firstname_sql="select FirstName from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String firstname="";
    	firstname=getString(firstname_sql);
    	return firstname;
    }
    public String getFirstUnit(String Table,String IDcard){
    	String firstunit_sql="select FirstUnit from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String firstunit="";
    	firstunit=getString(firstunit_sql);
    	return firstunit;
    }
    public String getRecommendFirstUnit(String IDcard){
    	String firstunit_sql="select FirstUnit from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String firstunit="";
    	firstunit=getString(firstunit_sql);
    	return firstunit;
    }
    public String getSelfFirstUnit(String IDcard){
    	String firstunit_sql="select FirstUnit from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String firstunit="";
    	firstunit=getString(firstunit_sql);
    	return firstunit;
    }
    public String getFirstEdu(String Table,String IDcard){
    	String firstedu_sql="select FirstEdu from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String firstedu="";
    	firstedu=getString(firstedu_sql);
    	return firstedu;
    }
    public String getRecommendFirstEdu(String IDcard){
    	String firstedu_sql="select FirstEdu from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String firstedu="";
    	firstedu=getString(firstedu_sql);
    	return firstedu;
    }
    public String getSelfFirstEdu(String IDcard){
    	String firstedu_sql="select FirstEdu from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String firstedu="";
    	firstedu=getString(firstedu_sql);
    	return firstedu;
    }
    public String getFirstTel(String Table,String IDcard){
    	String firsttel_sql="select FirstTel from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String firsttel="";
    	firsttel=getString(firsttel_sql);
    	return firsttel;
    }
    public String getRecommendFirstTel(String IDcard){
    	String firsttel_sql="select FirstTel from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String firsttel="";
    	firsttel=getString(firsttel_sql);
    	return firsttel;
    }
    public String getSelfFirstTel(String IDcard){
    	String firsttel_sql="select FirstTel from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String firsttel="";
    	firsttel=getString(firsttel_sql);
    	return firsttel;
    }
    public String getSecondRelation(String Table,String IDcard){
    	String secondrelation_sql="select SecondRelation from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String secondrelation="";
    	secondrelation=getString(secondrelation_sql);
    	return secondrelation;
    }
    public String getRecommendSecondRelation(String IDcard){
    	String secondrelation_sql="select SecondRelation from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String secondrelation="";
    	secondrelation=getString(secondrelation_sql);
    	return secondrelation;
    }
    public String getSelfSecondRelation(String IDcard){
    	String secondrelation_sql="select SecondRelation from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String secondrelation="";
    	secondrelation=getString(secondrelation_sql);
    	return secondrelation;
    }
    public String getSecondName(String Table,String IDcard){
    	String secondname_sql="select SecondName from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String secondname="";
    	secondname=getString(secondname_sql);
    	return secondname;
    }
    public String getRecommendSecondName(String IDcard){
    	String secondname_sql="select SecondName from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String secondname="";
    	secondname=getString(secondname_sql);
    	return secondname;
    }
    public String getSelfSecondName(String IDcard){
    	String secondname_sql="select SecondName from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String secondname="";
    	secondname=getString(secondname_sql);
    	return secondname;
    }
    public String getSecondUnit(String Table,String IDcard){
    	String secondunit_sql="select SecondUnit from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String secondunit="";
    	secondunit=getString(secondunit_sql);
    	return secondunit;
    }
    public String getRecommendSecondUnit(String IDcard){
    	String secondunit_sql="select SecondUnit from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String secondunit="";
    	secondunit=getString(secondunit_sql);
    	return secondunit;
    }
    public String getSelfSecondUnit(String IDcard){
    	String secondunit_sql="select SecondUnit from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String secondunit="";
    	secondunit=getString(secondunit_sql);
    	return secondunit;
    }
    public String getSecondEdu(String Table,String IDcard){
    	String secondedu_sql="select SecondEdu from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String secondedu="";
    	secondedu=getString(secondedu_sql);
    	return secondedu;
    }
    public String getRecommendSecondEdu(String IDcard){
    	String secondedu_sql="select SecondEdu from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String secondedu="";
    	secondedu=getString(secondedu_sql);
    	return secondedu;
    }
    public String getSelfSecondEdu(String IDcard){
    	String secondedu_sql="select SecondEdu from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String secondedu="";
    	secondedu=getString(secondedu_sql);
    	return secondedu;
    }
    public String getSecondTel(String Table,String IDcard){
    	String secondtel_sql="select SecondTel from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String secondtel="";
    	secondtel=getString(secondtel_sql);
    	return secondtel;
    }
    public String getRecommendSecondTel(String IDcard){
    	String secondtel_sql="select SecondTel from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String secondtel="";
    	secondtel=getString(secondtel_sql);
    	return secondtel;
    }
    public String getSelfSecondTel(String IDcard){
    	String secondtel_sql="select SecondTel from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String secondtel="";
    	secondtel=getString(secondtel_sql);
    	return secondtel;
    }
    public String getHighSchool(String Table,String IDcard){
    	String highschool_sql="select `HighSchool` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String highschool="";
    	highschool=getString(highschool_sql);
    	return highschool;
    }
    public String getRecommendHighSchool(String IDcard){
    	String highschool_sql="select HighSchool from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String highschool="";
    	highschool=getString(highschool_sql);
    	return highschool;
    }
    public String getSelfHighSchool(String IDcard){
    	String highschool_sql="select HighSchool from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String highschool="";
    	highschool=getString(highschool_sql);
    	return highschool;
    }
    public String getRecommendIskey(String IDcard){
    	String highschool_sql="select IsKey from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String highschool="";
    	highschool=getString(highschool_sql);
    	return highschool;
    }
    public String getSelfIskey(String IDcard){
    	String highschool_sql="select IsKey from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String highschool="";
    	highschool=getString(highschool_sql);
    	return highschool;
    }
    public String getHighLink(String Table,String IDcard){
    	String highlink_sql="select `HighLink` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String highlink="";
    	highlink=getString(highlink_sql);
    	return highlink;
    }
    public String getRecommendHighLink(String IDcard){
    	String highlink_sql="select HighLink from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String highlink="";
    	highlink=getString(highlink_sql);
    	return highlink;
    }
    public String getSelfHighLink(String IDcard){
    	String highlink_sql="select HighLink from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String highlink="";
    	highlink=getString(highlink_sql);
    	return highlink;
    }
    public String getHighDepartment(String Table,String IDcard){
    	String highdepartment_sql="select `HighDepartment` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String highdepartment="";
    	highdepartment=getString(highdepartment_sql);
    	return highdepartment;
    }
    public String getRecommendHighDepartment(String IDcard){
    	String highdepartment_sql="select HighDepartment from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String highdepartment="";
    	highdepartment=getString(highdepartment_sql);
    	return highdepartment;
    }
    public String getSelfHighDepartment(String IDcard){
    	String highdepartment_sql="select HighDepartment from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String highdepartment="";
    	highdepartment=getString(highdepartment_sql);
    	return highdepartment;
    }
    public String getHighLinkTel(String Table,String IDcard){
    	String highlinktel_sql="select HighTel from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String highlinktel="";
    	highlinktel=getString(highlinktel_sql);
    	return highlinktel;
    }
    public String getRecommendHighLinkTel(String IDcard){
    	String highlinktel_sql="select HighLinkTel from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String highlinktel="";
    	highlinktel=getString(highlinktel_sql);
    	return highlinktel;
    }
    public String getSelfHighLinkTel(String IDcard){
    	String highlinktel_sql="select HighLinkTel from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String highlinktel="";
    	highlinktel=getString(highlinktel_sql);
    	return highlinktel;
    }
    public String getHighAddress(String Table,String IDcard){
    	String highaddress_sql="select HighAddress from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String highaddress="";
    	highaddress=getString(highaddress_sql);
    	return highaddress;
    }
    public String getRecommendHighAddress(String IDcard){
    	String highaddress_sql="select HighAddress from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String highaddress="";
    	highaddress=getString(highaddress_sql);
    	return highaddress;
    }
    public String getSelfHighAddress(String IDcard){
    	String highaddress_sql="select HighAddress from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String highaddress="";
    	highaddress=getString(highaddress_sql);
    	return highaddress;
    }
    public String getHighPost(String Table,String IDcard){
    	String highpost_sql="select HighPost from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String highpost="";
    	highpost=getString(highpost_sql);
    	return highpost;
    }
    public String getRecommendHighPost(String IDcard){
    	String highpost_sql="select HighPost from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String highpost="";
    	highpost=getString(highpost_sql);
    	return highpost;
    }
    public String getSelfHighPost(String IDcard){
    	String highpost_sql="select HighPost from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String highpost="";
    	highpost=getString(highpost_sql);
    	return highpost;
    }
    public String getHighBegin(String Table,String IDcard){
    	String highbegin_sql="select HighBegin from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String highbegin="";
    	highbegin=getString(highbegin_sql);
    	return highbegin;
    }
    public String getRecommendHighBegin(String IDcard){
    	String highbegin_sql="select HighBegin from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String highbegin="";
    	highbegin=getString(highbegin_sql);
    	return highbegin;
    }
    public String getSelfHighBegin(String IDcard){
    	String highbegin_sql="select HighBegin from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String highbegin="";
    	highbegin=getString(highbegin_sql);
    	return highbegin;
    }
    public String getHighEnd(String Table,String IDcard){
    	String highend_sql="select HighEnd from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String highend="";
    	highend=getString(highend_sql);
    	return highend;
    }
    public String getRecommendHighEnd(String IDcard){
    	String highend_sql="select HighEnd from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String highend="";
    	highend=getString(highend_sql);
    	return highend;
    }
    public String getSelfHighEnd(String IDcard){
    	String highend_sql="select HighEnd from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String highend="";
    	highend=getString(highend_sql);
    	return highend;
    }
    public String getMidSchool(String Table,String IDcard){
    	String midschool_sql="select MidSchool from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String midschool="";
    	midschool=getString(midschool_sql);
    	return midschool;
    }
    public String getRecommendMidSchool(String IDcard){
    	String midschool_sql="select MidSchool from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String midschool="";
    	midschool=getString(midschool_sql);
    	return midschool;
    }
    public String getSelfMidSchool(String IDcard){
    	String midschool_sql="select MidSchool from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String midschool="";
    	midschool=getString(midschool_sql);
    	return midschool;
    }
    public String getMidLink(String Table,String IDcard){
    	String midlink_sql="select MidLink from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String midlink="";
    	midlink=getString(midlink_sql);
    	return midlink;
    }
    public String getRecommendMidLink(String IDcard){
    	String midlink_sql="select MidLink from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String midlink="";
    	midlink=getString(midlink_sql);
    	return midlink;
    }
    public String getSelfMidLink(String IDcard){
    	String midlink_sql="select MidLink from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String midlink="";
    	midlink=getString(midlink_sql);
    	return midlink;
    }
    public String getMidBegin(String Table,String IDcard){
    	String midbegin_sql="select MidBegin from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String midbegin="";
    	midbegin=getString(midbegin_sql);
    	return midbegin;
    }
    public String getRecommendMidBegin(String IDcard){
    	String midbegin_sql="select MidBegin from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String midbegin="";
    	midbegin=getString(midbegin_sql);
    	return midbegin;
    }
    public String getSelfMidBegin(String IDcard){
    	String midbegin_sql="select MidBegin from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String midbegin="";
    	midbegin=getString(midbegin_sql);
    	return midbegin;
    }
    public String getMidEnd(String Table,String IDcard){
    	String midend_sql="select MidEnd from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String midend="";
    	midend=getString(midend_sql);
    	return midend;
    }
    public String getRecommendMidEnd(String IDcard){
    	String midend_sql="select MidEnd from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String midend="";
    	midend=getString(midend_sql);
    	return midend;
    }
    public String getSelfMidEnd(String IDcard){
    	String midend_sql="select MidEnd from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String midend="";
    	midend=getString(midend_sql);
    	return midend;
    }
    public String getProject(String Table,String IDcard){
    	String project_sql="select `Project` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String project="";
    	project=getString(project_sql);
    	return project;
    }
    public String getRecommendProject(String IDcard){
    	String project_sql="select Project from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String project="";
    	project=getString(project_sql);
    	return project;
    }
    public String getSelfProject(String IDcard){
    	String project_sql="select Project from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String project="";
    	project=getString(project_sql);
    	return project;
    }
    public String getLevel(String Table,String IDcard){
    	String level_sql="select `Level` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String level="";
    	level=getString(level_sql);
    	return level;
    }
    public String getRecommendLevel(String IDcard){
    	String level_sql="select Level from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String level="";
    	level=getString(level_sql);
    	return level;
    }
    public String getSelfLevel(String IDcard){
    	String level_sql="select Level from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String level="";
    	level=getString(level_sql);
    	return level;
    }
    public String getGetTime(String Table,String IDcard){
    	String gettime_sql="select `GetTime` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String gettime="";
    	gettime=getString(gettime_sql);
    	return gettime;
    }
    public String getRecommendGetTime(String IDcard){
    	String gettime_sql="select GetTime from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String gettime="";
    	gettime=getString(gettime_sql);
    	return gettime;
    }
    public String getSelfGetTime(String IDcard){
    	String gettime_sql="select GetTime from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String gettime="";
    	gettime=getString(gettime_sql);
    	return gettime;
    }
    public String getHeight(String Table,String IDcard){
    	String height_sql="select Height from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	//System.out.println(release_sql);
    	String height="";
    	height=getString(height_sql);
    	return height;
    }
    public String getRecommendEntranceNo(String IDcard){
    	String entranceno_sql="select EntranceNo from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String entranceno="";
    	entranceno=getString(entranceno_sql);
    	return entranceno;
    }
    public String getSelfEntranceNo(String IDcard){
    	String entranceno_sql="select EntranceNo from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String entranceno="";
    	entranceno=getString(entranceno_sql);
    	return entranceno;
    }
    public String getWeight(String Table,String IDcard){
    	String weight_sql="select `Weight` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String weight="";
    	weight=getString(weight_sql);
    	return weight;
    }
    public String getRecommendIsYingjie(String IDcard){
    	String isyingjie_sql="select IsYingjie from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String isyingjie="";
    	isyingjie=getString(isyingjie_sql);
    	return isyingjie;
    }
    public String getSelfIsYingjie(String IDcard){
    	String isyingjie_sql="select IsYingjie from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String isyingjie="";
    	isyingjie=getString(isyingjie_sql);
    	return isyingjie;
    }
    public String getStrength(String Table,String IDcard){
    	String strength_sql="select `Strength` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String strength="";
    	strength=getString(strength_sql);
    	return strength;
    }
    public String getRecommendIsKey(String IDcard){
    	String iskey_sql="select IsKey from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getSelfIsKey(String IDcard){
    	String iskey_sql="select IsKey from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getRecommendFirstSpecialty(String IDcard){
    	String iskey_sql="select FirstSpecialty from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getSelfFirstSpecialty(String IDcard){
    	String iskey_sql="select FirstSpecialty from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getRecommendSecondSpecialty(String IDcard){
    	String iskey_sql="select SecondSpecialty from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getSelfSecondSpecialty(String IDcard){
    	String iskey_sql="select SecondSpecialty from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getRecommendThirdSpecialty(String IDcard){
    	String iskey_sql="select ThirdSpecialty from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getSelfThirdSpecialty(String IDcard){
    	String iskey_sql="select ThirdSpecialty from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getRecommendFourthSpecialty(String IDcard){
    	String iskey_sql="select FourthSpecialty from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getSelfFourthSpecialty(String IDcard){
    	String iskey_sql="select FourthSpecialty from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getRecommendFifthSpecialty(String IDcard){
    	String iskey_sql="select FifthSpecialty from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getSelfFifthSpecialty(String IDcard){
    	String iskey_sql="select FifthSpecialty from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getRecommendSixthSpecialty(String IDcard){
    	String iskey_sql="select SixthSpecialty from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getSelfSixthSpecialty(String IDcard){
    	String iskey_sql="select SixthSpecialty from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getRecommendTiaoJi(String IDcard){
    	String iskey_sql="select TiaoJi from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	return iskey;
    }
    public String getSelfTiaoJi(String IDcard){
    	String iskey_sql="select Tiaoji from zsb_self_trial where IDcard=?";
    	//System.out.println(release_sql);
    	String iskey="";
    	iskey=getString(iskey_sql);
    	//System.out.println(iskey);
    	return iskey;
    }
    public String getAwards(String Table,String IDcard){
    	String awards_sql="select `Awards` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String awards="";
    	awards=getString(awards_sql);
    	return awards;
    }
    public String getRecommendContest(String IDcard){
    	String contest_sql="select Contest from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String contest="";
    	contest=getString(contest_sql);
    	return contest;
    }
    public String getSelfPlan(String IDcard){
    	String contest_sql="select Plan from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String contest="";
    	contest=getString(contest_sql);
    	return contest;
    }
    public String getSelfContest(String IDcard){
    	String contest_sql="select Contest from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String contest="";
    	contest=getString(contest_sql);
    	return contest;
    }
    public String getRecommendActivities(String IDcard){
    	String activities_sql="select Activities from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String activities="";
    	activities=getString(activities_sql);
    	return activities;
    }
    public String getSelfActivities(String IDcard){
    	String activities_sql="select Activities from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String activities="";
    	activities=getString(activities_sql);
    	return activities;
    }
    public String getRecommendAwards(String IDcard){
    	String awards_sql="select Awards from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String awards="";
    	awards=getString(awards_sql);
    	return awards;
    }
    public String getSelfAwards(String IDcard){
    	String awards_sql="select Awards from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String awards="";
    	awards=getString(awards_sql);
    	return awards;
    }
    public String getPhoto(String IDcard){
    	String photo_sql="select `Photo` from `zsb_reg` where `IDcard`='"+IDcard+"'";
    	String photo="";
    	photo=getString(photo_sql);
    	return photo;
    }
    public String getYear(){
    	String photo_sql="select `Year` from `zsb_signup`";
    	String photo="";
    	photo=getString(photo_sql);
    	return photo;
    }
    public String getEnd(String Name){
    	String end_sql="select `End` from `zsb_signup` where `Name`='"+Name+"'";
    	String end="";
    	end=getString(end_sql);
    	return end;
    }
    public String getIDcard(String Email){
    	String idcard_sql="select IDcard from zsb_reg where `Email`='"+Email+"'";
    	//System.out.println(release_sql);
    	String idcard="";
    	idcard=getString(idcard_sql);
    	return idcard;
    }
    public String getIDcardByNumber(String Table,String Number){
    	String idcard_sql="select IDcard from `"+Table+"` where `Number`='"+Number+"'";
    	String idcard="";
    	idcard=getString(idcard_sql);
    	return idcard;
    }
    public String getIDcardByName(String Table,String Name){
    	String idcard_sql="select IDcard from `"+Table+"` where `Name`='"+Name+"'";
    	String idcard="";
    	idcard=getString(idcard_sql);
    	return idcard;
    }
    public String getStatus(String IDcard){
    	String status="尚未提交申请表";
    	String selfStatus=getString("select Status from zsb_self where `IDcard`='"+IDcard+"'");
    	if(selfStatus!=null) status=selfStatus;
    	else if(selfStatus==null){
    		String athleteStatus=getString("select Status from zsb_athlete where `IDcard`='"+IDcard+"'");
    		if(athleteStatus!=null) status=athleteStatus;
    		else if(athleteStatus==null){
        		String recommendStatus=getString("select Status from zsb_recommend where `IDcard`='"+IDcard+"'");
        		if(recommendStatus!=null) status=recommendStatus;
        	}
    	}    	
    	return status;
    }
    public String getRecommendStatus(String IDcard){
    	String status_sql="select Status from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String status="";
    	status=getString(status_sql);
    	return status;
    }
    public String getSelfStatus(String IDcard){
    	String status_sql="select Status from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String status="";
    	status=getString(status_sql);
    	return status;
    }
    public String getSelfExemption(String IDcard){
    	String status_sql="select Exemption from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String status="";
    	status=getString(status_sql);
    	return status;
    }
    public String getNumber(String Table,String IDcard){
    	String number_sql="select `Number` from `"+Table+"` where `IDcard`='"+IDcard+"'";
    	String number="";
    	number=getString(number_sql);
    	return number;
    }
    public String getRecommendNumber(String IDcard){
    	String number_sql="select Number from zsb_recommend where Email=?";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql);
    	return number;
    }
    public String getSelfNumber(String IDcard){
    	String number_sql="select Number from zsb_self where Email=?";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql);
    	return number;
    }
    public String getSelfTrialNumber(String IDcard){
    	String number_sql="select Number from zsb_self_trial where IDcard=?";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{IDcard});
    	return number;
    }
    public String getIfAdmission(String Table){
    	String admission_sql="select `open` from `"+Table+"`";
    	String open=getString(admission_sql);
    	return open;
    }
    public String getAerobicsDate(){
    	String number_sql="select AerobicsDate from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getAerobicsBegin(){
    	String number_sql="select AerobicsBegin from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getAerobicsEnd(){
    	String number_sql="select AerobicsEnd from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getAerobicsAddress(){
    	String number_sql="select AerobicsAddress from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getSwimDate(){
    	String number_sql="select SwimDate from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getSwimBegin(){
    	String number_sql="select SwimBegin from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getSwimEnd(){
    	String number_sql="select SwimEnd from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getSwimAddress(){
    	String number_sql="select SwimAddress from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getCulturalDate(){
    	String number_sql="select CulturalDate from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getCulturalBegin(){
    	String number_sql="select CulturalBegin from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getCulturalEnd(){
    	String number_sql="select CulturalEnd from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getCulturalAddress(){
    	String number_sql="select CulturalAddress from zsb_athlete_admission";
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String JudgeAdmission(String Type){
    	String number_sql="";
    	if(Type.equals("Athlete"))
    	{
    		number_sql="select Open from zsb_athlete_admission";
    	}
    	if(Type.equals("Recommend"))
    	{
    		number_sql="select Open from zsb_recommend_admission";
    	}
    	if(Type.equals("Self"))
    	{
    		number_sql="select Open from zsb_self_admission";
    	}
    	//System.out.println(release_sql);
    	String number="";
    	number=getString(number_sql,new Object[]{});
    	return number;
    }
    public String getRegistration(String IDcard){
    	String registration_sql="select Registration from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String registration="";
    	registration=getString(registration_sql,new Object[]{IDcard});
    	return registration;
    }
    public String getEnglish(String IDcard){
    	String english_sql="select English from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String english="";
    	english=getString(english_sql,new Object[]{IDcard});
    	return english;
    }
    public String getChinese(String IDcard){
    	String chinese_sql="select Chinese from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String chinese="";
    	chinese=getString(chinese_sql,new Object[]{IDcard});
    	return chinese;
    }
    public String getMath(String IDcard){
    	String math_sql="select Math from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String math="";
    	math=getString(math_sql,new Object[]{IDcard});
    	return math;
    }
    public String getCulture(String IDcard){
    	String culture_sql="select Culture from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String culture="";
    	culture=getString(culture_sql,new Object[]{IDcard});
    	return culture;
    }
    public String getAthleteLevel(String IDcard){
    	String level_sql="select Level from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String level="";
    	level=getString(level_sql,new Object[]{IDcard});
    	return level;
    }
    public String getAthleteProject(String IDcard){
    	String project_sql="select Project from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String project="";
    	project=getString(project_sql,new Object[]{IDcard});
    	return project;
    }
    public String getConclusion(String IDcard){
    	String conclusion_sql="select Conclusion from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String conclusion="";
    	conclusion=getString(conclusion_sql,new Object[]{IDcard});
    	return conclusion;
    }
    public String getSpecialty(String IDcard){
    	String specialty_sql="select Specialty from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String specialty="";
    	specialty=getString(specialty_sql,new Object[]{IDcard});
    	return specialty;
    }
    public String getAthleteType(String IDcard){
    	String type_sql="select Type from zsb_athlete_grade where IDcard=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{IDcard});
    	return type;
    }
    public String getTrial(String IDcard){
    	String type_sql="select Status from zsb_self_trial where IDcard=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{IDcard});
    	return type;
    }
    public String getRecommendTrial(String IDcard){
    	String type_sql="select Status from zsb_recommend_trial where IDcard=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{IDcard});
    	return type;
    }
    public String getRoomNo(String IDcard){
    	String type_sql="select Room from zsb_recommend_trial where IDcard=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{IDcard});
    	return type;
    }
    public String getSeat(String IDcard){
    	String type_sql="select Seat from zsb_recommend_trial where IDcard=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{IDcard});
    	return type;
    }
    public String getSelfRoomNo(String IDcard){
    	String type_sql="select Room from zsb_self_trial where IDcard=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{IDcard});
    	return type;
    }
    public String getMaxRoomNo(){
    	String type_sql="select max(RoomNo) from zsb_self";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{});
    	return type;
    }
    public String getLiberalMaxRoomNo(String Subject){
    	String type_sql="select max(Room) from zsb_self_trial where Subject=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{Subject});
    	return type;
    }
    public String getScienceMaxRoomNo(String Subject){
    	String type_sql="select max(Room) from zsb_self_trial where Subject=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{Subject});
    	return type;
    }
    public String getRecommendMaxSeat(){
    	String type_sql="select max(Seat) from zsb_recommend_trial";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{});
    	return type;
    }
    public String getMaxSeat(String RoomNo){
    	String type_sql="select max(Seat) from zsb_self_trial where Room=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{RoomNo});
    	return type;
    }
    public int setSeat(String RoomNo,String Seat,String InterviewBegin,String InterviewEnd,String IDcard){
    	//System.out.println(RoomNo);
    	//System.out.println(Seat);
    	//System.out.println(IDcard);
    	String type_sql="update zsb_self_trial set Room=?,Seat=?,InterviewBegin=?,InterviewEnd=? where IDcard=?";
    	//System.out.println(release_sql);
    	int type=0;
    	type=update(type_sql,new Object[]{RoomNo,Seat,InterviewBegin,InterviewEnd,IDcard});
    	return type;
    }
    public String getSeatAmount(String RoomNo){
    	String type_sql="select SeatAmount from zsb_self_seat where RoomNo=?";
    	//System.out.println(release_sql);
    	String type="";
    	type=getString(type_sql,new Object[]{RoomNo});
    	return type;
    }
    public String getSelfSeat(String IDcard){
    	String type_sql="select Seat from zsb_self_trial where IDcard=?";
    	String type="";
    	type=getString(type_sql,new Object[]{IDcard});
    	return type;
    }
    public String getMaxInterviewBegin() {
		String Date = "";
		String sql = "select max(InterviewBegin) from zsb_self_trial";
		Date = getString(sql, new Object[] {});
		return Date;
	}
    public long getInterviewCount(String MaxInterviewBegin){
    	long no=0;
    	String SQL="select count(*) from zsb_self_trial where InterviewBegin=?";
    	no=getLong(SQL,new Object[]{MaxInterviewBegin});
    	return no;
    }
    public String getSpecialInterview(String IDcard) {
		String Date = "";
		String sql = "select InterviewBegin from zsb_self_trial where IDcard=?";
		Date = getString(sql, new Object[] {IDcard});
		return Date;
	}
    public String getFirstSpecialty(String IDcard) {
		String firstspecialty = "";
		String sql = "select FirstSpecialty from zsb_self_trial where IDcard=?";
		firstspecialty = getString(sql, new Object[] {IDcard});
		if(firstspecialty==null)
		{
			sql = "select FirstSpecialty from zsb_recommend_trial where IDcard=?";
			firstspecialty = getString(sql, new Object[] {IDcard});
		}
		return firstspecialty;
	}
    public String getSecondSpecialty(String IDcard) {
		String secondspecialty = "";
		String sql = "select SecondSpecialty from zsb_self_trial where IDcard=?";
		secondspecialty = getString(sql, new Object[] {IDcard});
		if(secondspecialty==null)
		{
			sql = "select SecondSpecialty from zsb_recommend_trial where IDcard=?";
			secondspecialty = getString(sql, new Object[] {IDcard});
		}
		return secondspecialty;
	}
    public String getThirdSpecialty(String IDcard) {
		String thirdspecialty = "";
		String sql = "select ThirdSpecialty from zsb_self_trial where IDcard=?";
		thirdspecialty = getString(sql, new Object[] {IDcard});
		if(thirdspecialty==null)
		{
			sql = "select ThirdSpecialty from zsb_recommend_trial where IDcard=?";
			thirdspecialty = getString(sql, new Object[] {IDcard});
		}
		return thirdspecialty;
	}
    public String getFourthSpecialty(String IDcard) {
		String thirdspecialty = "";
		String sql = "select FourthSpecialty from zsb_self_trial where IDcard=?";
		thirdspecialty = getString(sql, new Object[] {IDcard});
		if(thirdspecialty==null)
		{
			sql = "select FourthSpecialty from zsb_recommend_trial where IDcard=?";
			thirdspecialty = getString(sql, new Object[] {IDcard});
		}
		return thirdspecialty;
	}
    public String getFifthSpecialty(String IDcard) {
		String thirdspecialty = "";
		String sql = "select FifthSpecialty from zsb_self_trial where IDcard=?";
		thirdspecialty = getString(sql, new Object[] {IDcard});
		if(thirdspecialty==null)
		{
			sql = "select FifthSpecialty from zsb_recommend_trial where IDcard=?";
			thirdspecialty = getString(sql, new Object[] {IDcard});
		}
		return thirdspecialty;
	}
    public String getSixthSpecialty(String IDcard) {
		String thirdspecialty = "";
		String sql = "select SixthSpecialty from zsb_self_trial where IDcard=?";
		thirdspecialty = getString(sql, new Object[] {IDcard});
		if(thirdspecialty==null)
		{
			sql = "select SixthSpecialty from zsb_recommend_trial where IDcard=?";
			thirdspecialty = getString(sql, new Object[] {IDcard});
		}
		return thirdspecialty;
	}
    public String getSelfTrialName(String idcard) {
		String name= "";
		String sql = "select `Name` from zsb_self_trial where IDcard=?";
		name = getString(sql, new Object[] {idcard});
		return name;
	}
    public String getSelfTrialSex(String idcard) {
		String sex= "";
		String sql = "select `Sex` from zsb_self_trial where IDcard=?";
		sex = getString(sql, new Object[] {idcard});
		return sex;
	}
    public String getSelfTrialProvince(String idcard) {
		String province= "";
		String sql = "select `Province` from zsb_self_trial where IDcard=?";
		province = getString(sql, new Object[] {idcard});
		return province;
	}
    public String getSelfTrialHighSchool(String idcard) {
		String highschool= "";
		String sql = "select `HighSchool` from zsb_self_trial where IDcard=?";
		highschool = getString(sql, new Object[] {idcard});
		return highschool;
	}
    public String getTrialPhoto(String idcard){
    	String photo_sql="select Photo from zsb_self_trial where IDcard=?";
    	//System.out.println(release_sql);
    	String photo="";
    	photo="/zzzs"+getString(photo_sql,new Object[]{idcard});
    	return photo;
    }
    public String getSelfChinese(String idcard){
    	String chinese_sql="select Chinese from zsb_self_trial where IDcard=?";
    	String chinese="";
    	chinese=getString(chinese_sql,new Object[]{idcard});
    	return chinese;
    }
    public String getSelfMath(String idcard){
    	String chinese_sql="select Math from zsb_self_trial where IDcard=?";
    	String chinese="";
    	chinese=getString(chinese_sql,new Object[]{idcard});
    	return chinese;
    }
    public String getSelfPhysics(String idcard){
    	String chinese_sql="select Physics from zsb_self_trial where IDcard=?";
    	String chinese="";
    	chinese=getString(chinese_sql,new Object[]{idcard});
    	return chinese;
    }
    public String getSelfInterview(String idcard){
    	String chinese_sql="select Interview from zsb_self_trial where IDcard=?";
    	String chinese="";
    	chinese=getString(chinese_sql,new Object[]{idcard});
    	return chinese;
    }
    public String getSelfGrade(String idcard){
    	//System.out.println(idcard);
    	String chinese_sql="select Grade from zsb_self_trial where IDcard=?";
    	String grade="";
    	grade=getString(chinese_sql,new Object[]{idcard});
    	//System.out.println(grade);
    	return grade;
    }
	public static void main(String[] args) {

	}

}