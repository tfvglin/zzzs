<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<jsp:directive.page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"/>
<jsp:directive.page import="org.apache.poi.hssf.usermodel.HSSFSheet"/>
<jsp:directive.page import="org.apache.poi.hssf.usermodel.HSSFRow"/>
<jsp:directive.page import="org.apache.poi.hssf.usermodel.HSSFCell"/>
<jsp:directive.page import="java.io.FileOutputStream"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:directive.page import="java.util.*"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <base href="<%=basePath%>">
<h2>生成高水平运动员统计表。。。。</h2>
    <%
    class Athlete{
    	    private String Name;
    	    public Athlete(){
    	    }
    	    public Athlete(String Name){
    	        this.Name=Name;
    	    }
    	    public String GetName(){
    	        if(Name==null){
    	            Name="";
    	        }
    	        return Name;
    	    }    	    
    	}
    	Date date = new Date();
    	String dt = new String(new SimpleDateFormat("yyyy.MM.dd_HH.mm.ss").format(date));
    	//Excel工作薄创建的位置
    	String sFilename = getServletConfig().getServletContext().getRealPath("//excel//"+dt+"athlete.xls");
    	String excelpath="";
    	int start=0;
    	try
    	{
    		//创建新的工作薄
    		HSSFWorkbook wordbook = new HSSFWorkbook();
    		//在Excel工作薄中创建一个名为FIRST的工作表
    		HSSFSheet sheet = wordbook.createSheet("高水平运动员统计表");
    		HSSFRow row0 = sheet.createRow((short)0);    		
    		HSSFCell cell0 = row0.createCell((short)0);    		
    		cell0.setCellValue("高水平运动员统计表");    		
    		HSSFRow row1 = sheet.createRow((short)1);    		
    		//在索引0的位置创建单元格,对应着第一行第一列的单元格
    		HSSFCell cell1 = row1.createCell((short)0);    		
    		HSSFCell cell2 = row1.createCell((short)1);    		
    		HSSFCell cell3 = row1.createCell((short)2);    		
    		HSSFCell cell4 = row1.createCell((short)3);    		
    		HSSFCell cell5 = row1.createCell((short)4);    		
    		HSSFCell cell6 = row1.createCell((short)5);
    		HSSFCell cell7 = row1.createCell((short)6);    		
    		HSSFCell cell8 = row1.createCell((short)7);
    		HSSFCell cell9 = row1.createCell((short)8);    		
    		HSSFCell cell10 = row1.createCell((short)9);
    		HSSFCell cell11 = row1.createCell((short)10);    		
    		HSSFCell cell12 = row1.createCell((short)11);    		
    		HSSFCell cell13 = row1.createCell((short)12);    		
    		HSSFCell cell14 = row1.createCell((short)13);    		
    		HSSFCell cell15 = row1.createCell((short)14);    		
    		HSSFCell cell16 = row1.createCell((short)15);    		
    		HSSFCell cell17 = row1.createCell((short)16);    		
    		HSSFCell cell18 = row1.createCell((short)17);    		
    		HSSFCell cell19 = row1.createCell((short)18);    		
    		HSSFCell cell20 = row1.createCell((short)19);    		
    		HSSFCell cell21 = row1.createCell((short)20);    		
    		HSSFCell cell22 = row1.createCell((short)21);    		
    		HSSFCell cell23 = row1.createCell((short)22);    		
    		HSSFCell cell24 = row1.createCell((short)23);    		
    		HSSFCell cell25 = row1.createCell((short)24);
    		HSSFCell cell26 = row1.createCell((short)25);    		
    		HSSFCell cell27 = row1.createCell((short)26);    		
    		HSSFCell cell28 = row1.createCell((short)27);    		
    		HSSFCell cell29 = row1.createCell((short)28);    		
    		HSSFCell cell30 = row1.createCell((short)29);    		
    		HSSFCell cell31 = row1.createCell((short)30);    		
    		HSSFCell cell32 = row1.createCell((short)31);    		
    		HSSFCell cell33 = row1.createCell((short)32);    		
    		HSSFCell cell34 = row1.createCell((short)33);    	    		
    		HSSFCell cell35 = row1.createCell((short)34);    		
    		HSSFCell cell36 = row1.createCell((short)35);    		
    		HSSFCell cell37 = row1.createCell((short)36);    		
    		HSSFCell cell38 = row1.createCell((short)37);    		
    		HSSFCell cell39 = row1.createCell((short)38);    		
    		HSSFCell cell40 = row1.createCell((short)39);    		
    		HSSFCell cell41 = row1.createCell((short)40);    
    		HSSFCell cell42 = row1.createCell((short)41); 
    		HSSFCell cell43 = row1.createCell((short)42); 
    		HSSFCell cell44 = row1.createCell((short)43); 
    		HSSFCell cell45 = row1.createCell((short)44); 
    		HSSFCell cell46 = row1.createCell((short)45); 
    		HSSFCell cell47 = row1.createCell((short)46); 	
    		HSSFCell cell48 = row1.createCell((short)47); 	
    		//定义单元格为字符串类型
    		//cell.setEncoding(HSSFCell.ENCODING_UTF_16);	    		
    		//在单元格输入内容
    		cell1.setCellValue("姓名");    		
    		cell2.setCellValue("报名号");    		
    		cell3.setCellValue("高考报名号");    			
    		cell4.setCellValue("性别");    		
    		cell5.setCellValue("民族");    		
    		cell6.setCellValue("政治面貌");    		
    		cell7.setCellValue("出生日期");    		
    		cell8.setCellValue("身份证号");    		
    		cell9.setCellValue("运动项目");    		
    		cell10.setCellValue("运动等级");    		
    		cell11.setCellValue("获得时间");    		
    		cell12.setCellValue("省份");    		
    		cell13.setCellValue("所在中学");    		
    		cell14.setCellValue("科类");    		
    		cell15.setCellValue("中学联系人");    		
    		cell16.setCellValue("部门");    		
    		cell17.setCellValue("联系电话");    		
    		cell18.setCellValue("中学通信地址");    		
    		cell19.setCellValue("中学邮编");    		
    		cell20.setCellValue("家庭通信地址");    		
    		cell21.setCellValue("家庭邮编");    		
    		cell22.setCellValue("家庭电话");    		
    		cell23.setCellValue("本人联系电话");    		
    		cell24.setCellValue("与本人关系");    		
    		cell25.setCellValue("姓名");    		
    		cell26.setCellValue("工作单位及职务");    		
    		cell27.setCellValue("最高学历");    		
    		cell28.setCellValue("联系电话");    		
    		cell29.setCellValue("与本人关系");    		
    		cell30.setCellValue("姓名");    		
    		cell31.setCellValue("工作单位及职务");    		
    		cell32.setCellValue("最高学历");    		
    		cell33.setCellValue("联系电话");    		
    		cell34.setCellValue("高中开始时间");    		
    		cell35.setCellValue("高中结束时间");    		
    		cell36.setCellValue("高中证明人");    		
    		cell37.setCellValue("初中开始时间");    		
    		cell38.setCellValue("初中结束时间");    		
    		cell39.setCellValue("初中证明人");    		
    		cell40.setCellValue("个人特长");    		
    		cell41.setCellValue("获奖情况");  
    		cell42.setCellValue("当前状态");  
    		cell43.setCellValue("英语成绩");  
    		cell44.setCellValue("语文成绩");  
    		cell45.setCellValue("数学成绩");  
    		cell46.setCellValue("文化课总分");  
    		cell47.setCellValue("专项成绩");   
    		cell48.setCellValue("结论"); 
    		List<Map> list = (List)request.getAttribute("athleteExcel");
    		Iterator it1 = list.iterator();
    		int rowno=2;    		
    		for(int i= 0 ; i <list.size() ; i++ )
            {
                Map map = list.get(i);
                HSSFRow row = sheet.createRow((short)rowno);
                //姓名
                HSSFCell cell00 = row.createCell((short)0);
                String Name=(String)map.get("Name");
                cell00.setCellValue(Name);
                //报名号
                HSSFCell cell01 = row.createCell((short)1);
                String Number=(String)map.get("Number");
                cell01.setCellValue(Number);
                //高考报名号
                HSSFCell cell02 = row.createCell((short)2);
                String EntranceNo=(String)map.get("EntranceNo");
                cell02.setCellValue(EntranceNo);
                //性别
                HSSFCell cell03 = row.createCell((short)3);
                String Sex=(String)map.get("Sex");
                cell03.setCellValue(Sex);
                //民族
                HSSFCell cell04 = row.createCell((short)4);
                String Nation=(String)map.get("Nation");
                cell04.setCellValue(Nation);
                //政治面貌
                HSSFCell cell05 = row.createCell((short)5);
                String Politic=(String)map.get("Politic");
                cell05.setCellValue(Politic);
                //出生日期
                HSSFCell cell06 = row.createCell((short)6);
                String Birthday=(String)map.get("Birthday");
                cell06.setCellValue(Birthday);
                //身份证号
                HSSFCell cell07 = row.createCell((short)7);
                String IDcard=(String)map.get("IDcard");
                cell07.setCellValue(IDcard);
                //运动项目
                HSSFCell cell08 = row.createCell((short)8);   
                String Project=(String)map.get("Project");             
                cell08.setCellValue(Project);
                //运动等级
                HSSFCell cell09 = row.createCell((short)9);
                String Level=(String)map.get("Level");
                cell09.setCellValue(Level);
                //获得时间
                HSSFCell cell010 = row.createCell((short)10);
                String GetTime=(String)map.get("GetTime");
                cell010.setCellValue(GetTime);
                //省份
                HSSFCell cell011 = row.createCell((short)11);      
                String Province=(String)map.get("Province");          
                cell011.setCellValue(Province);
                //所在中学
                HSSFCell cell012 = row.createCell((short)12);
                String HighSchool=(String)map.get("HighSchool");
                cell012.setCellValue(HighSchool);
                //科类
                HSSFCell cell013 = row.createCell((short)13);     
                String Subject=(String)map.get("Subject");          
                cell013.setCellValue(Subject);
                //中学联系人
                HSSFCell cell014 = row.createCell((short)14);
                String HighLink=(String)map.get("HighLink");
                cell014.setCellValue(HighLink);
                //部门
                HSSFCell cell015 = row.createCell((short)15);
                String HighDepartment=(String)map.get("HighDepartment");
                cell015.setCellValue(HighDepartment);
                //联系电话
                HSSFCell cell016 = row.createCell((short)16);
                String HighLinkTel=(String)map.get("HighTel");
                cell016.setCellValue(HighLinkTel);
                //中学通信地址
                HSSFCell cell017 = row.createCell((short)17);
                String HighAddress=(String)map.get("HighAddress");
                cell017.setCellValue(HighAddress);
                //中学邮编
                HSSFCell cell018 = row.createCell((short)18);
                String HighPost=(String)map.get("HighPost");
                cell018.setCellValue(HighPost);
                //家庭通信地址
                HSSFCell cell019 = row.createCell((short)19);
                String Address=(String)map.get("HomeAddress");
                cell019.setCellValue(Address);
                //家庭邮编
                HSSFCell cell020 = row.createCell((short)20);
                String Post=(String)map.get("Post");
                cell020.setCellValue(Post);
                //家庭电话
                HSSFCell cell021 = row.createCell((short)21);
                String Tel=(String)map.get("Tel");
                cell021.setCellValue(Tel);
                //本人联系电话
                HSSFCell cell022 = row.createCell((short)22);
                String Mobile=(String)map.get("Mobile");
                cell022.setCellValue(Mobile);
                //与本人关系
                HSSFCell cell023 = row.createCell((short)23);
                String FirstRelation=(String)map.get("FirstRelation");
                cell023.setCellValue(FirstRelation);
                //姓名
                HSSFCell cell024 = row.createCell((short)24);
                String FirstName=(String)map.get("FirstName");
                cell024.setCellValue(FirstName);
                //工作单位及职务
                HSSFCell cell025 = row.createCell((short)25);
                String FirstUnit=(String)map.get("FirstUnit");
                cell025.setCellValue(FirstUnit);
                //最高学历
                HSSFCell cell026 = row.createCell((short)26);
                String FirstEdu=(String)map.get("FirstEdu");
                cell026.setCellValue(FirstEdu);
                //联系电话
                HSSFCell cell027 = row.createCell((short)27);
                String FirstTel=(String)map.get("FirstTel");
                cell027.setCellValue(FirstTel);
                //与本人关系
                HSSFCell cell028 = row.createCell((short)28);
                String SecondRelation=(String)map.get("SecondRelation");
                cell028.setCellValue(SecondRelation);
                //姓名
                HSSFCell cell029 = row.createCell((short)29);
                String SecondName=(String)map.get("SecondName");
                cell029.setCellValue(SecondName);
                //工作单位及职务
                HSSFCell cell030 = row.createCell((short)30);
                String SecondUnit=(String)map.get("SecondUnit");
                cell030.setCellValue(SecondUnit);
                //最高学历
                HSSFCell cell031 = row.createCell((short)31);
                String SecondEdu=(String)map.get("SecondEdu");
                cell031.setCellValue(SecondEdu);
                //联系电话
                HSSFCell cell032 = row.createCell((short)32);
                String SecondTel=(String)map.get("SecondTel");
                cell032.setCellValue(SecondTel);
                //高中开始时间
                HSSFCell cell033 = row.createCell((short)33);
                String HighBegin=(String)map.get("HighBegin");
                cell033.setCellValue(HighBegin);
                //高中结束时间
                HSSFCell cell034 = row.createCell((short)34);
                String HighEnd=(String)map.get("HighEnd");
                cell034.setCellValue(HighEnd);
                //高中证明人
                HSSFCell cell035 = row.createCell((short)35);
                cell035.setCellValue(HighLink);
                //初中开始时间
                HSSFCell cell036 = row.createCell((short)36);
                String MidBegin=(String)map.get("MidBegin");
                cell036.setCellValue(MidBegin);
                //初中结束时间
                HSSFCell cell037 = row.createCell((short)37);
                String MidEnd=(String)map.get("MidEnd");
                cell037.setCellValue(MidEnd);
                //初中证明人
                HSSFCell cell038 = row.createCell((short)38);
                String MidLink=(String)map.get("MidLink");
                cell038.setCellValue(MidLink);
                //特长
                HSSFCell cell039 = row.createCell((short)39);
                String Strength=(String)map.get("Strength");
                cell039.setCellValue(Strength);
                //奖励
                HSSFCell cell040 = row.createCell((short)40);
                String Awards=(String)map.get("Awards");
                cell040.setCellValue(Awards);
                //当前状态
                HSSFCell cell041 = row.createCell((short)41);
                String Status=(String)map.get("Status");
                cell041.setCellValue(Status);
                //英语成绩
                HSSFCell cell042 = row.createCell((short)42);
                String English=(String)map.get("English");
                cell042.setCellValue(English);
                 //语文成绩
                HSSFCell cell043 = row.createCell((short)43);
                String Chinese=(String)map.get("Chinese");
                cell043.setCellValue(Chinese);
                 //数学成绩
                HSSFCell cell044 = row.createCell((short)44);
                String Math=(String)map.get("Math");
                cell044.setCellValue(Math);
                //文化课总分
                HSSFCell cell045= row.createCell((short)45);
                String Score=(String)map.get("Score");
                cell045.setCellValue(Score);
                //专项成绩
                HSSFCell cell046= row.createCell((short)46);
                String SpecialtyGrade=(String)map.get("SpecialtyGrade");
                cell045.setCellValue(SpecialtyGrade);
                //结论
                HSSFCell cell047= row.createCell((short)47);
                String Conclusion=(String)map.get("Conclusion");
                cell045.setCellValue(Conclusion);
                rowno++;
            }
    		//新建一输出流
    		FileOutputStream fOut = new FileOutputStream(sFilename);
    		//把响应的Excel工作薄存盘
    		wordbook.write(fOut);
    		fOut.flush();
    		start=sFilename.indexOf("excel")+6;
    		//System.out.println(sFilename);
    		//System.out.println(start);
    		//操作结束关闭文件
    		out.print("生成完毕 ");	
    		out.println("<a href='excel/"+sFilename.substring(start)+"' target='_blank'>点击下载高水平运动员电子表</a>");	
    	}
    	catch(Exception ex)
    	{
    		out.println(ex);
    	}
     %>
  </body>
</html>