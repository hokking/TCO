package kr.or.tco.cnpt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.tco.cmncd.vo.CmncdVO;
import kr.or.tco.cnpt.mapper.CnptMapper;
import kr.or.tco.cnpt.service.CnptService;
import kr.or.tco.cnpt.vo.CnptVO;

//거래처 서비스
@Service
public class CnptServiceImpl implements CnptService {

	@Autowired
	CnptMapper cnptMapper;
	
	//거래처 조회 - 공용
	@Override
	public List<CnptVO> cnptList(String keyword) {
		return cnptMapper.cnptList(keyword);
	}
	
	//거래처 조회
	@Override
	public List<CnptVO> cnptList1(Map<String, Object> map) {
		return cnptMapper.cnptList1(map);
	}
	
	//거래중단된 거래처 조회	
	@Override
	public List<CnptVO> cnptStpList(Map<String, Object> map) {
		return cnptMapper.cnptStpList(map);
	}
	
	//거래처 수
	@Override
	public int selectYCount(Map<String, Object> map) {
		return cnptMapper.selectYCount(map);
	}
	
	//거래중단 거래처 수 
	@Override
	public int selectNCount(Map<String, Object> map) {
		return cnptMapper.selectNCount(map);
	}

	//거래처 등록
	@Override
	public int cnptInsert(CnptVO cnptVO) {
		return cnptMapper.cnptInsert(cnptVO);
	}

	//거래처 상세조회
	@Override
	public CnptVO cnptDetail(String cnptId) {
		return cnptMapper.cnptDetail(cnptId);
	}
	
	//거래처 수정 - 기본정보
	@Override
	public int updateBasic(CnptVO cnptVO) {
		return cnptMapper.updateBasic(cnptVO);
	}
	//거래처 수정 - 계좌정보
	@Override
	public int updateAct(CnptVO cnptVO) {
		return cnptMapper.updateAct(cnptVO);
	}
	//거래처 수정 - 담당자 정보
	@Override
	public int updateCharger(CnptVO cnptVO) {
		return cnptMapper.updateCharger(cnptVO);
	}
	
	//거래처 거래중단
	@Override
	public int cnptToN(String cnptId) {
		return cnptMapper.cnptToN(cnptId);
	}
	//거래처 거래재개
	@Override
	public int cnptToY(String cnptId) {
		return cnptMapper.cnptToY(cnptId);
	}

	//공통코드명 뽑아내기
	@Override
	public List<CmncdVO> selectCmncdList() {
		return cnptMapper.selectCmncdList();
	}

	//공통코드아이디로 공통코드명 가져오기
	@Override
	public String getCmncdNm(String cmncdCd) {
		return cnptMapper.getCmncdNm(cmncdCd);
	}
	

}
