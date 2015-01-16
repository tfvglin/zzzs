package admin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import admin.Service;

import jxl.Workbook;
import jxl.read.biff.BiffException;

public class Data {
	public void getData() {

		List liststu = new ArrayList();
		// 找到导入的文件(此处为服务器上项目路径下的WEB-INF/classes路径下)
		InputStream is = Data.class.getClassLoader().getResourceAsStream("athlete.xls");
		try {
			// 创建工作簿
			Workbook wb = Workbook.getWorkbook(is);
			// 创建工作表
			jxl.Sheet sheet = wb.getSheet(0);
			String content = null;

			for (int i = 1; i < sheet.getRows(); i++) {
				Student stu = new Student();
				for (int j = 0; j < sheet.getColumns(); j++) {
					content = sheet.getCell(j, i).getContents();
					if (stu.getName() == null) {
						stu.setName(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getNumber() == null) {
						stu.setNumber(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getEntranceNo() == null) {
						stu.setEntranceNo(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSex() == null) {
						stu.setSex(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getNation() == null) {
						stu.setNation(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getPolitic() == null) {
						stu.setPolitic(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getBirthday() == null) {
						stu.setBirthday(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getIDcard() == null) {
						stu.setIDcard(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstSpecialty() == null) {
						stu.setFirstSpecialty(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondSpecialty() == null) {
						stu.setSecondSpecialty(sheet.getCell(j, i)
								.getContents());
						continue;
					}
					if (stu.getThirdSpecialty() == null) {
						stu.setThirdSpecialty(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getProvince() == null) {
						stu.setProvince(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighSchool() == null) {
						stu.setHighSchool(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSubject() == null) {
						stu.setSubject(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighLink() == null) {
						stu.setHighLink(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighDepartment() == null) {
						stu.setHighDepartment(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighLinkTel() == null) {
						stu.setHighLinkTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighAddress() == null) {
						stu.setHighAddress(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighPost() == null) {
						stu.setHighPost(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHomeAddress() == null) {
						stu.setHomeAddress(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHomePost() == null) {
						stu.setHomePost(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHomeTel() == null) {
						stu.setHomeTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getMobile() == null) {
						stu.setMobile(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstRelation() == null) {
						stu.setFirstRelation(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstName() == null) {
						stu.setFirstName(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstUnit() == null) {
						stu.setFirstUnit(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstEdu() == null) {
						stu.setFirstEdu(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstTel() == null) {
						stu.setFirstTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondRelation() == null) {
						stu.setSecondRelation(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondName() == null) {
						stu.setSecondName(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondUnit() == null) {
						stu.setSecondUnit(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondEdu() == null) {
						stu.setSecondEdu(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondTel() == null) {
						stu.setSecondTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondTel() == null) {
						stu.setSecondTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighBegin() == null) {
						stu.setHighBegin(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighEnd() == null) {
						stu.setHighEnd(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getMidBegin() == null) {
						stu.setMidBegin(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getMidEnd() == null) {
						stu.setMidEnd(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getMidLink() == null) {
						stu.setMidLink(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getContest() == null) {
						stu.setContest(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getAwards() == null) {
						stu.setAwards(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getPlan() == null) {
						stu.setPlan(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getReceive() == null) {
						stu.setReceive(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getStatus() == null) {
						stu.setStatus(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getEnglish() == null) {
						stu.setEnglish(sheet.getCell(j, i).getContents());
						continue;
					}
				}
				getStudentInfo(stu);

			}

		} catch (BiffException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void getStudentInfo(Student stu) {
		admin.Service as = new admin.Service();
		/*as.trial(stu.getName(), stu.getNumber(), stu.getEntranceNo(),
				stu.getSex(), stu.getNation(), stu.getPolitic(),
				stu.getBirthday(), stu.getIDcard(), stu.getFirstSpecialty(), stu.getSecondSpecialty(), stu.getThirdSpecialty(),
				stu.getProvince(), stu.getHighSchool(), stu.getSubject(),
				stu.getHighLink(), stu.getHighDepartment(), stu.getHighLinkTel(), stu.getHighAddress(), stu.getHighPost(),
				stu.getHomeAddress(), stu.getHomePost(), stu.getHomeTel(),
				stu.getMobile(), stu.getFirstRelation(), stu.getFirstName(), stu.getFirstUnit(), stu.getFirstEdu(),
				stu.getFirstTel(), stu.getSecondRelation(), stu.getSecondName(),
				stu.getSecondUnit(), stu.getSecondEdu(), stu.getSecondTel(), stu.getHighBegin(), stu.getHighEnd(), stu.getMidBegin(), stu.getMidEnd(),
				stu.getMidLink(), stu.getContest(), stu.getAwards(),
				stu.getPlan(), stu.getReceive(), stu.getStatus());*/
	}
	public void getRecommend() {

		List liststu = new ArrayList();
		// 找到导入的文件
		InputStream is = Data.class.getClassLoader().getResourceAsStream(
				"recommend.xls");
		try {
			// 创建工作簿
			Workbook wb = Workbook.getWorkbook(is);
			// 创建工作表
			jxl.Sheet sheet = wb.getSheet(0);
			String content = null;

			for (int i = 1; i < sheet.getRows(); i++) {
				Student stu = new Student();
				for (int j = 0; j < sheet.getColumns(); j++) {
					content = sheet.getCell(j, i).getContents();
					if (stu.getName() == null) {
						stu.setName(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getNumber() == null) {
						stu.setNumber(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getEntranceNo() == null) {
						stu.setEntranceNo(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSex() == null) {
						stu.setSex(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getNation() == null) {
						stu.setNation(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getPolitic() == null) {
						stu.setPolitic(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getBirthday() == null) {
						stu.setBirthday(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getIDcard() == null) {
						stu.setIDcard(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstSpecialty() == null) {
						stu.setFirstSpecialty(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondSpecialty() == null) {
						stu.setSecondSpecialty(sheet.getCell(j, i)
								.getContents());
						continue;
					}
					if (stu.getThirdSpecialty() == null) {
						stu.setThirdSpecialty(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getProvince() == null) {
						stu.setProvince(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighSchool() == null) {
						stu.setHighSchool(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSubject() == null) {
						stu.setSubject(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighLink() == null) {
						stu.setHighLink(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighDepartment() == null) {
						stu.setHighDepartment(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighLinkTel() == null) {
						stu.setHighLinkTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighAddress() == null) {
						stu.setHighAddress(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighPost() == null) {
						stu.setHighPost(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHomeAddress() == null) {
						stu.setHomeAddress(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHomePost() == null) {
						stu.setHomePost(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHomeTel() == null) {
						stu.setHomeTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getMobile() == null) {
						stu.setMobile(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstRelation() == null) {
						stu.setFirstRelation(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstName() == null) {
						stu.setFirstName(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstUnit() == null) {
						stu.setFirstUnit(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstEdu() == null) {
						stu.setFirstEdu(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getFirstTel() == null) {
						stu.setFirstTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondRelation() == null) {
						stu.setSecondRelation(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondName() == null) {
						stu.setSecondName(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondUnit() == null) {
						stu.setSecondUnit(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondEdu() == null) {
						stu.setSecondEdu(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondTel() == null) {
						stu.setSecondTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getSecondTel() == null) {
						stu.setSecondTel(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighBegin() == null) {
						stu.setHighBegin(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getHighEnd() == null) {
						stu.setHighEnd(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getMidBegin() == null) {
						stu.setMidBegin(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getMidEnd() == null) {
						stu.setMidEnd(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getMidLink() == null) {
						stu.setMidLink(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getContest() == null) {
						stu.setContest(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getAwards() == null) {
						stu.setAwards(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getReceive() == null) {
						stu.setReceive(sheet.getCell(j, i).getContents());
						continue;
					}
					if (stu.getStatus() == null) {
						stu.setStatus(sheet.getCell(j, i).getContents());
						continue;
					}
				}
				getRecommendInfo(stu);

			}

		} catch (BiffException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void getRecommendInfo(Student stu) {
		admin.Service as = new admin.Service();
		as.recommendtrial(stu.getName(), stu.getNumber(), stu.getEntranceNo(),
				stu.getSex(), stu.getNation(), stu.getPolitic(),
				stu.getBirthday(), stu.getIDcard(), stu.getFirstSpecialty(), stu.getSecondSpecialty(), stu.getThirdSpecialty(),
				stu.getProvince(), stu.getHighSchool(), stu.getSubject(),
				stu.getHighLink(), stu.getHighDepartment(), stu.getHighLinkTel(), stu.getHighAddress(), stu.getHighPost(),
				stu.getHomeAddress(), stu.getHomePost(), stu.getHomeTel(),
				stu.getMobile(), stu.getFirstRelation(), stu.getFirstName(), stu.getFirstUnit(), stu.getFirstEdu(),
				stu.getFirstTel(), stu.getSecondRelation(), stu.getSecondName(),
				stu.getSecondUnit(), stu.getSecondEdu(), stu.getSecondTel(), stu.getHighBegin(), stu.getHighEnd(), stu.getMidBegin(), stu.getMidEnd(),
				stu.getMidLink(), stu.getContest(), stu.getAwards(),
				stu.getReceive(), stu.getStatus());
	}
}