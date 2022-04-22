package kr.or.tco.prod.mapper;

import java.util.List;
import java.util.Map;

import kr.or.tco.brnc.vo.BrncVO;
import kr.or.tco.cmncd.vo.CmncdVO;
import kr.or.tco.prod.vo.ProdVO;

public interface ProdMapper {

	//상품 목록
	public List<ProdVO> prodList(Map<String, String> map);
	
	//상품 상세 조회
	public ProdVO prodDetail(String prodInfoId);
	
	//상품아이디에 따른 중분류 뽑기
	public List<CmncdVO> cdnm2List(String prodInfoId);
	
	//공통코드 분류 뽑기
	public List<CmncdVO> commonSeList(String cmncdNm1);
	
	//공통코드 찾기
	public String cmncdFind(String cmncdNm2);
	
	//상품 정보 수정
	public int prodUpdate(ProdVO prodVO);
	
	//상품 삭제(여부를 N으로)
	public int prodDelete(String prodInfoId);
	
	//상품 등록
	public int prodInsert(ProdVO prodVO);
	
	//상품아이디로 상품명 뽑기
	public String searchName(String prodInfoId);
	
	//거래처 이름으로 거래처 코드 찾기
	public String cnptCd(String cnptNm);
	
	//거래처 코드로 거래처 이름 찾기
	public String cnptNm(String cnptId);
	
	//본사를 제외한 모든 지점 아이디 가져오기
	public List<BrncVO> brncList();
}