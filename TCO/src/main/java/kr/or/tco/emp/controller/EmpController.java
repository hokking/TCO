package kr.or.tco.emp.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;





import kr.or.tco.cmncd.vo.CmncdVO;
import kr.or.tco.emp.ArticlePage;
import kr.or.tco.emp.service.impl.EmpService;
import kr.or.tco.emp.vo.AttachFilesVO;

import kr.or.tco.emp.vo.EmpVO;


@RequestMapping("/emp")
@Controller
public class EmpController {

	@Autowired
	EmpService empService;
	
	@Autowired
	JavaMailSender mailSender;	
	
	private static final Logger logger = 
			LoggerFactory.getLogger(EmpController.class);
	
	@GetMapping("/test")
	public String test() {
		return "emp/test";
	}
	
	@GetMapping("/mypage")
	public String mypage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userID");
		logger.info("^^^^^^^^userid^^^^^^^^ : " + userId);
		EmpVO empVO = new EmpVO();
		empVO.setEmpId(userId);
		
		empVO = empService.empdetail(empVO);
		logger.info("^^^^^^^^????????????!^^^^^^^ : " + empVO.getEmpActno());
		logger.info("^^^^^^^^empvo!^^^^^^^ : " + empVO.toString());
		
		model.addAttribute("empVO", empVO);
		
