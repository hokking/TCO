package kr.or.tco.prod.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.scenario.effect.Blend.Mode;

import kr.or.tco.brnc.vo.BrncVO;
import kr.or.tco.cmncd.vo.CmncdVO;
import kr.or.tco.cnpt.controller.CnptController;
import kr.or.tco.cnpt.service.CnptService;
import kr.or.tco.cnpt.vo.CnptVO;
import kr.or.tco.prod.service.ProdService;
import kr.or.tco.prod.vo.ProdVO;
import kr.or.tco.strgstck.service.StrgstckService;
import kr.or.tco.strgstck.vo.StrgstckVO;

@RequestMapping("/prod")
@Controller
public class ProdController {
	private static final Logger logger = LoggerFactory.getLogger(ProdController.class);
	
	@Autowired
	ProdService prodService;
	
	@Autowired
	CnptService cnptService;
	
	@Autowired
	StrgstckService strgstckService;
	
	//상품 목록
	@GetMapping("/list")
	public String prodList(Model model, @RequestParam(required=false) String keyWord) {
		logger.info("keyWord : " + keyWord);
		
		//mapper에 상품목록 뽑는 파라미터인 hashMap 생성
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyWord", keyWord);
		
		List<ProdVO> prodList = this.prodService.prodList(map);
		
		model.addAttribute("prodList", prodList);
		
		//forwarding
		return "prod/list";
	}
	
