package kr.or.tco.ordr.mapper;

import java.util.List;
import java.util.Map;

import kr.or.tco.ordr.vo.OrdrVO;

public interface OrdrMapper {

	//수주O - 발주 테이블 목록 가져오기(상세X)
	public List<OrdrVO> rcvOrdrYList();
	
	//수주X - 발주 테이블 목록 가져오기(상세X)
	public List<OrdrVO> rcvOrdrNList();
	
	//발주 아이디 별 상세 정보 뽑기
	public List<OrdrVO> ordrDetail(int ordrId);
	
	//발주 지점 이름 가져오기
	public String brnofcNm(String brncofcId);
	
	//수주X에서 O로 바꾸기
	public int rcvNtoY(int ordrId);
	
	//발주번호 max 찾기
	public int ordrMax();
	
	//부족재고현황에서 발주시 insert
	public int lackInsert(Map<String, Object> map) throws Exception;
	
	//발주 저장, or 바로전송 ORDR_SE => 발주, 저장
	public int ordrInsert(OrdrVO ordrVO);
	
	//발주현황 목록 가져오기
	public List<OrdrVO> getOrdrCondition(String brncofcId);
	
	//발주내역 목록 가져오기
	public List<OrdrVO> getOrdrList(String brncofcId);
	
	//입고여부 거른 발주내역 목록 가져오기
	public List<OrdrVO> getOrdrListAll(String brncofcId);
	
	//발주 삭제
	public int orderDelete(int ordrId);
	
	//발주 전송
	public int saveUpdate(int ordrId);
	
	//입고 시 업데이트
	public int updateWrhs(Map<String, Object> map);
	
	//입고버튼 클릭 시 창고재고에 넣기
	public int addStrgStck(Map<String, Object> map);
}
