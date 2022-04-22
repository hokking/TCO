package kr.or.tco.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.tco.alam.service.AlamService;
import kr.or.tco.alam.vo.AlamVO;
import kr.or.tco.att.service.impl.AttService;
import kr.or.tco.att.vo.WorksttsVO;
import kr.or.tco.cmncd.vo.CmncdVO;
import kr.or.tco.emp.vo.EmpVO;
import kr.or.tco.notice.service.NoticeService;
import kr.or.tco.notice.vo.BrdVO;
import kr.or.tco.ordr.service.OrdrService;
import kr.or.tco.ordr.vo.OrdrVO;
import kr.or.tco.sig.service.SigService;
import kr.or.tco.sig.vo.SigVO;
import kr.or.tco.strgstck.service.StrgstckService;
import kr.or.tco.strgstck.vo.StrgstckVO;

@RequestMapping("/main")
@Controller
public class MainController {
	
	private static final Logger logger =
			LoggerFactory.getLogger(MainController.class);

	@Autowired
	StrgstckService strgstckService;
	
	@Autowired
	OrdrService ordrService;
	
	@Autowired 
	AlamService AlamService;
	
	@Autowired
	AttService attService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	SigService sigservice;
	
	@GetMapping("/mainlist")
	public String main(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String brncofcId = (String) session.getAttribute("brncofcId");
		String receiverId = (String) session.getAttribute("userID");
		
		EmpVO empVO = attService.binfoselect(receiverId);
		CmncdVO cmncdVO = attService.sdselect(empVO.getCmncdCd());
		empVO.setOpt(cmncdVO.getCmncdGuNm());
		empVO.setDptopt(cmncdVO.getCmncdNm1());
		empVO.setLelopt(cmncdVO.getCmncdNm2());
		
		model.addAttribute("empVO", empVO);
		
		List<StrgstckVO> strg ;
		System.out.println("brncofcId : " + brncofcId);
		
		if(brncofcId == "BRN00000") {
			System.out.println("본사");
			//본사의 창고재고 현황뽑기
			strg = this.strgstckService.strgLackList("BRN00000");
		}else {
			System.out.println("지점");
			//지점의 창고재고 현황뽑기
			strg = this.strgstckService.strgLackList(brncofcId);
		}

		//수주N 리스트
		List<OrdrVO> ordr = this.ordrService.rcvOrdrNList();

		model.addAttribute("strg", strg);
		model.addAttribute("ordr", ordr);
		
		
		//알림리스트
		List<AlamVO>alamlist = this.AlamService.alamAll(receiverId);
		logger.info("알람리스트: "+alamlist);
		model.addAttribute("alam", alamlist);
		
		
		//공지사항
		List<BrdVO>noticelist = this.noticeService.mainnotice();
		logger.info("메인공지: "+noticelist);
		model.addAttribute("noticeVO", noticelist);
		
		//지점의 공지사항
		List<SigVO>siglist=this.sigservice.signotice();
		logger.info("시그리스트:"+siglist);
		model.addAttribute("signoticeVO", siglist);
		
		//출퇴근시간
		WorksttsVO worksttsVO = new WorksttsVO();
		String gotime = attService.gotime(receiverId);
		String outtime = attService.outtime(receiverId);
		
		// 출퇴근 둘다 x
		if (gotime == null && outtime == null) {
			worksttsVO.setWorksttsBgngTm("미등록");
			worksttsVO.setWorksttsEndTm("미등록");
			// 출근만했을때
		} else if (gotime != null && outtime == null) {
			worksttsVO.setWorksttsBgngTm(gotime);
			worksttsVO.setWorksttsEndTm("미등록");
			// 출퇴근 둘다o
		} else {
			worksttsVO.setWorksttsBgngTm(gotime);
			worksttsVO.setWorksttsEndTm(outtime);
		}
		int sumtm = attService.sumtm2(receiverId);

		worksttsVO.setSumtm(sumtm);
		model.addAttribute("worksttsVO", worksttsVO);
				
		return "main/mainlist";
	}
	
	
	
	
	
}
