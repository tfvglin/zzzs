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
<h2>���ɸ�ˮƽ�˶�Աͳ�Ʊ�������</h2>
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
    	//Excel������������λ��
    	String sFilename = getServletConfig().getServletContext().getRealPath("//excel//"+dt+"athlete.xls");
    	String excelpath="";
    	int start=0;
    	try
    	{
    		//�����µĹ�����
    		HSSFWorkbook wordbook = new HSSFWorkbook();
    		//��Excel�������д���һ����ΪFIRST�Ĺ�����
    		HSSFSheet sheet = wordbook.createSheet("��ˮƽ�˶�Աͳ�Ʊ�");
    		HSSFRow row0 = sheet.createRow((short)0);    		
    		HSSFCell cell0 = row0.createCell((short)0);    		
    		cell0.setCellValue("��ˮƽ�˶�Աͳ�Ʊ�");    		
    		HSSFRow row1 = sheet.createRow((short)1);    		
    		//������0��λ�ô�����Ԫ��,��Ӧ�ŵ�һ�е�һ�еĵ�Ԫ��
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
    		//���嵥Ԫ��Ϊ�ַ�������
    		//cell.setEncoding(HSSFCell.ENCODING_UTF_16);	    		
    		//�ڵ�Ԫ����������
    		cell1.setCellValue("����");    		
    		cell2.setCellValue("������");    		
    		cell3.setCellValue("�߿�������");    			
    		cell4.setCellValue("�Ա�");    		
    		cell5.setCellValue("����");    		
    		cell6.setCellValue("������ò");    		
    		cell7.setCellValue("��������");    		
    		cell8.setCellValue("���֤��");    		
    		cell9.setCellValue("�˶���Ŀ");    		
    		cell10.setCellValue("�˶��ȼ�");    		
    		cell11.setCellValue("���ʱ��");    		
    		cell12.setCellValue("ʡ��");    		
    		cell13.setCellValue("������ѧ");    		
    		cell14.setCellValue("����");    		
    		cell15.setCellValue("��ѧ��ϵ��");    		
    		cell16.setCellValue("����");    		
    		cell17.setCellValue("��ϵ�绰");    		
    		cell18.setCellValue("��ѧͨ�ŵ�ַ");    		
    		cell19.setCellValue("��ѧ�ʱ�");    		
    		cell20.setCellValue("��ͥͨ�ŵ�ַ");    		
    		cell21.setCellValue("��ͥ�ʱ�");    		
    		cell22.setCellValue("��ͥ�绰");    		
    		cell23.setCellValue("������ϵ�绰");    		
    		cell24.setCellValue("�뱾�˹�ϵ");    		
    		cell25.setCellValue("����");    		
    		cell26.setCellValue("������λ��ְ��");    		
    		cell27.setCellValue("���ѧ��");    		
    		cell28.setCellValue("��ϵ�绰");    		
    		cell29.setCellValue("�뱾�˹�ϵ");    		
    		cell30.setCellValue("����");    		
    		cell31.setCellValue("������λ��ְ��");    		
    		cell32.setCellValue("���ѧ��");    		
    		cell33.setCellValue("��ϵ�绰");    		
    		cell34.setCellValue("���п�ʼʱ��");    		
    		cell35.setCellValue("���н���ʱ��");    		
    		cell36.setCellValue("����֤����");    		
    		cell37.setCellValue("���п�ʼʱ��");    		
    		cell38.setCellValue("���н���ʱ��");    		
    		cell39.setCellValue("����֤����");    		
    		cell40.setCellValue("�����س�");    		
    		cell41.setCellValue("�����");  
    		cell42.setCellValue("��ǰ״̬");  
    		cell43.setCellValue("Ӣ��ɼ�");  
    		cell44.setCellValue("���ĳɼ�");  
    		cell45.setCellValue("��ѧ�ɼ�");  
    		cell46.setCellValue("�Ļ����ܷ�");  
    		cell47.setCellValue("ר��ɼ�");   
    		cell48.setCellValue("����"); 
    		List<Map> list = (List)request.getAttribute("athleteExcel");
    		Iterator it1 = list.iterator();
    		int rowno=2;    		
    		for(int i= 0 ; i <list.size() ; i++ )
            {
                Map map = list.get(i);
                HSSFRow row = sheet.createRow((short)rowno);
                //����
                HSSFCell cell00 = row.createCell((short)0);
                String Name=(String)map.get("Name");
                cell00.setCellValue(Name);
                //������
                HSSFCell cell01 = row.createCell((short)1);
                String Number=(String)map.get("Number");
                cell01.setCellValue(Number);
                //�߿�������
                HSSFCell cell02 = row.createCell((short)2);
                String EntranceNo=(String)map.get("EntranceNo");
                cell02.setCellValue(EntranceNo);
                //�Ա�
                HSSFCell cell03 = row.createCell((short)3);
                String Sex=(String)map.get("Sex");
                cell03.setCellValue(Sex);
                //����
                HSSFCell cell04 = row.createCell((short)4);
                String Nation=(String)map.get("Nation");
                cell04.setCellValue(Nation);
                //������ò
                HSSFCell cell05 = row.createCell((short)5);
                String Politic=(String)map.get("Politic");
                cell05.setCellValue(Politic);
                //��������
                HSSFCell cell06 = row.createCell((short)6);
                String Birthday=(String)map.get("Birthday");
                cell06.setCellValue(Birthday);
                //���֤��
                HSSFCell cell07 = row.createCell((short)7);
                String IDcard=(String)map.get("IDcard");
                cell07.setCellValue(IDcard);
                //�˶���Ŀ
                HSSFCell cell08 = row.createCell((short)8);   
                String Project=(String)map.get("Project");             
                cell08.setCellValue(Project);
                //�˶��ȼ�
                HSSFCell cell09 = row.createCell((short)9);
                String Level=(String)map.get("Level");
                cell09.setCellValue(Level);
                //���ʱ��
                HSSFCell cell010 = row.createCell((short)10);
                String GetTime=(String)map.get("GetTime");
                cell010.setCellValue(GetTime);
                //ʡ��
                HSSFCell cell011 = row.createCell((short)11);      
                String Province=(String)map.get("Province");          
                cell011.setCellValue(Province);
                //������ѧ
                HSSFCell cell012 = row.createCell((short)12);
                String HighSchool=(String)map.get("HighSchool");
                cell012.setCellValue(HighSchool);
                //����
                HSSFCell cell013 = row.createCell((short)13);     
                String Subject=(String)map.get("Subject");          
                cell013.setCellValue(Subject);
                //��ѧ��ϵ��
                HSSFCell cell014 = row.createCell((short)14);
                String HighLink=(String)map.get("HighLink");
                cell014.setCellValue(HighLink);
                //����
                HSSFCell cell015 = row.createCell((short)15);
                String HighDepartment=(String)map.get("HighDepartment");
                cell015.setCellValue(HighDepartment);
                //��ϵ�绰
                HSSFCell cell016 = row.createCell((short)16);
                String HighLinkTel=(String)map.get("HighTel");
                cell016.setCellValue(HighLinkTel);
                //��ѧͨ�ŵ�ַ
                HSSFCell cell017 = row.createCell((short)17);
                String HighAddress=(String)map.get("HighAddress");
                cell017.setCellValue(HighAddress);
                //��ѧ�ʱ�
                HSSFCell cell018 = row.createCell((short)18);
                String HighPost=(String)map.get("HighPost");
                cell018.setCellValue(HighPost);
                //��ͥͨ�ŵ�ַ
                HSSFCell cell019 = row.createCell((short)19);
                String Address=(String)map.get("HomeAddress");
                cell019.setCellValue(Address);
                //��ͥ�ʱ�
                HSSFCell cell020 = row.createCell((short)20);
                String Post=(String)map.get("Post");
                cell020.setCellValue(Post);
                //��ͥ�绰
                HSSFCell cell021 = row.createCell((short)21);
                String Tel=(String)map.get("Tel");
                cell021.setCellValue(Tel);
                //������ϵ�绰
                HSSFCell cell022 = row.createCell((short)22);
                String Mobile=(String)map.get("Mobile");
                cell022.setCellValue(Mobile);
                //�뱾�˹�ϵ
                HSSFCell cell023 = row.createCell((short)23);
                String FirstRelation=(String)map.get("FirstRelation");
                cell023.setCellValue(FirstRelation);
                //����
                HSSFCell cell024 = row.createCell((short)24);
                String FirstName=(String)map.get("FirstName");
                cell024.setCellValue(FirstName);
                //������λ��ְ��
                HSSFCell cell025 = row.createCell((short)25);
                String FirstUnit=(String)map.get("FirstUnit");
                cell025.setCellValue(FirstUnit);
                //���ѧ��
                HSSFCell cell026 = row.createCell((short)26);
                String FirstEdu=(String)map.get("FirstEdu");
                cell026.setCellValue(FirstEdu);
                //��ϵ�绰
                HSSFCell cell027 = row.createCell((short)27);
                String FirstTel=(String)map.get("FirstTel");
                cell027.setCellValue(FirstTel);
                //�뱾�˹�ϵ
                HSSFCell cell028 = row.createCell((short)28);
                String SecondRelation=(String)map.get("SecondRelation");
                cell028.setCellValue(SecondRelation);
                //����
                HSSFCell cell029 = row.createCell((short)29);
                String SecondName=(String)map.get("SecondName");
                cell029.setCellValue(SecondName);
                //������λ��ְ��
                HSSFCell cell030 = row.createCell((short)30);
                String SecondUnit=(String)map.get("SecondUnit");
                cell030.setCellValue(SecondUnit);
                //���ѧ��
                HSSFCell cell031 = row.createCell((short)31);
                String SecondEdu=(String)map.get("SecondEdu");
                cell031.setCellValue(SecondEdu);
                //��ϵ�绰
                HSSFCell cell032 = row.createCell((short)32);
                String SecondTel=(String)map.get("SecondTel");
                cell032.setCellValue(SecondTel);
                //���п�ʼʱ��
                HSSFCell cell033 = row.createCell((short)33);
                String HighBegin=(String)map.get("HighBegin");
                cell033.setCellValue(HighBegin);
                //���н���ʱ��
                HSSFCell cell034 = row.createCell((short)34);
                String HighEnd=(String)map.get("HighEnd");
                cell034.setCellValue(HighEnd);
                //����֤����
                HSSFCell cell035 = row.createCell((short)35);
                cell035.setCellValue(HighLink);
                //���п�ʼʱ��
                HSSFCell cell036 = row.createCell((short)36);
                String MidBegin=(String)map.get("MidBegin");
                cell036.setCellValue(MidBegin);
                //���н���ʱ��
                HSSFCell cell037 = row.createCell((short)37);
                String MidEnd=(String)map.get("MidEnd");
                cell037.setCellValue(MidEnd);
                //����֤����
                HSSFCell cell038 = row.createCell((short)38);
                String MidLink=(String)map.get("MidLink");
                cell038.setCellValue(MidLink);
                //�س�
                HSSFCell cell039 = row.createCell((short)39);
                String Strength=(String)map.get("Strength");
                cell039.setCellValue(Strength);
                //����
                HSSFCell cell040 = row.createCell((short)40);
                String Awards=(String)map.get("Awards");
                cell040.setCellValue(Awards);
                //��ǰ״̬
                HSSFCell cell041 = row.createCell((short)41);
                String Status=(String)map.get("Status");
                cell041.setCellValue(Status);
                //Ӣ��ɼ�
                HSSFCell cell042 = row.createCell((short)42);
                String English=(String)map.get("English");
                cell042.setCellValue(English);
                 //���ĳɼ�
                HSSFCell cell043 = row.createCell((short)43);
                String Chinese=(String)map.get("Chinese");
                cell043.setCellValue(Chinese);
                 //��ѧ�ɼ�
                HSSFCell cell044 = row.createCell((short)44);
                String Math=(String)map.get("Math");
                cell044.setCellValue(Math);
                //�Ļ����ܷ�
                HSSFCell cell045= row.createCell((short)45);
                String Score=(String)map.get("Score");
                cell045.setCellValue(Score);
                //ר��ɼ�
                HSSFCell cell046= row.createCell((short)46);
                String SpecialtyGrade=(String)map.get("SpecialtyGrade");
                cell045.setCellValue(SpecialtyGrade);
                //����
                HSSFCell cell047= row.createCell((short)47);
                String Conclusion=(String)map.get("Conclusion");
                cell045.setCellValue(Conclusion);
                rowno++;
            }
    		//�½�һ�����
    		FileOutputStream fOut = new FileOutputStream(sFilename);
    		//����Ӧ��Excel����������
    		wordbook.write(fOut);
    		fOut.flush();
    		start=sFilename.indexOf("excel")+6;
    		//System.out.println(sFilename);
    		//System.out.println(start);
    		//���������ر��ļ�
    		out.print("������� ");	
    		out.println("<a href='excel/"+sFilename.substring(start)+"' target='_blank'>������ظ�ˮƽ�˶�Ա���ӱ�</a>");	
    	}
    	catch(Exception ex)
    	{
    		out.println(ex);
    	}
     %>
  </body>
</html>