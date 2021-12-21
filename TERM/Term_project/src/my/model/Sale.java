package my.model;

import java.util.Date;

public class Sale {
	private int sid;
	private String mid;
	private int pid;
	private int amount;
	private int totalprice;
	private Date sdate;
	
	 public Sale() {}

	public Sale(int sid, String mid, int pid, int amount, int totalprice, Date sdate) {
		super();
		this.sid = sid;
		this.mid = mid;
		this.pid = pid;
		this.amount = amount;
		this.totalprice = totalprice;
		this.sdate = sdate;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	
}