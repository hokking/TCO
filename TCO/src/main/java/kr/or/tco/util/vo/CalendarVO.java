package kr.or.tco.util.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CalendarVO {
	//공용캘린더
	private int calendarNo;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startday;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endday;
	private String category;
	private String userId;
	//전사캘린더
	private int mainCalno;
	private String mainCaltitle;
	private String mainCalcon;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mainStart;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mainEnd;
	private String mainCaluser;
	private String mainColor;
	
	
	public int getCalendarNo() {
		return calendarNo;
	}
	public void setCalendarNo(int calendarNo) {
		this.calendarNo = calendarNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getStartday() {
		return startday;
	}
	public void setStartday(Date startday) {
		this.startday = startday;
	}
	public Date getEndday() {
		return endday;
	}
	public void setEndday(Date endday) {
		this.endday = endday;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getMainCalno() {
		return mainCalno;
	}
	public void setMainCalno(int mainCalno) {
		this.mainCalno = mainCalno;
	}
	public String getMainCaltitle() {
		return mainCaltitle;
	}
	public void setMainCaltitle(String mainCaltitle) {
		this.mainCaltitle = mainCaltitle;
	}
	public String getMainCalcon() {
		return mainCalcon;
	}
	public void setMainCalcon(String mainCalcon) {
		this.mainCalcon = mainCalcon;
	}
	public Date getMainStart() {
		return mainStart;
	}
	public void setMainStart(Date mainStart) {
		this.mainStart = mainStart;
	}
	public Date getMainEnd() {
		return mainEnd;
	}
	public void setMainEnd(Date mainEnd) {
		this.mainEnd = mainEnd;
	}
	public String getMainCaluser() {
		return mainCaluser;
	}
	public void setMainCaluser(String mainCaluser) {
		this.mainCaluser = mainCaluser;
	}
	public String getMainColor() {
		return mainColor;
	}
	public void setMainColor(String mainColor) {
		this.mainColor = mainColor;
	}
	@Override
	public String toString() {
		return "CalendarVO [calendarNo=" + calendarNo + ", title=" + title + ", content=" + content + ", startday="
				+ startday + ", endday=" + endday + ", category=" + category + ", userId=" + userId + ", mainCalno="
				+ mainCalno + ", mainCaltitle=" + mainCaltitle + ", mainCalcon=" + mainCalcon + ", mainStart="
				+ mainStart + ", mainEnd=" + mainEnd + ", mainCaluser=" + mainCaluser + ", mainColor=" + mainColor
				+ "]";
	}
	
	
	
}
