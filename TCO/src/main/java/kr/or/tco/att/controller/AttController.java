package kr.or.tco.att.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.tco.att.service.impl.AttService;
import kr.or.tco.att.vo.WorksttsVO;
import kr.or.tco.cmncd.vo.CmncdVO;
import kr.or.tco.emp.service.impl.EmpService;
import kr.or.tco.emp.vo.EmpVO;
import oracle.jdbc.proxy.annotation.Post;

@RequestMapping("/att")
@Controller
public class AttController {

	@Autowired
	AttService attService;

	@Autowired
	EmpService empService;

	private static final Logger logger = LoggerFactory.getLogger(AttController.class);

	@GetMapping("/attlist")
	public String attlist(Model model, @RequestParam(defaultValue = "0", value = "num", required = false) int num) {
		List<WorksttsVO> list = attService.thisweekall(num);

		Map<String, Object> map = new HashMap<String, Object>();

		for (WorksttsVO worksttsVO : list) {

			map.put("empId", worksttsVO.getEmpId());
			map.put("num", num);

			logger.info("map: " + map.toString());

			logger.info("id: " + worksttsVO.getEmpId());
			int sumtm = attService.sumtm2(worksttsVO.getEmpId());
			logger.info("sumtm: " + sumtm);
			worksttsVO.setSumtm(sumtm);

		}
		logger.info("?????????????????????" + list);

		logger.info("??????????????????: " + list.size());
		logger.info("list.get(0).empNm" + list.get(0).getEmpNm());
		logger.info("list.get(1).empNm" + list.get(1).getEmpNm());
		model.addAttribute("list", list);

		return "att/attlist";
	}

	@PostMapping("/attlist")
	public String pattlist(Model model, @RequestParam(defaultValue = "0", value = "num", required = false) int num) {
		List<WorksttsVO> list = attService.thisweekall(num);

		Map<String, Object> map = new HashMap<String, Object>();

		for (WorksttsVO worksttsVO : list) {
			if (worksttsVO.getEmpId() != null) {

				map.put("empId", worksttsVO.getEmpId());
				map.put("num", num);

				logger.info("postmap: " + map.toString());

				logger.info("idp: " + worksttsVO.getEmpId());

				Integer sum2 = attService.sumtm(map);
				if (sum2 == null) {
					sum2 = 0;
				}
				worksttsVO.setSumtm(sum2);
				logger.info("post sum2: " + sum2);

			} else {
				break;
			}
		}
		logger.info("?????????????????????" + list);

		logger.info("??????????????????: " + list.size());
		model.addAttribute("list", list);
		// model.addAttribute("num" , num);
		return "ajax/att/ajax_attlist";
	}

	@GetMapping("/attdetail")
	public String attdetail(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		// getAttribute??? ???????????? object
		String userId = String.valueOf(session.getAttribute("userID"));
		logger.info("userid???:" + userId);

		EmpVO empVO = attService.binfoselect(userId);
		CmncdVO cmncdVO = attService.sdselect(empVO.getCmncdCd());
		empVO.setOpt(cmncdVO.getCmncdGuNm());
		empVO.setDptopt(cmncdVO.getCmncdNm1());
		empVO.setLelopt(cmncdVO.getCmncdNm2());

		WorksttsVO worksttsVO = new WorksttsVO();
		String gotime = attService.gotime(userId);
		String outtime = attService.outtime(userId);

		// ????????? ?????? x
		if (gotime == null && outtime == null) {
			worksttsVO.setWorksttsBgngTm("?????????");
			worksttsVO.setWorksttsEndTm("?????????");
			// ??????????????????
		} else if (gotime != null && outtime == null) {
			worksttsVO.setWorksttsBgngTm(gotime);
			worksttsVO.setWorksttsEndTm("?????????");
			// ????????? ??????o
		} else {
			worksttsVO.setWorksttsBgngTm(gotime);
			worksttsVO.setWorksttsEndTm(outtime);
		}

		model.addAttribute("empVO", empVO);

		// ????????? ????????????
		int sumtm = attService.sumtm2(userId);

		worksttsVO.setSumtm(sumtm);

		// ???????????? view??? ???????????? model??? ???????????? ^.^
		logger.info("???????????????????: " + worksttsVO.toString());
		model.addAttribute("worksttsVO", worksttsVO);

		// ????????? ??????????????????, ???????????? ?????????
		List<WorksttsVO> list = attService.thisweek(userId);
		logger.info("?????????: " + list);
		logger.info("?????????" + list.get(0).getWorksttsTm());
		model.addAttribute("list", list);
		return "att/attdetail";
	}

	DateTimeFormatter dayf = DateTimeFormatter.ofPattern("yy-MM-dd");
	DateTimeFormatter timef = DateTimeFormatter.ofPattern("HH:mm:ss");
	LocalDateTime now = LocalDateTime.now();

