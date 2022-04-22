package kr.or.tco.cmncd.vo;

public class CmncdVO {
	private String cmncdCd   ;
	private String cmncdGuCd ;
	private String cmncdGuNm ;
	private String cmncdNm1  ;
	private String cmncdNm2  ;
	private String cmncdOpt1 ;
	private String cmncdYn   ;
	
	public String getCmncdCd() {
		return cmncdCd;
	}
	public void setCmncdCd(String cmncdCd) {
		this.cmncdCd = cmncdCd;
	}
	public String getCmncdGuCd() {
		return cmncdGuCd;
	}
	public void setCmncdGuCd(String cmncdGuCd) {
		this.cmncdGuCd = cmncdGuCd;
	}
	public String getCmncdGuNm() {
		return cmncdGuNm;
	}
	public void setCmncdGuNm(String cmncdGuNm) {
		this.cmncdGuNm = cmncdGuNm;
	}
	public String getCmncdNm1() {
		return cmncdNm1;
	}
	public void setCmncdNm1(String cmncdNm1) {
		this.cmncdNm1 = cmncdNm1;
	}
	public String getCmncdNm2() {
		return cmncdNm2;
	}
	public void setCmncdNm2(String cmncdNm2) {
		this.cmncdNm2 = cmncdNm2;
	}
	public String getCmncdOpt1() {
		return cmncdOpt1;
	}
	public void setCmncdOpt1(String cmncdOpt1) {
		this.cmncdOpt1 = cmncdOpt1;
	}
	public String getCmncdYn() {
		return cmncdYn;
	}
	public void setCmncdYn(String cmncdYn) {
		this.cmncdYn = cmncdYn;
	}
	@Override
	public String toString() {
		return "CmncdVO [cmncdCd=" + cmncdCd + ", cmncdGuCd=" + cmncdGuCd + ", cmncdGuNm=" + cmncdGuNm + ", cmncdNm1="
				+ cmncdNm1 + ", cmncdNm2=" + cmncdNm2 + ", cmncdOpt1=" + cmncdOpt1 + ", cmncdYn=" + cmncdYn + "]";
	}
}
