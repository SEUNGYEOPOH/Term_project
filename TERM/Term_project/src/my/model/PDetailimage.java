package my.model;

public class PDetailimage {
	private int iid;
	private int pid;
	private String detailimage;
	
	public PDetailimage () {}

	public PDetailimage(int iid, int pid, String detailimage) {
		super();
		this.iid = iid;
		this.pid = pid;
		this.detailimage = detailimage;
	}

	public int getIid() {
		return iid;
	}

	public void setIid(int iid) {
		this.iid = iid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getDetailimage() {
		return detailimage;
	}

	public void setDetailimage(String detailimage) {
		this.detailimage = detailimage;
	}
	
	
	
}
