package FAQ_pack;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class timer {
	public String datetime=null;
	
	public String nowTime() { 
		LocalDateTime time = LocalDateTime.now();
		DateTimeFormatter drf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		this.datetime = time.format(drf);
		return datetime;
	}
	
	public String dayTime() {
		LocalDateTime time = LocalDateTime.now();
		DateTimeFormatter drf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		this.datetime = time.format(drf);
		return datetime;
	}
	
	
	
	
}