		return "emp/mypage";
	}
	
	@ResponseBody
	@PostMapping("/infoupdate")
	public int empInfoUpdate(@ModelAttribute EmpVO empVO
			, MultipartFile[] uploadFile) {
		logger.info("********empvo********* : " + empVO.toString());
		int isUpdateSuccess = empService.empInfoUpdate(empVO);
		logger.info("?????????: "+ isUpdateSuccess);

		
		return isUpdateSuccess;
	}
	
	@GetMapping("/empinsert")
	public String getempinsert(Model model) {
	
		model.addAttribute("empVO", new EmpVO());
		return "emp/empinsert";
	}

		
	
	@PostMapping("/empinsert")
	public String postempinsert(EmpVO empVO) {
		
		logger.info("empVo???: "+ empVO);
		
		String cmncdCd = empService.cdselect(empVO);
		logger.info(cmncdCd);
		empVO.setCmncdCd(cmncdCd);
		
		
		//???????????? ?????? 
		MultipartFile[] uploadFile = empVO.getUploadFile();
				
		//?????? ?????? ?????? ??????
		String uploadFolder = 
		"D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\upload";
		
		//???/???/??? ?????? ?????? ??????-------
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("uploadPath : " + uploadPath);
				
		if(uploadPath.exists()==false) {//?????? ????????? ????????? ??????????????????
			uploadPath.mkdirs();			
		}
		//???/???/??? ?????? ?????? ???-------
		
		
		AttachFilesVO vo = new AttachFilesVO();
	
		
		//????????? 3?????? ????????? ????????? 3??? ??????
		for(MultipartFile multipartFile : uploadFile) {
			logger.info("-----------");
			logger.info("????????? : " + multipartFile.getOriginalFilename());
			logger.info("???????????? : " + multipartFile.getSize());
			
			//??? ?????? ?????? ????????? VO 
			
			
			//1) ??????id(??????????????????), ?????????????????????,???????????? ????????? ??????
			
			vo.setAtchfileSz(""+multipartFile.getSize());
			vo.setAtchfileNm( multipartFile.getOriginalFilename());
			
			
			
			//-----------UUID ????????? ?????? ?????? ----------------------------
			//????????? ???????????? ??????????????? ?????? ????????? ????????? ????????? ?????? ???????????? ??????
			UUID uuid = UUID.randomUUID();
			
			String uploadFileName = uuid.toString() + "-" + multipartFile.getOriginalFilename();
			// c:\\upload\\gongu03.jpg?????? ??????
			// ????????? ????????? ??????????????? ?????? uploadFolder -> uploadPath
			// /resources/upload/2022/02/21/asdfsadfsdafsda_test.jpg
			vo.setUploadFileName("/resources/upload/" + getFolder() + "/" + uploadFileName);
			
			empVO.setEmpImg("/resources/upload/" + getFolder() + "/" + uploadFileName);
			
			File saveFile = new File(uploadPath,uploadFileName);
			//-----------UUID ????????? ?????? ??? ----------------------------
			
			try {
				//transferTo() : ??????????????? ?????? ???????????? ???
				multipartFile.transferTo(saveFile);
			
				
				
				
			}catch(Exception e){
				logger.info(e.getMessage());
			}//end catch
		}
		
		
		logger.info("attachFilesVO????!" + vo);
		
		//attach_files ???????????? insert
		empService.insertAttachFiles(vo);
				 
				
		logger.info("empVo???2: "+ empVO);
		int intresult = empService.empinsert(empVO);
		
		if(intresult>0) { //?????? ?????? ??????
			
			// ???????????? ??????
			return "redirect:/emp/emplist";
			
		}else {
			return "emp/empinsert";
		}
	}

	
	@GetMapping("/emplist")
	public String emplist(Model model, @RequestParam(defaultValue="1") int currentPage
			, @RequestParam(required=false) String keyWord
			, @RequestParam(defaultValue="5",required=false) int size, @RequestParam Map<String,Object> map) {	
		
		logger.info("size:?????????" + size);
		map.put("keyWord", keyWord);
		map.put("currentPage", currentPage);
		map.put("size", size);
		  
		logger.info(map.toString());
		//?????? ??????
		List<EmpVO> list = this.empService.emplist(map);
		for(EmpVO empVO : list) {
			CmncdVO cmncdVO = new CmncdVO(); 
			cmncdVO = empService.sdselect(empVO.getCmncdCd());
			
			  String brn = empService.brnselect(empVO.getBrncofcId());
			  logger.info("?????????:"+brn);
			 
				 empVO.setBrncofcNm(brn); 
			 
			empVO.setOpt(cmncdVO.getCmncdGuNm());
			empVO.setDptopt(cmncdVO.getCmncdNm1());
			empVO.setLelopt(cmncdVO.getCmncdNm2());
			logger.info("??????!!!!!!!!!!"+ empVO.toString());
		}
		
		logger.info("list??? ?" + list.toString());
		
		int total = this.empService.selectCount(map);
		model.addAttribute("list", 
				new ArticlePage(total, currentPage, size, 5, list));
		model.addAttribute("total", total);
		
		model.addAttribute("data", list);
		
		//forwarding
		return "emp/emplist";
	}
	
	@GetMapping("/empdetail")
	public String empdetail(Model model, @RequestParam Map<String, Object> map) {
		EmpVO empVO = new EmpVO();
		empVO.setEmpId((String)map.get("empId"));
		logger.info("before" + empVO.toString());
		
			 
		empVO = empService.empdetail(empVO);
		logger.info("??????????????????????"+ empVO.toString());
		
		
		  String brn = empService.brnselect(empVO.getBrncofcId());
		  logger.info("?????????:"+brn); empVO.setBrncofcNm(brn);
		  
		
		CmncdVO cmncdVO = new CmncdVO(); 
		cmncdVO = empService.sdselect(empVO.getCmncdCd());
		
		empVO.setOpt(cmncdVO.getCmncdGuNm());
		empVO.setDptopt(cmncdVO.getCmncdNm1());
		empVO.setLelopt(cmncdVO.getCmncdNm2());
		
		model.addAttribute("data", empVO);
		
		return "emp/empdetail";
	}
	
	//????????? ???????????? ??????
	@GetMapping("/loginpage")
	public String loginpage(Model model) {
		
				return "emp/login/loginpage";
		
	}
	//?????? ?????? ???????????? 
	@GetMapping("/findPass")
	public String findPass(Model model) {
		
		return "emp/login/findPass";
		
	}
	// ????????? ?????? ???????????? 
	@GetMapping("/findId")
	public String findId(Model model) {
		
		return "emp/login/findId";
		
	}
	
	
	@PostMapping("/login")
	public String loginCheck(Model model, HttpServletRequest request, @RequestParam String username,
			@RequestParam String password) {
		HttpSession session = request.getSession();
		logger.info("675756username!!!!!!!!!!!!!!!!!!!! : ");
		logger.info("username!!!!!!!!!!!!!!!!!!!! : " + username);
		logger.info("password!!!!!!!!!!!!!!!!!!!! : " + password);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("password", password);

		EmpVO empVO = new EmpVO();
		empVO.setEmpId(username);
		logger.info("before" + empVO.toString());

		empVO = empService.empdetail(empVO);
		
		String user = empService.loginCheck(map);
		logger.info("user!!!!!!!!!!!!!!!!!!!! : " + user);
		if (user == null) {
			logger.info("??????!!!!!!!!!!!!!!!!!!!!");
			return "redirect:/emp/loginpage";
		} else {
			logger.info("???????????????!!!!!!!!!!!!!!!!!!!!" + empVO.getEmpImg());
			session.setAttribute("userID", username);
			session.setAttribute("userPW", password);
			session.setAttribute("userNM", empVO.getEmpNm());
			session.setAttribute("img", empVO.getEmpImg());
			session.setAttribute("email", empVO.getEmpMail());	//?????????
			session.setAttribute("cmncdCd", empVO.getCmncdCd()); //????????????
			session.setAttribute("brncofcId", empVO.getBrncofcId()); //??????
			session.setAttribute("brncofcNm", empVO.getBrncofcNm()); //?????????
			session.setAttribute("dptopt", empVO.getDptopt()); //??????
			session.setAttribute("lelopt", empVO.getLelopt()); //??????
			
			session.setAttribute("empVO", empVO); // ?????????

//			model.addAttribute("empVO", empVO);

			return "redirect:/main/mainlist";
		}

	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/emp/loginpage";
	}
	
	// ????????? @ResponseBody????????? ajax??? return?????? ????????? !!
	
	// ?????? ???????????????
	@ResponseBody
	@PostMapping("/empTelupdate")
	public int empTelupdate(@ModelAttribute EmpVO empVO) {
		logger.info("emp????????????"+empVO.toString());
		int isUpdateSuccess = empService.empTelupdate(empVO);
		logger.info("?????????: "+ isUpdateSuccess);

		return isUpdateSuccess;
		
	}
	
	// ?????? ????????? ??????
	@ResponseBody
	@PostMapping("/empMailupdate")
	public int empMailupdate(@ModelAttribute EmpVO empVO) {

		int isUpdateSuccess = empService.empMailupdate(empVO);
		logger.info("?????????: "+ isUpdateSuccess);
		
		
		return isUpdateSuccess;
		
	}
	
	// ??????  ???????????? ??????
	@ResponseBody
	@PostMapping("/empPswdupdate")
	public int empPswdupdate(@ModelAttribute EmpVO empVO) {
		logger.info("emp????????????"+empVO.toString());
		int isUpdateSuccess = empService.empPswdupdate(empVO);
		logger.info("?????????: "+ isUpdateSuccess);
		
		
		return isUpdateSuccess;
		
	}
	
	// ??????  ?????? ??????
	@ResponseBody
	@PostMapping("/empSeupdate")
	public int empSeupdate(@ModelAttribute EmpVO empVO) {
		
		int isUpdateSuccess = empService.empSeupdate(empVO);
		logger.info("?????????: "+ isUpdateSuccess);
		
		
		return isUpdateSuccess;
		
	}
	
	//??????????????? ???????????? ????????? ???/???/??? ?????? ????????? ???????????? ??????
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			return str.replace("-", "/");
		}
		
		/* ????????? ?????? */ //???????????? -> ?????? (?????? ??????)-> ?????? ????????? ?????? 
		@ResponseBody
		@RequestMapping(value="/codSnd", method=RequestMethod.POST)
		public String codSnd(Model model ,String email) throws Exception{
			
			/* ???(View)????????? ????????? ????????? ?????? */
			logger.info("????????? ????????? ?????? ??????");
			logger.info("????????? : " + email);
					
			/* ????????????(??????) ?????? */
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			logger.info("???????????? " + checkNum);
			
			/* ????????? ????????? */
			String setFrom = "qwd6747@naver.com";
			String toMail = email;
			String title = "????????? ??????/???????????? ?????? ?????? ????????? ?????????.";
			String content = 
					"TCO ??????????????? ?????????????????? ???????????????." +
					"<br><br>" + 
					"?????? ????????? " + checkNum + "?????????." + 
					"<br>" + 
					"?????? ??????????????? ???????????? ???????????? ???????????? ?????????.";		
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				  //true??? html??? ?????????????????? ???????????????.
				FileSystemResource file = 
						new FileSystemResource(new File("D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\images\\TCO??????_??????1.png")); 
				helper.addAttachment("TCO??????_??????.png", file);

				
				mailSender.send(message);
				
			}catch(Exception e) {
				e.printStackTrace();
			}		
			
			String randomCode = Integer.toString(checkNum);
			model.addAttribute("data", randomCode);
			return randomCode;
			
		}
		
		//?????? ?????? ???????????????
		@ResponseBody
		@RequestMapping(value = "/sendMail",method = RequestMethod.POST)
	    public String sendMail(Model model
				, @RequestParam String empName
				, @RequestParam String email) throws Exception{
			logger.info("?????? ?????? ??????????????? ?????? ????????? : " + email);
			logger.info("?????? ?????? ??????????????? ?????? ?????? : " + empName);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("email", email);
			map.put("empName", empName);
			String empId = this.empService.forgotId(map);
			logger.info("???????????? ?????? ?????? : " + empId);
			/* ????????? ????????? */
			String setFrom = "qwd6747@naver.com";
			String toMail = email;
			String title = "T-CO ???????????? ?????? ?????? ?????? ?????????. ";
			String content = 
					"TCO ??????????????? ?????????????????? ???????????????." +
					"<br><br>" + 
					"?????? ?????? ?????? ????????? " + empId+  "?????????."+
					"<br>" + 
					"?????? ??????????????? ???????????? ???????????? ???????????? ?????????.";		
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				  //true??? html??? ?????????????????? ???????????????.
				FileSystemResource file = 
						new FileSystemResource(new File("D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\images\\TCO??????_??????1.png")); 
				helper.addAttachment("TCO??????_??????.png", file);
				
				mailSender.send(message);
			}catch(Exception e) {
				e.printStackTrace();
			}		
			model.addAttribute("data", empId);
			
			return empId;
	    }

		// ??????  ???????????? ??????
		@ResponseBody
		@PostMapping("/pwForget")
		public int pwForget(@ModelAttribute String empPswd, String empId) {
			logger.info("empempPswd : "+empPswd);
			logger.info("empId : "+empId);
			
			EmpVO empVO = new EmpVO();
			empVO.setEmpPswd(empPswd);
			empVO.setEmpId(empId);
			logger.info("before" + empVO.toString());
			
			int isUpdateSuccess = empService.empPswdupdate(empVO);
			
			logger.info("?????????: "+ isUpdateSuccess);
			
			
			return isUpdateSuccess;
			
		}
		
}
