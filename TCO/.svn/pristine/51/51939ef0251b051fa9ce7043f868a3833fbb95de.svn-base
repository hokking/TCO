package kr.or.tco.strgstck.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.tco.brnc.vo.BrncVO;
import kr.or.tco.cnpt.service.CnptService;
import kr.or.tco.cnpt.vo.CnptVO;
import kr.or.tco.ordr.service.OrdrService;
import kr.or.tco.ordr.vo.OrdrVO;
import kr.or.tco.prchs.service.PrchsService;
import kr.or.tco.prchs.vo.PrchsVO;
import kr.or.tco.prchsgds.vo.PrchsGdsVO;
import kr.or.tco.prod.service.ProdService;
import kr.or.tco.prod.vo.ProdVO;
import kr.or.tco.store.service.StoreService;
import kr.or.tco.store.vo.StoreVO;
import kr.or.tco.strgstck.service.StrgstckService;
import kr.or.tco.strgstck.vo.StrgstckVO;

@RequestMapping("/strgstck")
@Controller
public class StrgstckController {
	private static final Logger logger = LoggerFactory.getLogger(StrgstckController.class);
	
	@Autowired
	StrgstckService strgstckService;
	
	@Autowired
	OrdrService ordrService;
	
	@Autowired
	ProdService prodService;
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	CnptService cnptService;
	
	@Autowired
	PrchsService prchsService;
	
	//수주 목록 뽑기
	@GetMapping("/rcvordr")
	public String rcvordrList(Model model) {
		//수주Y 리스트
		List<OrdrVO> listY = this.ordrService.rcvOrdrYList();
		//수주N 리스트
		List<OrdrVO> listX = this.ordrService.rcvOrdrNList();
		//본사 제외 지점 가져오기
		List<BrncVO> brnList = this.prodService.brncList();

		//둘 다 model에 담아서 보내기
		model.addAttribute("Y", listY);
		model.addAttribute("N", listX);
		model.addAttribute("brnc", brnList);
		
		return "strgstck/rcvordr";
	}
	
	//지점이 발주한 내역 상세
	@GetMapping("/ordrDetail")
	public String detail(int ordrId, Model model) {
		logger.info("detail ordrId : " + ordrId);
		
		List<OrdrVO> ordrVO = this.ordrService.ordrDetail(ordrId);
		logger.info("ordrVO : " + ordrVO);
		
		//발주지점 이름 가져오기
		String name = this.ordrService.brnofcNm(ordrVO.get(0).getBrncofcId());
		logger.info("발주지점 이름 : " + name);
		
		//주문의 가격 합계 뽑기
		int sum = 0;
		for(OrdrVO ordr : ordrVO) {
			sum += ordr.getOrdrQty() * ordr.getProdInfoPrchsAmt();
		}
		logger.info("금액 합계 : " + sum);
		
		//수주Y 리스트
		List<OrdrVO> listY = this.ordrService.rcvOrdrYList();
		int cnt = 0;
		for(OrdrVO vo : listY) {
			if(vo.getOrdrId() == ordrId) {
				cnt ++;
				break;
			}
		}
		
		//수주됐는지 확인용 cnt 넘기기
		model.addAttribute("yn", cnt);
		//ordrId 에 들어갈 모든 내역
		model.addAttribute("ordrVO", ordrVO);
		//발주번호만 따로 넘기기
		model.addAttribute("num", ordrId);
		//발주지점 이름 넘기기
		model.addAttribute("name", name);
		//발주일 넘기기
		model.addAttribute("date", ordrVO.get(0).getOrdrDt());
		//금액 합계 넘기기
		model.addAttribute("sum", sum);
		
		return "strgstck/detail";
	}
	
