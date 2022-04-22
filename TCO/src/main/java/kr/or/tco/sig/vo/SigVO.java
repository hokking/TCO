package kr.or.tco.sig.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.tco.emp.vo.AttachFilesVO;

public class SigVO {
	
	private int brdId;
	private String brdSe;
	private String brdTtl;
	private String brdCn;
	private String empId;
	private Date brdDt;
	private int brdVi;
	private String brdImg;
	// 글작성자 이름
	private String empNm;
	
	
	// 리스트 출력위한  순번
	private int rnum;

	// 다중 파일 객체
	private MultipartFile[] uploadFile;
	
	// 다중 파일 객체의 파일명
	private String uploadFileName;
	
	// 다중 파일 업로드 객체
	private List<AttachFilesVO> attachFilesVO;

	public int getBrdId() {
		return brdId;
	}

	public void setBrdId(int brdId) {
		this.brdId = brdId;
	}

	public String getBrdSe() {
		return brdSe;
	}

	public void setBrdSe(String brdSe) {
		this.brdSe = brdSe;
	}

	public String getBrdTtl() {
		return brdTtl;
	}

	public void setBrdTtl(String brdTtl) {
		this.brdTtl = brdTtl;
	}

	public String getBrdCn() {
		return brdCn;
	}

	public void setBrdCn(String brdCn) {
		this.brdCn = brdCn;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public Date getBrdDt() {
		return brdDt;
	}

	public void setBrdDt(Date brdDt) {
		this.brdDt = brdDt;
	}

	public int getBrdVi() {
		return brdVi;
	}

	public void setBrdVi(int brdVi) {
		this.brdVi = brdVi;
	}

	public String getBrdImg() {
		return brdImg;
	}

	public void setBrdImg(String brdImg) {
		this.brdImg = brdImg;
	}

	public String getEmpNm() {
		return empNm;
	}

	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public MultipartFile[] getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile[] uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<AttachFilesVO> getAttachFilesVO() {
		return attachFilesVO;
	}

	public void setAttachFilesVO(List<AttachFilesVO> attachFilesVO) {
		this.attachFilesVO = attachFilesVO;
	}

	@Override
	public String toString() {
		return "SigVO [brdId=" + brdId + ", brdSe=" + brdSe + ", brdTtl=" + brdTtl + ", brdCn=" + brdCn + ", empId="
				+ empId + ", brdDt=" + brdDt + ", brdVi=" + brdVi + ", brdImg=" + brdImg + ", empNm=" + empNm
				+ ", rnum=" + rnum + ", uploadFile=" + Arrays.toString(uploadFile) + ", uploadFileName="
				+ uploadFileName + ", attachFilesVO=" + attachFilesVO + "]";
	}

	
	
}
