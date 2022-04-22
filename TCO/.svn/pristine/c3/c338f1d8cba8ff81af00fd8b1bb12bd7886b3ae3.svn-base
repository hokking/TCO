package kr.or.tco.sls.mapper;

import java.util.List;
import java.util.Map;

import kr.or.tco.cal.vo.CustNtsVO;
import kr.or.tco.sls.vo.SlsVO;

public interface SlsMapper {
	
	
	//본사용 매출현황(모든매장현황)
	public List<SlsVO>list(Map<String, Object>map);
	
	
	//매출 상세보기
	public SlsVO detail(String slsId);
	
	
	//매출 명세서
	public List<CustNtsVO>slslist(String custNtslDt);
	
	
	//매입 엑셀파일 업로드
	public void insertprchsExcel(Map<String, Object> paramMap)throws Exception;
	
	
	//매출 엑셀파일 업로드
	public void insertslsExcel(Map<String, Object> paramMap)throws Exception;
	
	
	
	//매장별 매출현황(매장용)
	public List<SlsVO>brnlist(Map<String, Object>map);
	
	
}