	//수주버튼 눌렀을때
	@ResponseBody
	@PostMapping("/send.do")
	public int send(int ordrId) {
		logger.info("ordrId : " + ordrId);
		
		//메서드에서 처리해야 할 일이 다 되었는지 확인하기 위한 count
		int count = 0;
		
		//ordrId에 맞는 ordr 내역 다 가져오기
		List<OrdrVO> ordrVO = this.ordrService.ordrDetail(ordrId);
		
		//현재고 확인해서 map에 넣기
		Map<String, Object> nowStck = new HashMap<String, Object>();
		for(OrdrVO ordr : ordrVO) {
			nowStck.put(ordr.getProdInfoId(), strgstckService.nowStck(ordr.getProdInfoId()));
		}
		logger.info("현 재고 : " + nowStck.toString());
		
		//본사의 창고 재고 update
		//현재고랑 주문수량이랑 상품아이디를 map에 넣은 후에 update 진행해야함.
		//발주 내역이 여러개이기때문에 for문으로 돌리기. map은 반복문 안에서 초기화
		Map<String, Object> updateMap = null;
		//업데이트된 행 확인용 count
		int updateCount = 0;
		//주문수량이 재고보다 많은지 체크하는 count
		int check = 0;
		for(OrdrVO ordr : ordrVO) {
			updateMap = new HashMap<String, Object>();
			//상품아이디 넣기
			updateMap.put("prodInfoId", ordr.getProdInfoId());
			//주문수량 넣기
			updateMap.put("ordrQty", ordr.getOrdrQty());
			//map에서 현재고 뽑기
			int stckk = Integer.parseInt( String.valueOf(nowStck.get(ordr.getProdInfoId())));
			//현재고 넣기
			updateMap.put("strgStckQty", stckk);
			
			logger.info("update용 Map : " + updateMap.toString());
			
			//재고 - 주문수량 > 0 인지 확인하기
			if(stckk < ordr.getOrdrQty()) {
				check++;
			}
			
			int updateResult = this.strgstckService.stckUpdate(updateMap);
			
			if(updateResult > 0) {
				updateCount++;
			}
		}
		if(check > 0) {
			return 100;
		}
		if(ordrVO.size() == updateCount) {
			logger.info("모든 내역 update 성공");
			count++;
		}else {
			logger.info("실패한 내역 있음");
			return 10;
		}
		
		//본사의 창고 출고 insert
		//창고 출고 테이블에 사용할 map 만들기. 초기화는 for문 안에서
		Map<String, Object> insertMap = null;
		//insert 결과 확인용 count
		int insertCount = 0;
		for(OrdrVO ordr : ordrVO) {
			insertMap = new HashMap<String, Object>();
			//상품아이디 넣기
			insertMap.put("prodInfoId", ordr.getProdInfoId());
			//주문수량(출고수량) 넣기
			insertMap.put("strgShmtQty", ordr.getOrdrQty());
			//발주한 지점 아이디 넣기
			insertMap.put("brncofcId", "BRN00000");
			//발주한 지점 아이디 넣기
			insertMap.put("brncofcIdWr", ordr.getBrncofcId());
			
			logger.info("insert용 Map : " + insertMap.toString());
			
			int insertResult = this.strgstckService.shipStrg(insertMap);
			
			if(insertResult > 0) {
				insertCount++;
			}
		}
		if(ordrVO.size() == insertCount) {
			logger.info("모든 내역 insert 성공");
			count++;
		}else {
			logger.info("실패한 내역 있음");
			return 20;
		}
		
		//ordrId에 따라 수주여부 전부 Y로 바꾸기
		int Yresult = this.ordrService.rcvNtoY(ordrId);
		if(ordrVO.size() == Yresult) {
			count++;
		}else {
			return 30;
		}
		return count;
	}
	
	//본사의 창고 출고 목록 뽑기
	@GetMapping("/headShipList")
	public String shipList(Model model) {
		//모든 출고 내역
		List<StrgstckVO> list = this.strgstckService.headShipList();
		//본사 제외 지점 가져오기
		List<BrncVO> brnList = this.prodService.brncList();
		
		logger.info("출고수량 : " + list.get(0).getStrgShmtQty());
		model.addAttribute("list", list);
		model.addAttribute("brnc", brnList);
		
		return "strgstck/headShipList";
	}
	
	//지점의 출고 목록 뽑기
	@GetMapping("/branchShipList")
	public String branchList(Model model, String brncofcId) {
		//지점의 창고출고내역
		List<StrgstckVO> list = this.strgstckService.branchShipList(brncofcId);
		//지점의 매장출고내역
		List<StoreVO> storeList = this.storeService.storeShipList(brncofcId);
		//지점 이름 가져오기
		String brnNm = this.ordrService.brnofcNm(brncofcId);
		model.addAttribute("name", brnNm);
		model.addAttribute("id", brncofcId);
		model.addAttribute("storeList", storeList);
		model.addAttribute("list", list);
		return "strgstck/branchShipList";
	}
	
	
	// 상세 재고 현황
	@GetMapping("/detailstock")
	public String detailstock(Model model, @RequestParam(defaultValue="BRN00000", value="brncofcId", required = false) String brncofcId,
								@RequestParam(required=false) String keyWord, @RequestParam Map<String,Object> map) {
		
		map.put("keyword", keyWord);
		map.put("brncofcId", brncofcId);
		
		// 상세 리스트
		List<StrgstckVO> list = strgstckService.detailstock(map);
		
		
		// 리스트 view로 보낸다
		model.addAttribute("list", list);
		
		return "strgstck/detailstock";
	}
	
	//본사의 부족재고현황
	@GetMapping("/headLack")
	public String headLack() {
		return "strgstck/headLack";
	}
	
