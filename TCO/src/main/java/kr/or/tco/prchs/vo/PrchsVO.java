package kr.or.tco.prchs.vo;

import kr.or.tco.prchsgds.vo.PrchsGdsVO;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class PrchsVO {
	private String prchsId;	//매입아이디
	private String prchsSe;	//매입 구분
	private String prchsDt;	//매입일 (선택가능)
	private int prchsAmt;	//매입총액
	private String cnptId;	//매입 거래처
	
	private int prchsVat;	//매입세금
	private int prchsSuAmt;	//매입 공급가액
	private String cnptCharger;	//담당자
	private String cnptNm;		//거래처명
	private String cnptMail;	//거래처 이메일
	private String cnptTel;	//거래처 연락처
	private String condition;	//입고현황
	
	private List<PrchsGdsVO> prchsGdsVO;	//매입상품 리스트
	
	public String getPrchsAmtDisplay() {
		String res = new DecimalFormat("#,###").format(prchsAmt);
		return res;
	}
	public String getPrchsVatDisplay() {
		String res = new DecimalFormat("#,###").format(prchsVat);
		return res;
	}
	public String getPrchsSuAmtDisplay() {
		String res = new DecimalFormat("#,###").format(prchsSuAmt);
		return res;
	}
	
	public String getPrchsId() {
		return prchsId;
	}
	public void setPrchsId(String prchsId) {
		this.prchsId = prchsId;
	}
	public String getPrchsSe() {
		return prchsSe;
	}
	public void setPrchsSe(String prchsSe) {
		this.prchsSe = prchsSe;
	}
	public String getPrchsDt() {
		return prchsDt;
	}
	public void setPrchsDt(String prchsDt) {
		this.prchsDt = prchsDt;
	}
	public int getPrchsAmt() {
		return prchsAmt;
	}
	public void setPrchsAmt(int prchsAmt) {
		this.prchsAmt = prchsAmt;
	}
	public String getCnptId() {
		return cnptId;
	}
	public void setCnptId(String cnptId) {
		this.cnptId = cnptId;
	}
	public int getPrchsVat() {
		return prchsVat;
	}
	public void setPrchsVat(int prchsVat) {
		this.prchsVat = prchsVat;
	}
	public int getPrchsSuAmt() {
		return prchsSuAmt;
	}
	public void setPrchsSuAmt(int prchsSuAmt) {
		this.prchsSuAmt = prchsSuAmt;
	}
	
	public String getCnptCharger() {
		return cnptCharger;
	}
	public void setCnptCharger(String cnptCharger) {
		this.cnptCharger = cnptCharger;
	}
	public String getCnptNm() {
		return cnptNm;
	}
	public void setCnptNm(String cnptNm) {
		this.cnptNm = cnptNm;
	}
	
	public List<PrchsGdsVO> getPrchsGdsVO() {
		return prchsGdsVO;
	}
	public void setPrchsGdsVO(List<PrchsGdsVO> prchsGdsVO) {
		this.prchsGdsVO = prchsGdsVO;
	}
	
	public String getCnptMail() {
		return cnptMail;
	}
	public void setCnptMail(String cnptMail) {
		this.cnptMail = cnptMail;
	}
	
	 public String getCnptTel() {
		return cnptTel;
	}
	public void setCnptTel(String cnptTel) {
		this.cnptTel = cnptTel;
	}
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
