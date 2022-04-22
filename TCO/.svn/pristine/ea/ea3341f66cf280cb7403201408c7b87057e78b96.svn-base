package kr.or.tco.cnpt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.tco.ArticlePage;
import kr.or.tco.cmncd.vo.CmncdVO;
import kr.or.tco.cnpt.mapper.CnptMapper;
import kr.or.tco.cnpt.service.CnptService;
import kr.or.tco.cnpt.vo.CnptVO;

//거래처 컨트롤러
@RequestMapping("/cnpt")
@Controller
public class CnptController {
	
	@Autowired
	CnptService cnptService;
	
	final static Logger logger = 
			LoggerFactory.getLogger(CnptController.class);
	
	//거래처 조회
	@RequestMapping("/list")
	public String list(Model model
			, @RequestParam(defaultValue = "1", required = false) int currentPage
			, @RequestParam(defaultValue = "10", required = false) int size
			, @RequestParam(required = false) String keyWord) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("size", size);
		map.put("currentPage", currentPage);
		
		// 거래처 전체 수 - 일반
		int total = this.cnptService.selectYCount(map);
		// 거래처 전체 수 - 휴면
		int total1 = this.cnptService.selectNCount(map);
		
		//거래처 목록 불러오기
		List<CnptVO> list = cnptService.cnptList1(map);
		
		//거래중단된 거래처 목록 불러오기
		List<CnptVO> stpList = cnptService.cnptStpList(map);
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, list));
		model.addAttribute("list1", new ArticlePage(total1, currentPage, size, 5, stpList));
		model.addAttribute("total", total);
		model.addAttribute("total1", total1);
		
		return "cnpt/list";
	}
	
	//거래처 상세조회
	@RequestMapping(value="/detail/{cnptId}")
	public String detail(@PathVariable("cnptId") String cnptId,
			Model model) {
		CnptVO cnptVO = this.cnptService.cnptDetail(cnptId);
		//공통코드명 가져오기
		String cmncdNm = cnptService.getCmncdNm(cnptVO.getCmncdCd());
		//공통코드명 세팅
		cnptVO.setCmncdNm1(cmncdNm);
		//모델에 저장
		model.addAttribute("cnptVO", cnptVO);
		
		//공통코드 불러오기 
		List<CmncdVO> cmncdList = cnptService.selectCmncdList();
		//모델에 저장
		model.addAttribute("cmncdList",cmncdList);
		
		return "cnpt/detail";
	}
	
	
	//거래처 등록페이지 
	@RequestMapping("/insert")
	public String insert(Model model) {
		
		//공통코드 불러오기 
		List<CmncdVO> cmncdList = cnptService.selectCmncdList();
		//모델에 저장
		model.addAttribute("cmncdList",cmncdList);
		
		return "cnpt/insert";
	}
	
	//거래처 등록하기
	@ResponseBody
	@PostMapping("/insert")
	public int insertPost(@ModelAttribute CnptVO cnptVO) {
		logger.info("insert에서 가져온 CnptVO : " + cnptVO.toString());
		int result = this.cnptService.cnptInsert(cnptVO);
		
		return result;
//		//정상적으로 등록
//		if(result > 0) {
//			//forward
//			return "cnpt/insert";
//		}else { //등록 실패
//			
//			return "redirect:cnpt/insert";
//		}
	}
	
	//거래처 수정 - 기본정보
	@ResponseBody
	@PostMapping("/updateBasic")
	public int updateBasic(@ModelAttribute CnptVO cnptVO) {
		logger.info("BASIC cnptVO!!!! : " + cnptVO.toString());
		int result = cnptService.updateBasic(cnptVO);
		
		return result;
		
	}
	
	//거래처 수정 - 계좌정보
	@ResponseBody
	@PostMapping("/updateAct")
	public int updateAct(@ModelAttribute CnptVO cnptVO) {
		logger.info("ACT cnptVO!!!! : " + cnptVO.toString());
		int result = cnptService.updateAct(cnptVO);
		
		return result;

	}
	
	//거래처 수정 - 담당자 정보
	@ResponseBody
	@PostMapping("/updateCharger")
	public int updateCharger(@ModelAttribute CnptVO cnptVO) {
		logger.info("CHARGER cnptVO!!!! : " + cnptVO.toString());
		int result = cnptService.updateCharger(cnptVO);
		
		return result;
	}
	
	
	//거래처 거래여부 'N'으로 변경
	@RequestMapping("/cnptToN")
	public String cnptToN(@RequestParam String cnptId) {
		int result = this.cnptService.cnptToN(cnptId);
		
		if(result > 0) {
			//거래처 목록 페이지로 돌아감
			//forward
			return "cnpt/list";
		}else { //삭제 실패
			return "redirect:cnpt/list";
		}
	}
	
	//거래처 거래여부 'Y'로 변경
	@RequestMapping("/cnptToY")
	public String cnptToY(@RequestParam String cnptId) {
		int result = this.cnptService.cnptToY(cnptId);
		
		if(result > 0) {
			//거래처 목록 페이지로 돌아감
			//forward
			return "cnpt/list";
		}else { //삭제 실패
			return "redirect:cnpt/list";
		}
	}
	
}






