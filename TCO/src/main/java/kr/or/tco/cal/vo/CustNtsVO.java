package kr.or.tco.cal.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

@Repository
public class CustNtsVO {
	
	//소비자 판매
	private int custNtslId ; //판매아이디
	private String brncofcId;
	private  String custId;  // 고객아이디
	private String prodInfoId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date custNtslDt; //소비자 판매일 
	private int custNtslAmt;  //소비자 판매 가격
	
	private String brncofcNm; //지점명
	private String prodInfoNm; // 상품명
	private int custNtslQty; //소비자 판매 수량
	private int custNtslTotal; // 소비자 판매 총액
	private String cnptNm; //거래처 명
	
	
	public String getCnptNm() {
		return cnptNm;
	}
	public void setCnptNm(String cnptNm) {
		this.cnptNm = cnptNm;
	}
	public int getCustNtslId() {
		return custNtslId;
	}
	public void setCustNtslId(int custNtslId) {
		this.custNtslId = custNtslId;
	}
	public String getBrncofcId() {
		return brncofcId;
	}
	public void setBrncofcId(String brncofcId) {
		this.brncofcId = brncofcId;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getProdInfoId() {
		return prodInfoId;
	}
	public void setProdInfoId(String prodInfoId) {
		this.prodInfoId = prodInfoId;
	}
	public Date getCustNtslDt() {
		return custNtslDt;
	}
	public void setCustNtslDt(Date custNtslDt) {
		this.custNtslDt = custNtslDt;
	}
	public int getCustNtslAmt() {
		return custNtslAmt;
	}
	public void setCustNtslAmt(int custNtslAmt) {
		this.custNtslAmt = custNtslAmt;
	}
	public String getBrncofcNm() {
		return brncofcNm;
	}
	public void setBrncofcNm(String brncofcNm) {
		this.brncofcNm = brncofcNm;
	}
	public String getProdInfoNm() {
		return prodInfoNm;
	}
	public void setProdInfoNm(String prodInfoNm) {
		this.prodInfoNm = prodInfoNm;
	}
	public int getCustNtslQty() {
		return custNtslQty;
	}
	public void setCustNtslQty(int custNtslQty) {
		this.custNtslQty = custNtslQty;
	}
	public int getCustNtslTotal() {
		return custNtslTotal;
	}
	public void setCustNtslTotal(int custNtslTotal) {
		this.custNtslTotal = custNtslTotal;
	}
	@Override
	public String toString() {
		return "CustNtsVO [custNtslId=" + custNtslId + ", brncofcId=" + brncofcId + ", custId=" + custId
				+ ", prodInfoId=" + prodInfoId + ", custNtslDt=" + custNtslDt + ", custNtslAmt=" + custNtslAmt
				+ ", brncofcNm=" + brncofcNm + ", prodInfoNm=" + prodInfoNm + ", custNtslQty=" + custNtslQty
				+ ", custNtslTotal=" + custNtslTotal + ", cnptNm=" + cnptNm + "]";
	}
	
		

}
