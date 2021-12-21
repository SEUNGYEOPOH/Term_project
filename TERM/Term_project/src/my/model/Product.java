package my.model;

import java.util.Date;

public class Product {
	
	private int pid;
	private String pname;
	private String pcolor;
	private int price;
	private String pimage;
	private Date pdate;
	private String menu;
	private String menu_detail;
	
	@Override
	public String toString() {
		return "pid : "+pid+"  |  pname : "+pname+"  |  pcolor : " +pcolor+"  |  price : "+price+"  |  pimage : "+pimage+"  |  pdate : "+pdate+"  |  menu : "+menu+"  |  menu_detail : "+menu_detail;
	}
	
	public Product() {}

	public Product(int pid, String pname, String pcolor, int price, String pimage, Date pdate, String menu,
			String menu_detail) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pcolor = pcolor;
		this.price = price;
		this.pimage = pimage;
		this.pdate = pdate;
		this.menu = menu;
		this.menu_detail = menu_detail;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcolor() {
		return pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getMenu_detail() {
		return menu_detail;
	}

	public void setMenu_detail(String menu_detail) {
		this.menu_detail = menu_detail;
	}
	
	
	
	
	
	
}
