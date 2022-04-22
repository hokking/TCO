package kr.or.tco.emp.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class EmpVO {

	
	private String empId; // 직원아이디
	private String empNm; //직원명
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date empJncmpYmd; //입사일
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date empBrdt; //생년월일
	
	
	private String empMail; //이메일
	private String empPswd; //비밀번호
	private String empImg; // 이미지
	private String empIp; //아이피
	private String empActno; // 계좌번호
	private String empSe; // 직원유형
	private int rglrempCrtrpy; //기본급
	private int rglrempBns; // 상여금
	private int rglrempFdpy; // 식대
	private int rglrempCrpy; // 차량유지비
	private int rglrempBbpy; // 육아수당
	private int ctrtempHrpy; // 시급
	private int ctrtempTm; // 근무시간
	private String ctrtempSe; //근무형태
	private int ctrtempHdpy; // 주휴수당
	private int ctrtempTx; // 세금
	// 근태 관리용
	private String cmncdCdd;
	private String cmncdCd; // 공통코드 직급
	private String empTel;
	private String enabled;
	// 유형-소속
	private String opt;
	// 부서
	private String dptopt;
	// 직급
	private String lelopt;
	
	// 근무지점 id
	private String brncofcId;
	
	// 근무지점 nm
	private String brncofcNm;
	
	// 파일
	
	// 리스트 출력위한  순번 추가 부탁
	private int rnum;
	
	// 다중 파일 객체
	private MultipartFile[] uploadFile;
	
	// 다중 파일 객체의 파일명
	private String uploadFileName;
	
	// 다중 파일 업로드 객체
	private List<AttachFilesVO> attachFilesVO;
	
	//인증정보
	private List<EmpAuth> empAuth;
		
	// 업무상태
	private String worksttsCk;
	
	
	public List<EmpAuth> getEmpAuth() {
		return empAuth;
	}
	public void setEmpAuth(List<EmpAuth> empAuth) {
		this.empAuth = empAuth;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

	public Date getEmpJncmpYmd() {
		return empJncmpYmd;
	}
	public void setEmpJncmpYmd(Date empJncmpYmd) {
		this.empJncmpYmd = empJncmpYmd;
	}
	public Date getEmpBrdt() {
		return empBrdt;
	}
	public void setEmpBrdt(Date empBrdt) {
		this.empBrdt = empBrdt;
	}
	public String getEmpMail() {
		return empMail;
	}
	public void setEmpMail(String empMail) {
		this.empMail = empMail;
	}
	public String getEmpPswd() {
		return empPswd;
	}
	public void setEmpPswd(String empPswd) {
		this.empPswd = empPswd;
	}
	public String getEmpImg() {
		return empImg;
	}
	public void setEmpImg(String empImg) {
		this.empImg = empImg;
	}
	public String getEmpIp() {
		return empIp;
	}
	public void setEmpIp(String empIp) {
		this.empIp = empIp;
	}
	public String getEmpActno() {
		return empActno;
	}
	public void setEmpActno(String empActno) {
		this.empActno = empActno;
	}
	public String getEmpSe() {
		return empSe;
	}
	public void setEmpSe(String empSe) {
		this.empSe = empSe;
	}
	public int getRglrempCrtrpy() {
		return rglrempCrtrpy;
	}
	public void setRglrempCrtrpy(int rglrempCrtrpy) {
		this.rglrempCrtrpy = rglrempCrtrpy;
	}
	public int getRglrempBns() {
		return rglrempBns;
	}
	public void setRglrempBns(int rglrempBns) {
		this.rglrempBns = rglrempBns;
	}
	public int getRglrempFdpy() {
		return rglrempFdpy;
	}
	public void setRglrempFdpy(int rglrempFdpy) {
		this.rglrempFdpy = rglrempFdpy;
	}
	public int getRglrempCrpy() {
		return rglrempCrpy;
	}
	public void setRglrempCrpy(int rglrempCrpy) {
		this.rglrempCrpy = rglrempCrpy;
	}
	public int getRglrempBbpy() {
		return rglrempBbpy;
	}
	public void setRglrempBbpy(int rglrempBbpy) {
		this.rglrempBbpy = rglrempBbpy;
	}
	public int getCtrtempHrpy() {
		return ctrtempHrpy;
	}
	public void setCtrtempHrpy(int ctrtempHrpy) {
		this.ctrtempHrpy = ctrtempHrpy;
	}
	public int getCtrtempTm() {
		return ctrtempTm;
	}
	public void setCtrtempTm(int ctrtempTm) {
		this.ctrtempTm = ctrtempTm;
	}
	public String getCtrtempSe() {
		return ctrtempSe;
	}
	public void setCtrtempSe(String ctrtempSe) {
		this.ctrtempSe = ctrtempSe;
	}
	public int getCtrtempHdpy() {
		return ctrtempHdpy;
	}
	public void setCtrtempHdpy(int ctrtempHdpy) {
		this.ctrtempHdpy = ctrtempHdpy;
	}
	public int getCtrtempTx() {
		return ctrtempTx;
	}
	public void setCtrtempTx(int ctrtempTx) {
		this.ctrtempTx = ctrtempTx;
	}
	public String getCmncdCd() {
		return cmncdCd;
	}
	public void setCmncdCd(String cmncdCd) {
		this.cmncdCd = cmncdCd;
	}
	
	
	
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public String getDptopt() {
		return dptopt;
	}
	public void setDptopt(String dptopt) {
		this.dptopt = dptopt;
	}
	public String getLelopt() {
		return lelopt;
	}
	public void setLelopt(String lelopt) {
		this.lelopt = lelopt;
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
	public List<AttachFilesVO> getAttachFilesVO() {
		return attachFilesVO;
	}
	public void setAttachFilesVO(List<AttachFilesVO> attachFilesVO) {
		this.attachFilesVO = attachFilesVO;
	}
	
	
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	
	
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	
	
	public String getWorksttsCk() {
		return worksttsCk;
	}
	public void setWorksttsCk(String worksttsCk) {
		this.worksttsCk = worksttsCk;
	}
	
	
	public String getBrncofcId() {
		return brncofcId;
	}
	public void setBrncofcId(String brncofcId) {
		this.brncofcId = brncofcId;
	}
	
	
	public String getBrncofcNm() {
		return brncofcNm;
	}
	public void setBrncofcNm(String brncofcNm) {
		this.brncofcNm = brncofcNm;
	}
	
	
	public String getCmncdCdd() {
		return cmncdCdd;
	}
	public void setCmncdCdd(String cmncdCdd) {
		this.cmncdCdd = cmncdCdd;
	}
	@Override
	public String toString() {
		return "EmpVO [empId=" + empId + ", empNm=" + empNm + ", empJncmpYmd=" + empJncmpYmd + ", empBrdt=" + empBrdt
				+ ", empMail=" + empMail + ", empPswd=" + empPswd + ", empImg=" + empImg + ", empIp=" + empIp
				+ ", empActno=" + empActno + ", empSe=" + empSe + ", rglrempCrtrpy=" + rglrempCrtrpy + ", rglrempBns="
				+ rglrempBns + ", rglrempFdpy=" + rglrempFdpy + ", rglrempCrpy=" + rglrempCrpy + ", rglrempBbpy="
				+ rglrempBbpy + ", ctrtempHrpy=" + ctrtempHrpy + ", ctrtempTm=" + ctrtempTm + ", ctrtempSe=" + ctrtempSe
				+ ", ctrtempHdpy=" + ctrtempHdpy + ", ctrtempTx=" + ctrtempTx + ", cmncdCdd=" + cmncdCdd + ", cmncdCd="
				+ cmncdCd + ", empTel=" + empTel + ", enabled=" + enabled + ", opt=" + opt + ", dptopt=" + dptopt
				+ ", lelopt=" + lelopt + ", brncofcId=" + brncofcId + ", brncofcNm=" + brncofcNm + ", rnum=" + rnum
				+ ", uploadFile=" + Arrays.toString(uploadFile) + ", uploadFileName=" + uploadFileName
				+ ", attachFilesVO=" + attachFilesVO + ", empAuth=" + empAuth + ", worksttsCk=" + worksttsCk + "]";
	}
	
}