	//부족재고 테이블 뽑기
	@ResponseBody
	@PostMapping("/newHeadLack.do")
	public List<StrgstckVO> newHeadLack(){
		//안전재고 밑인 상품의 발주여부를 N으로 바꾸기
		int result = this.strgstckService.underSafty("BRN00000");
		logger.info("N으로 변한 행 수 : " + result);
		//본사의 창고재고 현황뽑기
		List<StrgstckVO> list = this.strgstckService.strgLackList("BRN00000");
		return list;
	}
	
	//발주버튼 클릭시
	@ResponseBody
	@GetMapping("/order.do")
	public int order(HttpServletRequest request, @RequestParam(required=false) String prodId) throws Exception {
		logger.info("넘어왔냐");
		//GSON 객체 선언
		Gson gson = new Gson();
		//GSON으로 id를 List로 만들어주기(체크된 상품 아이디가 들은 List)
		List<String> idList = gson.fromJson(prodId, List.class);
		logger.info(idList.toString());
		
		ProdVO prod = this.prodService.prodDetail(idList.get(0));
		
		//이번에 발주할 물품의 거래처 개수를 찾기
		//거래처 집어넣을 List
		List<String> allCnptList = new ArrayList<String>();
		//모든 거래처를 집어넣는다.
		for(int i = 0; i < idList.size(); i++) {
			allCnptList.add(prodService.prodDetail(idList.get(i)).getCnptId());
		}
		
		//중복제거된 List
		List<String> cnptList = new ArrayList<String>();
		for(String cnpt : allCnptList) {
			if(!cnptList.contains(cnpt)){
				cnptList.add(cnpt);
			}
		}
		logger.info("중복제거된 List : " + cnptList.toString());
		
		PrchsVO prchs;
		PrchsGdsVO gds;
		//gds넣을 List
		List<PrchsGdsVO> gdsList = new ArrayList<PrchsGdsVO>();
		//매입총액용 
		int sum = 0;
		//결과용
		int insertResult = 0;
		//업데이트 확인용
		int updateResult = 0;
		//수량 찾기 위한 Map
		Map<String, Object> idMap = new HashMap<String, Object>();
		idMap.put("brncofcId", "BRN00000");
		
		//거래처 개수만큼 prchs 생성
		for(int i = 0; i < cnptList.size(); i++) {
			gdsList = new ArrayList<PrchsGdsVO>();
			logger.info("for문 들어왔는지 확인");
			prchs = new PrchsVO();
			sum = 0;
			//cnpt값과 같을때만 prchsGdsVO 만들어서 넣기
			for(int j = 0; j < idList.size(); j++) {
				logger.info(i + "번째 idList안 : " + cnptList.get(i));
				logger.info(i + "번째 idList안 : " + prodService.prodDetail(idList.get(j)).getCnptId());
				if(cnptList.get(i).equals(prodService.prodDetail(idList.get(j)).getCnptId())) {
					logger.info(i + "번째 if문 들어왔는지 확인");
					
					gds = new PrchsGdsVO();
					//상품아이디 넣기
					idMap.put("prodInfoId", idList.get(j));
					//발주여부 Y로 수정 및 발주하기
					updateResult += this.strgstckService.lackUpdateHead(idMap);
					//발주수량 찾기
					int qty = strgstckService.ordrQtyStrg(idMap);
					//매입가격 찾기
					int price = prodService.prodDetail(idList.get(j)).getProdInfoPrchsAmt();
					
					//VO에 세팅하기
					gds.setProdInfoId(idList.get(j));
					gds.setPrchsGdsQty(qty);
					gds.setPrchsGdsAmt(price);
					
					sum += qty * price;
					logger.info("qty : "+qty);
					logger.info("price : "+price);
					logger.info("sum : "+sum);
					gdsList.add(gds);
				}
			}
			
			prchs.setCnptId(cnptList.get(i));
			prchs.setPrchsAmt(sum);
			prchs.setPrchsGdsVO(gdsList);
			
			insertResult += prchsService.orderLack(prchs);
		}
		
		int result = 0;
		
		logger.info("updateResult : " + updateResult + " / insertResult : " + insertResult);
		
		if(insertResult == idList.size()) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}
	
	//본사 창고 입고목록
	@GetMapping("/headWare")
	public String headWare(Model model, @RequestParam(required=false) String keyWord) {
		//거래처 목록(필터용)
		List<CnptVO> cnptList = this.cnptService.cnptList(keyWord);
		
		//창고입고 목록
		List<StrgstckVO> wrList = this.strgstckService.branchWrHouseList("BRN00000");
		
		model.addAttribute("list", wrList);
		model.addAttribute("cnpt", cnptList);
		
		return "strgstck/headWare";
	}
}