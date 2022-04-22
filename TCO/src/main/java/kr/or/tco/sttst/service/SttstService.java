package kr.or.tco.sttst.service;

import java.util.List;

import kr.or.tco.cal.vo.CustNtsVO;
import kr.or.tco.emp.vo.EmpVO;
import kr.or.tco.prchs.vo.PrchsVO;
import kr.or.tco.sls.vo.SlsVO;
import kr.or.tco.sttst.vo.SttstVO;

public interface SttstService {
	
	
	//--------------------------본사용------------------
	public List<SlsVO>mainDailyIncome();
	
	public List<SlsVO>mainMonthIncome();
	
	public List<SlsVO>mainYearlyIncome();
	
	
	
	
	//--------------------------지점용------------------
	/**
	 * 일일매출차트
	 * @return
	 */
	public List<SlsVO>getDailyIncome(String brncofcId);
	
	
	
	/**
	 * 일일매입차트
	 * @return
	 */
	public List<PrchsVO>getDailyPurchase();
	
	
	
	/**
	 * 월간매출차트
	 * @return
	 */
	public List<SlsVO>getMonthIncome(String brncofcId);
	
	
	
	
	/**
	 * 년간매출차트
	 * @return
	 */
	public List<SlsVO>getYearlyIncome(String brncofcId);
	
	
	
	/**
	 * 매장별 일일 차트
	 * @return session값을 받아서 매장별 일일 차트
	 */
	public List<SlsVO>getBrnChart(String brncofcId);
	
	
	
	
	/**
	 * 조직도 jstree
	 * @param parentId 
	 * @param list 
	 * @return
	 */
	public List<SttstVO>grouplist();
	
	
	/**
	 * 조직도 jsGrid
	 * @return
	 */
	public List<EmpVO>groupemp(String childId);

	
	
	

	/**
	 * 연령/성별 별 선호 카테고리 찾기
	 * @return
	 */
	public List<SttstVO> PrfredCtg();

	
	
	
	public List<SlsVO>brndaily(String brncofcId);
	
	
}