	// ??????
	@ResponseBody
	@PostMapping("/attin")
	public int attin(HttpServletRequest request, Model model) throws ParseException {
		HttpSession session = request.getSession(false);
		String userId = String.valueOf(session.getAttribute("userID"));
		String time = now.format(timef);

		logger.info("??????: " + now);
		logger.info("??????: " + time);

		int ck = attService.checkIselect(userId);

		logger.info("ck" + ck);

		if (ck <= 0) {
			WorksttsVO worksttsVO = new WorksttsVO();
			worksttsVO.setWorksttsBgngTm(time);
			worksttsVO.setEmpId(userId);

			logger.info("vo: " + worksttsVO);
			int result = attService.ininsert(worksttsVO);

			// ???????????? update
			worksttsVO.setWorksttsCk("?????????");
			attService.workck(worksttsVO);

			// ????????????
			int st = attService.st(userId);
			// ?????? ???
			int stm = attService.stm(userId);
			// ?????? ????????????
			int stck = attService.stck(userId);
			// ??????update
			if (st >= stck && stm > 0) {
				worksttsVO.setCmncdCd("A503");
				int cd = attService.cdupdate(worksttsVO);
			} else {
				worksttsVO.setCmncdCd("A501");
				int cd = attService.cdupdate(worksttsVO);
			}

			logger.info("??????????????? ????????????: " + worksttsVO.toString());

			return result;
		} else {
			return 0;
		}
	}

	// ??????
	@ResponseBody
	@PostMapping("/attout")
	public int attout(HttpServletRequest request, Model model) throws ParseException {
		HttpSession session = request.getSession(false);
		String userId = String.valueOf(session.getAttribute("userID"));

		// ????????????
		int ck1 = attService.checkOselect(userId);
		// ????????????
		int ck2 = attService.checkIselect(userId);

		// ?????? 0 ?????? ?????? 1?????? => ??????
		if (ck1 <= 0 && ck2 > 0) {
			WorksttsVO worksttsVO = new WorksttsVO();
			worksttsVO.setEmpId(userId);

			logger.info("OUTvo: " + worksttsVO);

			int result = attService.outinsert(userId);

			// ???????????? update
			worksttsVO.setWorksttsCk("????????????");
			attService.workck(worksttsVO);

			// ???????????? INSERT
			// ?????? ???????????? ??????
			int enbgck = attService.CKenbgselect(userId);

			int result2;

			worksttsVO.setWorksttsTm(enbgck);
			result2 = attService.enbgupdate(worksttsVO);

			// ???????????? UPDATE
			// ????????????
			int end = attService.end(userId);
			// ?????? ????????????
			int endck = attService.endck(userId);

			if (end <= endck) {
				worksttsVO.setCmncdCd("A504");
				int cd = attService.cdupdate(worksttsVO);
			}
			// model.addAttribute("worksttsVO", worksttsVO);
			// logger.info("??????????????? ????????????: "+ worksttsVO.toString());
			return result2;

			// ?????? 0?????? ??????0?????? => ???????????????
		} else if (ck1 <= 0 && ck2 <= 0) {
			return 2;
			// ?????? 1?????? ??????1??????=> ????????????
		} else if (ck1 > 0 && ck2 > 0) {
			return 3;
		} else {
			return 4;
		}

	}

	// ?????? ?????? ?????????
	@GetMapping("/attcheck")
	public String attcheck(Model model) {
		List<EmpVO> list = attService.attchecklist();
		logger.info("attchecklist"+ list.toString());
		
		  for(EmpVO empVO : list) { 
			  
		logger.info("empVO"+ empVO);
	      CmncdVO cmncdVO = new CmncdVO(); 
	      cmncdVO = empService.sdselect(empVO.getCmncdCd());
		  
			
	      logger.info("???????????????? "+ empVO.getCmncdCdd());
			String CmncdCdd =  empVO.getCmncdCdd();
	      if(CmncdCdd!=null) {
	    	  
	    	  empVO.setCmncdCdd(attService.sdselect2(CmncdCdd)); 
	      }else {
	    	  empVO.setCmncdCdd(""); 
	      }
			 
		  
		  logger.info("??????"+cmncdVO.toString());
		  
		  empVO.setOpt(cmncdVO.getCmncdGuNm()); 
		  empVO.setDptopt(cmncdVO.getCmncdNm1());
		  empVO.setLelopt(cmncdVO.getCmncdNm2());
		  
		  
		  }
		 
		
		model.addAttribute("list", list);
		logger.info("???????????????: " + list);
		return "att/attcheck";
	}

	@Scheduled(cron = "0 0 6 ? * 3")
	public void test() {

		// ?????????????????? ???????????? 5?????? ?????? insert
		int teminsert = attService.teminsert();
		// ????????? ???????????? insert
		int reinsert = attService.reinsert();
		// ???????????? update
		int reupdate = attService.reupdate();

		logger.info("teminsert:" + teminsert + "reinsert:" + reinsert);
		System.out.println("cron ????????? : 5?????? 1?????? console ??????");

	}

}
