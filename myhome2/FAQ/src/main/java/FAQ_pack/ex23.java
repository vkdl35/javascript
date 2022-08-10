package FAQ_pack;

public class ex23 {
	String a = null;
	String b = null;
	public String names() {	//getter
		return this.a;
	}
	public String level() {	//getter
		return this.b;
	}
	public void innames() {	//setter
		this.a = "홍길동";
		this.b = "이순신";
	}
	public void innames2(String nm1, String nm2) {
		this.a = nm1;
		this.b = nm2;
	}
}
