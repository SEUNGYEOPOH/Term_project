package my.model;

public class Menu {
	private int menuseq;
	private int pmenuseq;
	private String menuname;
	
	
	public Menu() {} 
	
	public Menu(int menuseq, int pmenuseq, String menuname) {
		super();
		this.menuseq = menuseq;
		this.pmenuseq = pmenuseq;
		this.menuname = menuname;
	}

	public int getMenuseq() {
		return menuseq;
	}

	public void setMenuseq(int menuseq) {
		this.menuseq = menuseq;
	}

	public int getPmenuseq() {
		return pmenuseq;
	}

	public void setPmenuseq(int pmenuseq) {
		this.pmenuseq = pmenuseq;
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	
	
	
}