	//상품 상세
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam("prodInfoId") String prodInfoId) {
		
		ProdVO prodVO = prodService.prodDetail(prodInfoId);
		logger.info("prodVO : " + prodVO);
		
		List<CmncdVO> cmncd2List = prodService.cdnm2List(prodInfoId);
		logger.info("cmncd2List : " + cmncd2List);
		
		model.addAttribute("prodVO", prodVO);
		model.addAttribute("cmncd2List", cmncd2List);
		
		//forwarding
		return "prod/detail";
	}
	
	//상품 정보 수정
	@PostMapping("/detail")
	public String detailPost(@Validated ProdVO prodVO, BindingResult result) {
		logger.info("post 수정 시작");
		logger.info("Controller prodVO : " + prodVO);
		//BindingResult에 검증 오류 발생
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors = result.getFieldErrors();
			//validation 중에 어떤 오류가 나왔는지 확인..
			for(int i=0;i<allErrors.size();i++) {
				ObjectError objectError = allErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			
			for(ObjectError objectError : globalErrors) {
				logger.info("objectError : " + objectError);
			}
			
			for(FieldError fieldError : fieldErrors) {
				logger.info("fieldError : " + fieldError.getDefaultMessage());
			}
			//redirect(X) => 데이터를 보낼 수 없음
			//forwarding
			return "prod/detail";
		}
		
		//상품명의 공백에 언더바 처리하기
		prodVO.setProdInfoNmDisplay(prodVO.getProdInfoNmDisplay());
		//상품가격의 컴마 공백 처리하기
		prodVO.setProdInfoNtslAmtDisplay(prodVO.getProdInfoNtslAmtDisplay());
		prodVO.setProdInfoPrchsAmtDisplay(prodVO.getProdInfoPrchsAmtDisplay());
		
		//공통코드 찾아서 넣기(안바뀌었어도 null은 안되기때문에 필수)
		String cmncd = prodService.cmncdFind(prodVO.getCmncdNm2());
		logger.info("공통코드 : " + cmncd);
		prodVO.setCmncdCd(cmncd);
		logger.info("공통코드 set한 후 prodVO : " + prodVO);
		
		//수정 처리
		int updateResult = prodService.prodUpdate(prodVO);
		
		if(updateResult > 0) { //수정 성공
			return "redirect:/prod/detail?prodInSfoId="+prodVO.getProdInfoId();
		}else { //수정 실패
			//forwarding
			return "prod/detail";
		}
	}
	
	//상품 삭제(여부를 N으로)
	@ResponseBody
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public int prodDelete(String prodInfoId) {
		logger.info("delete prodInfoId : " + prodInfoId);
		
		int deleteResult = prodService.prodDelete(prodInfoId);
		logger.info("deleteResult : " + deleteResult);
		
		if(deleteResult > 0) {
			logger.info("상품 정보 테이블에서 여부 N으로 바꾸기 성공");
			int strgResult = strgstckService.strgTcoDelete(prodInfoId);
			if(strgResult > 0) {
				logger.info("창고 재고 테이블에서 본사만 삭제 성공");
			}else {
				return 0;
			}
		}
		return deleteResult;
	}
	
	//상품등록페이지로 이동
	@GetMapping("/insert")
	public String prodInsert(ProdVO prodVO,Model model,@RequestParam(required=false) String keyWord) {
		//거래처 목록
		List<CnptVO> cnptList = this.cnptService.cnptList(keyWord);
		
		model.addAttribute("cnptList", cnptList);
		
		return "prod/insert";
	}
	
	//상품등록 과정
	@ResponseBody
	@GetMapping("/insert.do")
	public int insertPost(ProdVO prodVO, BindingResult result) {
		logger.info("insert Controller prodVO : " + prodVO);
		//BindingResult에 검증 오류 발생
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors = result.getFieldErrors();
			//validation 중에 어떤 오류가 나왔는지 확인..
			for(int i=0;i<allErrors.size();i++) {
				ObjectError objectError = allErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			
			for(ObjectError objectError : globalErrors) {
				logger.info("objectError : " + objectError);
			}
			
			for(FieldError fieldError : fieldErrors) {
				logger.info("fieldError : " + fieldError.getDefaultMessage());
			}
			//redirect(X) => 데이터를 보낼 수 없음
			//forwarding
			return 0;
		}
		
		//상품명의 공백에 언더바 처리하기
		prodVO.setProdInfoNmDisplay(prodVO.getProdInfoNmDisplay());
		//상품가격의 컴마 공백 처리하기
		prodVO.setProdInfoNtslAmtDisplay(prodVO.getProdInfoNtslAmtDisplay());
		prodVO.setProdInfoPrchsAmtDisplay(prodVO.getProdInfoPrchsAmtDisplay());
		logger.info("형식 처리 후 prodVO : " + prodVO);
		
		//선택한 상품분류로 공통코드 찾기
		String cmncd = this.prodService.cmncdFind(prodVO.getCmncdNm2());
		prodVO.setCmncdCd(cmncd);
		logger.info("공통코드 : " + cmncd);
		logger.info("공통코드 넣은 후 prodVO : " + prodVO);
		
		//선택한 거래처로 거래처아이디 찾기
		String cnptId = this.prodService.cnptCd(prodVO.getCnptNm());
		logger.info("거래처 아이디 : " + cnptId);
		prodVO.setCnptId(cnptId);
		logger.info("거래처 넣은 후 prodVO : " + prodVO);
		
		//상품 정보 테이블에 등록 처리
		int insertResult = this.prodService.prodInsert(prodVO);
		logger.info("insertResult : " + insertResult);
		
		if(insertResult > 0) { //등록 성공
			logger.info("상품 등록 성공");
			
			//창고 재고 테이블에 넣을 VO 만들기
			StrgstckVO strgstckVO = new StrgstckVO();
			strgstckVO.setStrgStckDfltQty(Integer.parseInt(prodVO.getStrgStckDfltQty()));
			strgstckVO.setStrgStckSftyQty(Integer.parseInt(prodVO.getStrgStckSftyQty()));
			logger.info("strgstckVO : " + strgstckVO);
			
			//창고 재고 테이블에 본사 insert 처리
			int ofcInsert = this.strgstckService.strgTcoInsert(strgstckVO);
			
			if(ofcInsert > 0) {
				logger.info("창고 재고 테이블 본사 insert 성공");
			}else {
				logger.info("창고 재고 테이블 본사 insert 성공");
				return 0;
			}
			
			//창고 재고 테이블에 넣을 지점 목록 가져오기
			List<BrncVO> brncList = this.prodService.brncList();
			logger.info("brncList : " + brncList);
			int count = 0; //지점도 제대로 들어갔는지 확인할 count
			for(BrncVO brnc : brncList) {
				int brncRes = this.strgstckService.strgBrncInsert(brnc.getBrncofcId());
				if(brncRes > 0) {
					count++;
				}
			}
			if(brncList.size() == count) {
				logger.info("지점 전부 등록 성공");
			}else {
				return 0;
			}
			
			return insertResult;
			
		}else {
			logger.info("상품 등록 실패");
			return 0;
		}
		
	}
	
	//거래처 목록 불러오기
	@ResponseBody
	@GetMapping("/cnpt.do")
	public List<CnptVO> cnptList(@RequestParam(required=false) String keyWord){
		List<CnptVO> cnptList = this.cnptService.cnptList(keyWord);
		logger.info("거래처 목록 : " + cnptList.get(0));
		return cnptList;
	}
	
}
