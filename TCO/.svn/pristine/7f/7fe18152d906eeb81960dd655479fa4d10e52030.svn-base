package kr.or.tco.cust.vo;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class CustMailVO {
//	private Integer idx;
	private String senderMail;

	private String receiveMail;
	private String subject;
	private String message;
//	private Date regdate;

	private MultipartFile files;

	public String getSenderMail() {
		return senderMail;
	}

	public void setSenderMail(String senderMail) {
		this.senderMail = senderMail;
	}

	public String getReceiveMail() {
		return receiveMail;
	}

	public void setReceiveMail(String receiveMail) {
		this.receiveMail = receiveMail;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public MultipartFile getFiles() {
		return files;
	}

	public void setFiles(MultipartFile files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "CustMailVO [senderMail=" + senderMail + ", receiveMail=" + receiveMail + ", subject=" + subject
				+ ", message=" + message + ", files=" + files + "]";
	}

}
