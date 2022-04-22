package kr.or.tco.sttst.mapper;

import java.util.List;

import kr.or.tco.cal.vo.CustNtsVO;
import kr.or.tco.emp.vo.EmpVO;
import kr.or.tco.prchs.vo.PrchsVO;
import kr.or.tco.sls.vo.SlsVO;
import kr.or.tco.sttst.vo.SttstVO;

public interface SttstMapper {
	
	
	//--------------------------본사용------------------
	public List<SlsVO>mainDailyIncome();
	
	public List<SlsVO>mainMonthIncome();
	
	public List<SlsVO>mainYearlyIncome();
	
	
	
	
	//--------------------------지점용------------------
	/**
	 * 일일매출 통계
	 * @return 일자와 일판매매출을 담은 list
	 */
	public List<SlsVO>getDailyIncome(String brncofcId);
	
	
	/**
	 * 일일매입 통계
	 * @return 일자와 일매입을 담은 list
	 */
	public List<PrchsVO>getDailyPurchase();
	
	/**
	 * 월간매출 통계
	 * @return 월판매 매출을 담은 list
	 */
	public List<SlsVO>getMonthIncome(String brncofcId);
	
	
	/**
	 * 년간매출 통계
	 * @return 년판매매출을 담은 list
	 */
	public List<SlsVO>getYearlyIncome(String brncofcId);
	
	
	/**
	 * 매장별 판매차트
	 * @return 매장에서의 일일매출 차트
	 */
	public List<SlsVO>getBrnChart(String brncofcId);
	
	
	
	/**
	 * 조직도 jstree
	 * @return
	 */
	public List<SttstVO>grouplist();
	
	
	
	/**
	 * 조직도 grid
	 * @return
	 */
	public List<EmpVO>groupemp(String childId);
	
	

	/**
	 * 연령/성별 별 선호 카테고리 test
	 * @return 선호 카테고리 정보를 담은 list
	 */
	public List<SttstVO> PrfredCtg();
	
	
	
	
	public List<SlsVO>brndaily(String brncofcId);
	
	
}
