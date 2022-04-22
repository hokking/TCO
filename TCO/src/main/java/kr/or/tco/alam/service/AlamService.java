package kr.or.tco.alam.service;

import java.util.List;
import java.util.Map;

import kr.or.tco.alam.vo.AlamVO;
import kr.or.tco.emp.vo.EmpVO;

public interface AlamService {

	//알람 데이터 alam 테이블에 입력
	int alamInsert(Map<String, Object> map);
	//알람 읽음 표시 alam 테이블에 입력
	int alamRead(Map<String, Object> map);
	//안읽은 알람들 표시되는 list 를 테이블로
	List<AlamVO> alamTable(Map<String, Object> map);
	
	//알람리스트
	List<AlamVO>alamAll(String receiverId);
	
	//부족재고 알람 보낼 매장 직원 찾기
	List<EmpVO> findStoreWorker(String brncofcId);
	
	//부족재고 알람 보낼 창고 직원 찾기
	List<EmpVO> findStrgWorker(String brncofcId);

}
