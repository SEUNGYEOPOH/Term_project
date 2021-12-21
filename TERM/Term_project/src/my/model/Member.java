package my.model;

import java.util.Date;

public class Member {
	private String mid;
	private String password;
	private String mname;
	private String mtel;
	private String email;
	private String sns_yn;
	private String email_yn;
	private Date reg_dt;
	
	
	
	public Member() {}
	
	public Member(String mid, String password, String mname, String mtel, String email, String sns_yn, String email_yn,
			Date reg_dt) {
		super();
		this.mid = mid;
		this.password = password;
		this.mname = mname;
		this.mtel = mtel;
		this.email = email;
		this.sns_yn = sns_yn;
		this.email_yn = email_yn;
		this.reg_dt = reg_dt;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSns_yn() {
		return sns_yn;
	}
	public void setSns_yn(String sns_yn) {
		this.sns_yn = sns_yn;
	}
	public String getEmail_yn() {
		return email_yn;
	}
	public void setEmail_yn(String email_yn) {
		this.email_yn = email_yn;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	

	
}
