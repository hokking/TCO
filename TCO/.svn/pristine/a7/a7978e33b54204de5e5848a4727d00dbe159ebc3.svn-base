package kr.or.tco.prchsgds.vo;

import java.text.DecimalFormat;

public class PrchsGdsVO {
	private String prchsId;	//매입아이디
	private String prodInfoId;	//상품아이디
	private int prchsGdsQty;	//매입수량
	private int prchsGdsAmt;	//매입단가
	private String prchsGdsYn;	//입고여부
	private String prodInfoNm;	//상품명
	private int prchsGdsSuAmt;	//공급가액
	private int prchsGdsVat;	//세액
	private int prchsGdsSum;	//합계
	
	
	public String getPrchsGdsAmtDisplay() {
		String res = new DecimalFormat("#,###").format(prchsGdsAmt);
		return res;
	}
	public String getPrchsGdsSuAmtDisplay() {
		String res = new DecimalFormat("#,###").format(prchsGdsSuAmt);
		return res;
	}
	public String getPrchsGdsVatDisplay() {
		String res = new DecimalFormat("#,###").format(prchsGdsVat);
		return res;
	}
	public String getPrchsGdsSumDisplay() {
		String res = new DecimalFormat("#,###").format(prchsGdsSum);
		return res;
	}
	public String getProdInfoNmDisplay() { //상품명
		String res = "";
		if(prodInfoNm!=null) {
			res = this.prodInfoNm.replaceAll("_", " ");
			return res;
		}
		return res;
	}
	public String getPrchsId() {
		return prchsId;
	}
	public void setPrchsId(String prchsId) {
		this.prchsId = prchsId;
	}
	public String getProdInfoId() {
		return prodInfoId;
	}
	public void setProdInfoId(String prodInfoId) {
		this.prodInfoId = prodInfoId;
	}
	public int getPrchsGdsQty() {
		return prchsGdsQty;
	}
	public void setPrchsGdsQty(int prchsGdsQty) {
		this.prchsGdsQty = prchsGdsQty;
	}
	public int getPrchsGdsAmt() {
		return prchsGdsAmt;
	}
	public void setPrchsGdsAmt(int prchsGdsAmt) {
		this.prchsGdsAmt = prchsGdsAmt;
	}
	public String getPrchsGdsYn() {
		return prchsGdsYn;
	}
	public void setPrchsGdsYn(String prchsGdsYn) {
		this.prchsGdsYn = prchsGdsYn;
	}
	public String getProdInfoNm() {
		return prodInfoNm;
	}
	public void setProdInfoNm(String prodInfoNm) {
		this.prodInfoNm = prodInfoNm;
	}
	public int getPrchsGdsSuAmt() {
		return prchsGdsSuAmt;
	}
	public void setPrchsGdsSuAmt(int prchsGdsSuAmt) {
		this.prchsGdsSuAmt = prchsGdsSuAmt;
	}
	public int getPrchsGdsVat() {
		return prchsGdsVat;
	}
	public void setPrchsGdsVat(int prchsGdsVat) {
		this.prchsGdsVat = prchsGdsVat;
	}
	public int getPrchsGdsSum() {
		return prchsGdsSum;
	}
	public void setPrchsGdsSum(int prchsGdsSum) {
		this.prchsGdsSum = prchsGdsSum;
	}
	@Override
	public String toString() {
		return "PrchsGdsVO [prchsId=" + prchsId + ", prodInfoId=" + prodInfoId + ", prchsGdsQty=" + prchsGdsQty
				+ ", prchsGdsAmt=" + prchsGdsAmt + ", prchsGdsYn=" + prchsGdsYn + ", prodInfoNm=" + prodInfoNm + "]";
	}
	
}
