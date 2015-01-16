package admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Service extends common.BaseService {
	public int login(String username, String password) {
		String user_sql = "select Id from zsb_admin where Username='"+username+"' and Password='"+common.MD5Util.MD5(password)+"'";
		int no = -1;
		no = getInt(user_sql);
		if (no < 1)// 账号错误
		{
			String Email_SQL = "select Id from zsb_admin where Username='"+username+"'";
			no = getInt(Email_SQL);
			if (no < 1)// 邮箱错误
			{
				no = -1;
			}
			if (no >= 1)// 密码错误
			{
				no = -2;
			}
		}
		return no;
	}

	public int release(String Name, String Begin, String End,String Year) {
		String release_sql = "insert into zsb_signup(`Name`,`Begin`,`End`,`Year`) values('"+Name+"','"+Begin+"','"+End+"','"+Year+"')";
		// System.out.println(release_sql);
		int no = -1;
		no = update(release_sql);
		return no;
	}

	public int updatesignup(String Name, String Begin, String End,String Year,String SignupNo) {
		String update_sql = "update `zsb_signup` set `Name`='"+Name+"',`Begin`='"+Begin+"',`End`='"+End+"',`Year`='"+Year+"' where `Id`='"+SignupNo+"'";
		// System.out.println(release_sql);
		int no = -1;
		no = update(update_sql);
		return no;
	}

	public String getSignupName(String Id) {
		String name_sql = "select `Name` from `zsb_signup` where `Id`='"+Id+"'";
		String name = "";
		name = getString(name_sql);
		return name;
	}

	public String getSignupBegin(String Id) {
		String begin_sql = "select `Begin` from `zsb_signup` where `Id`='"+Id+"'";
		String begin = "";
		begin = getString(begin_sql);
		return begin;
	}

	public String getSignupEnd(String Id) {
		String end_sql = "select `End` from `zsb_signup` where `Id`='"+Id+"'";
		String end = "";
		end = getString(end_sql);
		return end;
	}
	public String getSignupYear(String Id) {
		String end_sql = "select `Year` from `zsb_signup` where `Id`='"+Id+"'";
		String end = "";
		end = getString(end_sql);
		return end;
	}
	public List getSignupList() {
		List l = new ArrayList();
		String sql = "select Id,Name,Begin,End,`Year` from zsb_signup";
		l = this.getList(sql);
		return l;
	}

	public List getAthleteSearch(String Email) {
		List l = new ArrayList();
		String sql = "select Name,zsb_student_athlete.Email,Project,Number,Province,IdCard,Subject,HighSchool,Status from zsb_student_athlete LEFT JOIN  zsb_student_reg ON zsb_student_athlete.Email=zsb_student_reg.Email where zsb_student_athlete.Status<>0 and zsb_student_athlete.Email=?";
		l = this.getList(sql, new Object[] { Email });
		return l;
	}

	public Map getAthleteList(String curPage) {
		String sql = "select `Name`,IDcard,Project,Number,Province,Subject,HighSchool,Status from zsb_athlete where (`Status`<>'尚未提交申请表' and `Status`<>'尚未提交高水平运动员申请表' ) order by Sequence";
		//System.out.println(sql);
		Map m = this.getPage(sql, new Object[] {}, curPage);
		return m;
	}

	public Map getRecommendList(String Status, String curPage) {
		String sql = "select Name,zsb_student_recommend.Email,FirstSpecialty,Number,Province,IdCard,Subject,HighSchool,Status from zsb_student_recommend LEFT JOIN  zsb_student_reg ON zsb_student_recommend.Email=zsb_student_reg.Email where Status<>0 order by Number";
		Map m = this.getPage(sql, new Object[] {}, curPage);
		return m;
	}
	public Map getRecommendTrialList(String curPage) {
		String sql = "select Name,FirstSpecialty,Number,Province,IdCard,Subject,HighSchool,Status,Room,Seat from zsb_recommend_trial order by Sequence";
		Map m = this.getPage(sql, new Object[] {}, curPage);
		return m;
	}
	public Map getSelfList(String Status, String curPage) {
		String sql = "select Name,zsb_student_self.Email,FirstSpecialty,Number,Province,IdCard,Subject,HighSchool,Status,Exemption from zsb_student_self LEFT JOIN  zsb_student_reg ON zsb_student_self.Email=zsb_student_reg.Email where Status<>0 order by Number";
		Map m = this.getPage(sql, new Object[] {}, curPage);
		return m;
	}
	public Map getSelfTrialList(String curPage) {
		String sql = "select Name,FirstSpecialty,Number,Province,IdCard,Subject,HighSchool,Receive,Status,Room,Seat from zsb_self_trial order by Sequence";
		Map m = this.getPage(sql, new Object[] {}, curPage);
		return m;
	}
	public int deleteAthlete(String IDcard) {
		String delete_sql = "delete from `zsb_athlete` where `IDcard`='"+IDcard+"'";
		int no = update(delete_sql);
		return no;
	}

	public int deleteRecommend(String Email) {
		// System.out.println(Name);
		String delete_sql = "delete from zsb_student_recommend where Email=?";
		// System.out.println(release_sql);
		int no = -1;
		no = update(delete_sql, new Object[] { Email });
		return no;
	}

	public int deleteSelf(String Email) {
		// System.out.println(Name);
		String delete_sql = "delete from zsb_student_self where Email=?";
		// System.out.println(release_sql);
		int no = -1;
		no = update(delete_sql, new Object[] { Email });
		return no;
	}

	public int deleteSignup(String SignupNo) {
		// System.out.println(Name);
		String delete_sql = "delete from `zsb_signup` where `Id`='"+SignupNo+"'";
		int no = -1;
		no = update(delete_sql);
		return no;
	}

	public int updateStatusUtil(String Table,String Status, String IDcard) {
		String update_sql = "update `"+Table+"` set `Status`='"+Status+"' where `IDcard`='"+IDcard+"'";
		int no = -1;
		no = update(update_sql);
		return no;
	}

	public int updateRecommendStatusUtil(String Status, String Email) {
		// System.out.println(Name);
		String update_sql = "update zsb_student_recommend set Status=? where Email=?";
		// System.out.println(release_sql);
		int no = -1;
		no = update(update_sql, new Object[] { Status, Email });
		return no;
	}

	public int updateSelfStatusUtil(String Status, String Email) {
		// System.out.println(Name);
		String update_sql = "update zsb_student_self set Status=? where Email=?";
		// System.out.println(release_sql);
		int no = -1;
		no = update(update_sql, new Object[] { Status, Email });
		return no;
	}

	public String getName(String Email) {
		String name_sql = "select Name from zsb_student_athlete where Email=?";
		// System.out.println(release_sql);
		String name = "";
		name = getString(name_sql, new Object[] { Email });
		return name;
	}

	public String getPassword(String Email) {
		String name_sql = "select Password from zsb_student_reg where Email=?";
		// System.out.println(release_sql);
		String name = "";
		name = getString(name_sql, new Object[] { Email });
		return name;
	}

	public int updatePasswordUtil(String Password, String Email) {
		// System.out.println(Name);
		String update_sql = "update zsb_student_reg set Password=? where Email=?";
		// System.out.println(release_sql);
		int no = -1;
		no = update(update_sql, new Object[] { Password, Email });
		return no;
	}

	public int Exemption(String Email) {
		// System.out.println(Name);
		String update_sql = "update zsb_student_self set Exemption=? where Email=?";
		// System.out.println(release_sql);
		int no = -1;
		no = update(update_sql, new Object[] { "免笔试", Email });
		return no;
	}

	public String searchAthleteUtil(String Name, String Registration,
			String IDcard) {
		String email = "";
		String email_sql = "";
		String Number = "";
		// 按姓名查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (Registration.equals("") || Registration.equals("报名号"))
				&& (IDcard.equals("") || IDcard.equals("身份证号"))) {
			email_sql = "select Email from zsb_student_athlete where Name=?";
			email = getString(email_sql, new Object[] { Name });
		}
		// 按报名号查询
		if ((Name.equals("") || Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (IDcard.equals("") || IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select Email from zsb_student_athlete where Number=?";
			email = getString(email_sql, new Object[] { Number });
		}
		// 按身份证号查询
		if ((Name.equals("") || Name.equals("姓名"))
				&& (Registration.equals("") || Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			email_sql = "select Email from zsb_student_reg where IDcard=?";
			email = getString(email_sql, new Object[] { IDcard });
		}
		// 按姓名和报名号查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (IDcard.equals("") || IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select Email from zsb_student_athlete where Name=? and Number=?";
			email = getString(email_sql, new Object[] { Name, Number });
		}
		// 按姓名和身份证号查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (Registration.equals("") || Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			email_sql = "select zsb_student_athlete.Email from zsb_student_athlete left join zsb_student_reg on zsb_student_athlete.Email=zsb_student_reg.Email where Name=? and IDcard=?";
			email = getString(email_sql, new Object[] { Name, IDcard });
		}
		// 按报名号和身份证号查询
		if ((Name.equals("") || Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select zsb_student_athlete.Email from zsb_student_athlete left join zsb_student_reg on zsb_student_athlete.Email=zsb_student_reg.Email where Number=? and IDcard=?";
			email = getString(email_sql, new Object[] { Number, IDcard });
		}
		// 按姓名、报名号和身份证号查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select zsb_student_athlete.Email from zsb_student_athlete left join zsb_student_reg on zsb_student_athlete.Email=zsb_student_reg.Email where Name=? and Number=? and IDcard=?";
			email = getString(email_sql, new Object[] { Name, Number, IDcard });
		}
		return email;
	}

	public String searchRecommendUtil(String Name, String Registration,
			String IDcard) {
		String email = "";
		String email_sql = "";
		String Number = "";
		// 按姓名查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (Registration.equals("") || Registration.equals("报名号"))
				&& (IDcard.equals("") || IDcard.equals("身份证号"))) {
			email_sql = "select Email from zsb_student_recommend where Name=?";
			email = getString(email_sql, new Object[] { Name });
		}
		// 按报名号查询
		if ((Name.equals("") || Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (IDcard.equals("") || IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select Email from zsb_student_recommend where Number=?";
			email = getString(email_sql, new Object[] { Number });
		}
		// 按身份证号查询
		if ((Name.equals("") || Name.equals("姓名"))
				&& (Registration.equals("") || Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			email_sql = "select Email from zsb_student_reg where IDcard=?";
			email = getString(email_sql, new Object[] { IDcard });
		}
		// 按姓名和报名号查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (IDcard.equals("") || IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select Email from zsb_student_recommend where Name=? and Number=?";
			email = getString(email_sql, new Object[] { Name, Number });
		}
		// 按姓名和身份证号查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (Registration.equals("") || Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			email_sql = "select zsb_student_recommend.Email from zsb_student_recommend left join zsb_student_reg on zsb_student_recommend.Email=zsb_student_reg.Email where Name=? and IDcard=?";
			email = getString(email_sql, new Object[] { Name, IDcard });
		}
		// 按报名号和身份证号查询
		if ((Name.equals("") || Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select zsb_student_recommend.Email from zsb_student_recommend left join zsb_student_reg on zsb_student_recommend.Email=zsb_student_reg.Email where Number=? and IDcard=?";
			email = getString(email_sql, new Object[] { Number, IDcard });
		}
		// 按姓名、报名号和身份证号查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select zsb_student_recommend.Email from zsb_student_recommend left join zsb_student_reg on zsb_student_recommend.Email=zsb_student_reg.Email where Name=? and Number=? and IDcard=?";
			email = getString(email_sql, new Object[] { Name, Number, IDcard });
		}
		return email;
	}

	public String searchSelfUtil(String Name, String Registration, String IDcard) {
		String email = "";
		String email_sql = "";
		String Number = "";
		// 按姓名查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (Registration.equals("") || Registration.equals("报名号"))
				&& (IDcard.equals("") || IDcard.equals("身份证号"))) {
			email_sql = "select Email from zsb_student_self where Name=? and Status<>0";
			email = getString(email_sql, new Object[] { Name });
		}
		// 按报名号查询
		if ((Name.equals("") || Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (IDcard.equals("") || IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select Email from zsb_student_self where Number=? and Status<>0";
			email = getString(email_sql, new Object[] { Number });
		}
		// 按身份证号查询
		if ((Name.equals("") || Name.equals("姓名"))
				&& (Registration.equals("") || Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			email_sql = "select Email from zsb_student_reg where IDcard=?";
			email = getString(email_sql, new Object[] { IDcard });
		}
		// 按姓名和报名号查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (IDcard.equals("") || IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select Email from zsb_student_self where Name=?,Number=? and Status<>0";
			email = getString(email_sql, new Object[] { Name, Number });
		}
		// 按姓名和身份证号查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (Registration.equals("") || Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			email_sql = "select zsb_student_self.Email from zsb_student_self left join zsb_student_reg on zsb_student_self.Email=zsb_student_reg.Email where Name=?,IDcard=? and zsb_student_self.Status<>0";
			email = getString(email_sql, new Object[] { Name, IDcard });
		}
		// 按报名号和身份证号查询
		if ((Name.equals("") || Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select zsb_student_self.Email from zsb_student_self left join zsb_student_reg on zsb_student_self.Email=zsb_student_reg.Email where Number=?,IDcard=? and zsb_student_self.Status<>0";
			email = getString(email_sql, new Object[] { Number, IDcard });
		}
		// 按姓名、报名号和身份证号查询
		if ((!Name.equals("") && !Name.equals("姓名"))
				&& (!Registration.equals("") && !Registration.equals("报名号"))
				&& (!IDcard.equals("") && !IDcard.equals("身份证号"))) {
			Number = Registration.substring(6);
			email_sql = "select zsb_student_self.Email from zsb_student_self left join zsb_student_reg on zsb_student_self.Email=zsb_student_reg.Email where Name=? and Number=?,IDcard=? and zsb_student_self.Status<>0";
			email = getString(email_sql, new Object[] { Name, Number, IDcard });
		}
		return email;
	}

	public List getAthleteExcel() {
		List athletelist = new ArrayList();
		String sql = "select `Name`,Number,`EntranceNo`,Sex,Nation,Politic,Birthday,IDcard,Project,Level,GetTime,Province,HighSchool,Subject,HighLink,HighDepartment,HighTel,HighAddress,HighPost,HomeAddress,HomePost,HomeTel,Mobile,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,HighBegin,HighEnd,MidSchool,MidBegin,MidEnd,MidLink,Strength,Awards,`Status`,`English`,`Chinese`,`Math`,`Score`,`Conclusion`,`SpecialtyGrade` from zsb_athlete where Status<>\"尚未提交高水平运动员申请表\"";
		athletelist = this.getList(sql);
		return athletelist;
	}

	public List getRecommendExcel() {
		List recommendlist = new ArrayList();
		String sql = "select Name,Number,EntranceNo,Language,Sex,Nation,Politic,Birthday,IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,Province,HighSchool,Subject,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HomeAddress,HomePost,HomeTel,Mobile,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,HighBegin,HighEnd,MidSchool,MidBegin,MidEnd,MidLink,Contest,Awards,Status from zsb_student_recommend left join zsb_student_reg on zsb_student_recommend.Email=zsb_student_reg.Email where zsb_student_recommend.Status<>0 order by zsb_student_recommend.Number";
		recommendlist = this.getList(sql);
		return recommendlist;
	}
	public List getRecommedTrialExcel() {
		List recommendlist = new ArrayList();
		String sql = "select Name,Sequence,Number,EntranceNo,Sex,Nation,Politic,Birthday,IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,Province,HighSchool,Subject,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HomeAddress,HomePost,HomeTel,Mobile,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,HighBegin,HighEnd,MidBegin,MidEnd,MidLink,Contest,Awards,Receive,Status,Room,Seat,InterviewBegin from zsb_recommend_trial order by Sequence";
		recommendlist = this.getList(sql);
		//System.out.println(recommendlist);
		return recommendlist;
	}
	public List getSelfExcel() {
		List selflist = new ArrayList();
		String sql = "select Name,Number,EntranceNo,Language,Sex,Nation,Politic,Birthday,IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,Province,HighSchool,Subject,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HomeAddress,HomePost,HomeTel,Mobile,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,HighBegin,HighEnd,MidSchool,MidBegin,MidEnd,MidLink,Contest,Awards,Plan,Status from zsb_student_self left join zsb_student_reg on zsb_student_self.Email=zsb_student_reg.Email where zsb_student_self.Status<>0 order by zsb_student_self.Number";
		selflist = this.getList(sql);
		return selflist;
	}
	public List getSelfTrialExcel() {
		List selflist = new ArrayList();
		String sql = "select Name,Sequence,Number,EntranceNo,Sex,Nation,Politic,Birthday,IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,FourthSpecialty,FifthSpecialty,SixthSpecialty,Province,HighSchool,Subject,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HomeAddress,HomePost,HomeTel,Mobile,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,HighBegin,HighEnd,MidBegin,MidEnd,MidLink,Contest,Awards,Plan,IsYingjie,Receive,Status,Room,Seat,InterviewBegin,Math,Chinese,Physics,Interview,Grade,Tiaoji from zsb_self_trial order by Sequence";
		selflist = this.getList(sql);
		return selflist;
	}
	public String getAerobicsDate() {
		String AthleteDate = "";
		String sql = "select AerobicsDate from zsb_athlete_admission";
		AthleteDate = getString(sql, new Object[] {});
		return AthleteDate;
	}

	public String getSwimDate() {
		String AthleteTime = "";
		String sql = "select SwimDate from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getCulturalDate() {
		String AthleteTime = "";
		String sql = "select CulturalDate from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getAerobicsBegin() {
		String AthleteTime = "";
		String sql = "select AerobicsBegin from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getSwimBegin() {
		String AthleteTime = "";
		String sql = "select SwimBegin from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getCulturalBegin() {
		String AthleteTime = "";
		String sql = "select CulturalBegin from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getAerobicsEnd() {
		String AthleteTime = "";
		String sql = "select AerobicsEnd from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getSwimEnd() {
		String AthleteTime = "";
		String sql = "select SwimEnd from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getCulturalEnd() {
		String AthleteTime = "";
		String sql = "select CulturalEnd from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getSwimAddress() {
		String AthleteTime = "";
		String sql = "select SwimAddress from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getAerobicsAddress() {
		String AthleteTime = "";
		String sql = "select AerobicsAddress from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public String getCulturalAddress() {
		String AthleteTime = "";
		String sql = "select CulturalAddress from zsb_athlete_admission";
		AthleteTime = getString(sql, new Object[] {});
		return AthleteTime;
	}

	public int subAdmission(String Table,String AerobicsDate, String AerobicsBegin,
			String AerobicsEnd, String AerobicsAddress, String SwimDate,
			String SwimBegin, String SwimEnd, String SwimAddress,
			String CulturalDate, String CulturalBegin, String CulturalEnd,
			String CulturalAddress) {
		    String update_sql = "update `"+Table+"_admission` set `Open`='否',`AerobicsDate`='"+AerobicsDate+"',`AerobicsBegin`='"+AerobicsBegin+"',`AerobicsEnd`='"+AerobicsEnd+"',`AerobicsAddress`='"+AerobicsAddress+"',`SwimDate`='"+SwimDate+"',`SwimBegin`='"+SwimBegin+"',`SwimEnd`='"+SwimEnd+"',`SwimAddress`='"+SwimAddress+"',`CulturalDate`='"+CulturalDate+"',`CulturalBegin`='"+CulturalBegin+"',`CulturalEnd`='"+CulturalEnd+"',`CulturalAddress`='"+CulturalAddress+"'";
		   int no = update(update_sql);
		    return no;
	}

	public int AdmissionGrant(String Type, String Operation) {
		
		String update_sql = "update `"+Type+"_admission` set `Open`='"+Operation+"'";
		int no = -1;
		no = update(update_sql);
		return no;
	}

	public List getRoomList() {
		List l = new ArrayList();
		String sql = "select RoomNo,ClassRoom,SeatAmount from zsb_seat";
		l = this.getList(sql);
		return l;
	}

	public int AddSelfRoom(String RoomNo,String ClassRoom, String SeatAmount) {
		String release_sql = "insert into zsb_self_seat(RoomNo,ClassRoom,SeatAmount) values(?,?,?)";
		
		int no = -1;
		no = update(release_sql, new Object[] { RoomNo,ClassRoom,SeatAmount });
		return no;
	}

	public String getRoomNo(String Type, String RoomId) {
		String RoomNo = "";
		String sql = "";
		if (Type.equals("self")) {
			sql = "select RoomNo from zsb_self_seat where Id=?";
		}
		if (Type.equals("admission")) {
			sql = "select RoomNo from zsb_admission_seat where Id=?";
		}
		RoomNo = getString(sql, new Object[] { RoomId });
		return RoomNo;
	}

	public String getSeatAmount(String Type, String RoomId) {
		String SeatAmount = "";
		String sql = "";
		if (Type.equals("self")) {
			sql = "select SeatAmount from zsb_self_seat where Id=?";
		}
		if (Type.equals("admission")) {
			sql = "select SeatAmount from zsb_admission_seat where Id=?";
		}
		SeatAmount = getString(sql, new Object[] { RoomId });
		return SeatAmount;
	}

	public int updateroom(String Type, String RoomId, String RoomNo,
			String SeatAmount) {
		// System.out.println(Name);
		String update_sql = "";
		if (Type.equals("self")) {
			update_sql = "update zsb_self_seat set RoomNo=?,SeatAmount=? where Id=?";
		}
		// System.out.println(release_sql);
		int no = -1;
		no = update(update_sql, new Object[] { RoomNo, SeatAmount, RoomId });
		return no;
	}

	public int deleteRoom(String Type, String RoomId) {
		// System.out.println(Name);
		String delete_sql = "";
		if (Type.equals("self")) {
			delete_sql = "delete from zsb_self_seat where Id=?";
		}
		if (Type.equals("admission")) {
			delete_sql = "delete from zsb_admission_seat where Id=?";
		}
		// System.out.println(release_sql);
		int no = -1;
		no = update(delete_sql, new Object[] { RoomId });
		return no;
	}

	public Map getAccountList(String curPage) {
		String sql = "select Email,IDcard from `zsb_reg`";
		Map m = this.getPage(sql, new Object[] {}, curPage);
		return m;
	}

	public int deleteAccount(String IDcard) {
		String delete_sql = "delete from zsb_reg where IDcard='"+IDcard+"'";
		int no = update(delete_sql);
		return no;
	}

	public String searchEmail(String IDcard) {
		String Email = "";
		String sql = "select Email from zsb_reg where `IDcard`='"+IDcard+"'";
		Email = getString(sql);
		return Email;
	}

	public String searchPassword(String IDcard) {
		String Password = "";
		String sql = "select Password from zsb_student_reg where IDcard=?";
		Password = getString(sql, new Object[] { IDcard });
		return Password;
	}

	public String getEmail(String IDcard) {
		String Email = "";
		String sql = "select Email from zsb_student_reg where IDcard=?";
		Email = getString(sql, new Object[] { IDcard });
		return Email;
	}

	public long getReg() {
		long Reg = 0;
		String sql = "select count(*) from zsb_reg";
		Reg = getLong(sql, new Object[] {});
		return Reg;
	}

	public int updateEmail(String Email, String IDcard) {
		String update_sql = "";
		update_sql = "update `zsb_reg` set `Email`='"+Email+"' where `IDcard`='"+IDcard+"'";
		int no = -1;
		no = update(update_sql);
		return no;
	}

	public long getAthlete() {
		long Athlete = 0;
		String sql ="select count(*) from `zsb_athlete` where `Status`<>\"尚未提交申请表\" and  `Status`<>\"尚未提交高水平运动员申请表\"";
		Athlete = getLong(sql, new Object[] {});
		return Athlete;
	}

	public long getRecommend() {
		long Recommend = 0;
		String sql = "select count(*) from zsb_recommend where `Status`<>\"尚未提交申请表\" and  `Status`<>\"尚未提交保送生申请表\"";
		Recommend = getLong(sql, new Object[] {});
		return Recommend;
	}

	public long getSelf() {
		long Self = 0;
		String sql = "select count(Id) from zsb_self where `Status`<>\"尚未提交申请表\" and  `Status`<>\"尚未提交自主招生申请表\"";
		Self = getLong(sql, new Object[] {});
		return Self;
	}

	public int Grade(String Type) {
		// System.out.println(Name);
		String update_sql = "";
		if (Type.equals("Athlete")) {
			update_sql = "update zsb_student_athlete set Status=7 Where Status=5";
		}
		// System.out.println(release_sql);
		int no = -1;
		no = update(update_sql, new Object[] {});
		return no;
	}

	public int updateform(String name, String entranceno, String sex,
			String nation, String province, String birthday, String politic,
			String language, String type, String subject, String mobile,
			String tel, String address, String post, String firstrelation,
			String firstname, String firstunit, String firstedu,
			String firsttel, String secondrelation, String secondname,
			String secondunit, String secondedu, String secondtel,
			String highschool, String iskey, String highlink,
			String highdepartment, String highlinktel, String highaddress,
			String highpost, String highbegin, String highend,
			String midschool, String midlink, String midbegin, String midend,
			String firstspecialty, String secondspecialty,
			String thirdspecialty, String fourthspecialty,
			String fifthspecialty, String sixthspecialty, String tiaoji,
			String plan, String contest, String awards, String activities,
			String email) {
		// System.out.println(Name);
		String update_sql = "update zsb_student_self set Name=?,Entranceno=?,Sex=?,Nation=?,Province=?,Birthday=?,Politic=?,Language=?,IsYingjie=?,Subject=?,Mobile=?,HomeTel=?,HomeAddress=?,HomePost=?,Firstrelation=?,Firstname=?,Firstunit=?,Firstedu=?,Firsttel=?,Secondrelation=?,Secondname=?,Secondunit=?,Secondedu=?,Secondtel=?,Highschool=?,Iskey=?,Highlink=?,Highdepartment=?,Highlinktel=?,Highaddress=?,Highpost=?,Highbegin=?,Highend=?,Midschool=?,Midlink=?,Midbegin=?,Midend=?,Firstspecialty=?,Secondspecialty=?,Thirdspecialty=?,Fourthspecialty=?,Fifthspecialty=?,Sixthspecialty=?,Tiaoji=?,Plan=?,Contest=?,Awards=?,Activities=? where Email=?";
		// System.out.println(release_sql);
		int no = -1;
		no = update(update_sql, new Object[] { name, entranceno, sex, nation,
				province, birthday, politic, language, type, subject, mobile,
				tel, address, post, firstrelation, firstname, firstunit,
				firstedu, firsttel, secondrelation, secondname, secondunit,
				secondedu, secondtel, highschool, iskey, highlink,
				highdepartment, highlinktel, highaddress, highpost, highbegin,
				highend, midschool, midlink, midbegin, midend, firstspecialty,
				secondspecialty, thirdspecialty, fourthspecialty,
				fifthspecialty, sixthspecialty, tiaoji, plan, contest, awards,
				activities, email });
		return no;
	}

	public int trial(String Name,String Sequence,String Number, String EntranceNo, String Sex,
			String Nation, String Politic, String Birthday, String IDcard,
			String FirstSpecialty, String SecondSpecialty,
			String ThirdSpecialty, String Province, String HighSchool,
			String Subject, String HighLink, String HighDepartment,
			String HighLinkTel, String HighAddress, String HighPost, String HomeAddress,
			String HomePost, String HomeTel, String Mobile, String FirstRelation,
			String FirstName, String FirstUnit,
			String FirstEdu, String FirstTel, String SecondRelation,
			String SecondName, String SecondUnit, String SecondEdu,
			String SecondTel,
			String HighBegin, String HighEnd, String MidBegin, String MidEnd,
			String MidLink, String Contest,
			String Awards, String Plan,String IsYingjie,String Receive,
			String Status,String Room,String Seat,String InterviewBegin,String Math,String Chinese,String Physics,String Interview,String Grade) {
		//System.out.println(Room);
		String trial_sql = "insert into zsb_self_trial(Name,Sequence,Number,EntranceNo,Sex,Nation,Politic,Birthday,IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,Province,HighSchool,Subject,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HomeAddress,HomePost,HomeTel,Mobile,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,HighBegin,HighEnd,MidBegin,MidEnd,MidLink,Contest,Awards,Plan,IsYingjie,Receive,Status,Room,Seat,InterviewBegin,Math,Chinese,Physics,Interview,Grade) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		// System.out.println(release_sql);
		int no = -1;
		no = update(trial_sql, new Object[] {Name,Sequence,Number,EntranceNo,Sex,Nation,Politic,Birthday,IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,Province,HighSchool,Subject,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HomeAddress,HomePost,HomeTel,Mobile,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,HighBegin,HighEnd,MidBegin,MidEnd,MidLink,Contest,Awards,Plan,IsYingjie,Receive,Status,Room,Seat,InterviewBegin,Math,Chinese,Physics,Interview,Grade});
		return no;
	}
	public int recommendtrial(String Name, String Number, String EntranceNo, String Sex,
			String Nation, String Politic, String Birthday, String IDcard,
			String FirstSpecialty, String SecondSpecialty,
			String ThirdSpecialty, String Province, String HighSchool,
			String Subject, String HighLink, String HighDepartment,
			String HighLinkTel, String HighAddress, String HighPost, String HomeAddress,
			String HomePost, String HomeTel, String Mobile, String FirstRelation,
			String FirstName, String FirstUnit,
			String FirstEdu, String FirstTel, String SecondRelation,
			String SecondName, String SecondUnit, String SecondEdu,
			String SecondTel,
			String HighBegin, String HighEnd, String MidBegin, String MidEnd,
			String MidLink, String Contest,
			String Awards, String Receive,
			String Status) {
		String trial_sql = "insert into zsb_recommend_trial(Name,Number,EntranceNo,Sex,Nation,Politic,Birthday,IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,Province,HighSchool,Subject,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HomeAddress,HomePost,HomeTel,Mobile,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,HighBegin,HighEnd,MidBegin,MidEnd,MidLink,Contest,Awards,Receive,Status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//System.out.println(trial_sql);
		int no = -1;
		no = update(trial_sql, new Object[] {Name,Number,EntranceNo,Sex,Nation,Politic,Birthday,IDcard,FirstSpecialty,SecondSpecialty,ThirdSpecialty,Province,HighSchool,Subject,HighLink,HighDepartment,HighLinkTel,HighAddress,HighPost,HomeAddress,HomePost,HomeTel,Mobile,FirstRelation,FirstName,FirstUnit,FirstEdu,FirstTel,SecondRelation,SecondName,SecondUnit,SecondEdu,SecondTel,HighBegin,HighEnd,MidBegin,MidEnd,MidLink,Contest,Awards,Receive,Status});
		return no;
	}
	public String getRecommendDate() {
		String Date = "";
		String sql = "select Date from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getMathBegin() {
		String Date = "";
		String sql = "select MathBegin from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getMathEnd() {
		String Date = "";
		String sql = "select MathEnd from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getPhysicsBegin() {
		String Date = "";
		String sql = "select PhysicsBegin from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getPhysicsEnd() {
		String Date = "";
		String sql = "select PhysicsEnd from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getLanguageBegin() {
		String Date = "";
		String sql = "select LanguageBegin from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getLanguageEnd() {
		String Date = "";
		String sql = "select LanguageEnd from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getInterviewBegin1() {
		String Date = "";
		String sql = "select InterviewBegin1 from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getInterviewEnd1() {
		String Date = "";
		String sql = "select InterviewEnd1 from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getInterviewBegin2() {
		String Date = "";
		String sql = "select InterviewBegin2 from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getInterviewEnd2() {
		String Date = "";
		String sql = "select InterviewEnd2 from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getWrittenAddress() {
		String Date = "";
		String sql = "select WrittenAddress from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public String getInterviewAddress() {
		String Date = "";
		String sql = "select InterviewAddress from zsb_recommend_admission";
		Date = getString(sql, new Object[] {});
		return Date;
	}
	public long getAdmissionamount(){
		long admissionamount=0;
		long selfamount=0;
		long recommendamount=0;
		String selfsql="select count(*) from zsb_self where InterviewBegin<>''";
		String recommendsql="select count(*) from zsb_recommend where InterviewBegin<>''";
		selfamount=getLong(selfsql,new Object[]{});
		recommendamount=getLong(recommendsql,new Object[]{});
		admissionamount=selfamount+recommendamount;
		return admissionamount;
	}
	public String getMaxRoom() {
		String maxRoom="";
		String sql = "select max(Room) from zsb_self";
		maxRoom = getString(sql, new Object[] {});
		if(maxRoom==null) maxRoom="0";
		return maxRoom;
	}
	public List getRoomTable(String roomNo) {
		List l = new ArrayList();
		String sql = "select zsb_self_trial.Number,zsb_self_trial.Room,zsb_self_trial.Seat,zsb_self_trial.Name,zsb_student_reg.Photo from zsb_self_trial,zsb_student_reg where zsb_self_trial.IDcard=zsb_student_reg.IDcard and zsb_self_trial.Room="+roomNo+" order by zsb_self_trial.Seat";		
		l=this.getList(sql);
		//System.out.println(l);
		return l;
	}
	public String getMaxSeat(String roomNo) {
		String maxSeat="";
		long count=0;
		String sql = "select count(*) from zsb_self_trial where Room=?";
		count = getLong(sql, new Object[] {roomNo});
		maxSeat=count+"";
		//System.out.println(maxRoom);
		return maxSeat;
	}
}