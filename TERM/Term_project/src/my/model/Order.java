package my.model;

import java.util.Date;

public class Order {
	private int oid;
	private String mid;
	private int pid;
	private String pname;
	private String pimage;
	private Date odate;
	private int amount;
	private String address;
	private String pcolor;
	private int total_price;
	
	public Order() {}
	
	@Override
	public String toString() {
		return "mid : "+mid+"  |  pid : "+pid+"  |  odate : "+odate+"  |  amount : "+amount+"  |  address : "+address+"  |  pcolor : "+pcolor+"  |  total_price : "+total_price;
	}

	public Order(String mid, int pid, Date odate, int amount, String address, String pcolor, int total_price) {
		super();
		this.mid = mid;
		this.pid = pid;
		this.odate = odate;
		this.amount = amount;
		this.address = address;
		this.pcolor = pcolor;
		this.total_price = total_price;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
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

	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public String getPname() {
		return pname;
	}
	
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	
	public String getPimage() {
		return pimage;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOption() {
		return pcolor;
	}

	public void setOption(String pcolor) {
		this.pcolor = pcolor;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	
	
	
	
	
}
