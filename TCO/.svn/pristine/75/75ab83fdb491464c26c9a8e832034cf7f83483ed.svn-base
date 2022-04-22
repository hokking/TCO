package kr.or.tco.sls.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import kr.or.tco.cal.vo.CustNtsVO;
import kr.or.tco.sls.vo.SlsVO;

public interface SlsService {
	
	/**
	 * 매출 - 본사용 매출 현황
	 * @param map
	 * @return
	 */
	public List<SlsVO>list(Map<String, Object>map);
	
	
	/**
	 * 매출 - 상세보기
	 * @param slsId
	 * @return
	 */
	public SlsVO detail(String slsId);
	
	
	
	/**
	 * 매출 - 매출 명세서 출력
	 * @param map
	 * @return
	 */
	public List<CustNtsVO>slslist(String custNtslDt);
	
	
	
	/**
	 * 매입 자료 업로드
	 * @param destFile
	 */
	public void excelUpload(File destFile);
	
	
	
	
	/**
	 * 매출 자료 업로드
	 * @param destFile
	 */
	public void excelSlsUpload(File destFile);
	
	
	
	
	
	/**
	 * 매출 - 매장용 매출현황
	 * @param map(매장아이디, 시작일, 종료일)
	 * @return
	 */
	public List<SlsVO>brnlist(Map<String, Object>map);
	
	
}
