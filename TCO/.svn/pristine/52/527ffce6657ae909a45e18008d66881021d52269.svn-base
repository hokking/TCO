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
		logger.info("^^^^^^^^계좌번호!^^^^^^^ : " + empVO.getEmpActno());
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
		logger.info("결과능: "+ isUpdateSuccess);

		
		return isUpdateSuccess;
	}
	
	@GetMapping("/empinsert")
	public String getempinsert(Model model) {
	
		model.addAttribute("empVO", new EmpVO());
		return "emp/empinsert";
	}

		
	
	@PostMapping("/empinsert")
	public String postempinsert(EmpVO empVO) {
		
		logger.info("empVo는: "+ empVO);
		
		String cmncdCd = empService.cdselect(empVO);
		logger.info(cmncdCd);
		empVO.setCmncdCd(cmncdCd);
		
		
		//업로드한 파일 
		MultipartFile[] uploadFile = empVO.getUploadFile();
				
		//파일 저장 경로 설정
		String uploadFolder = 
		"D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\upload";
		
		//연/월/일 폴더 생성 시작-------
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("uploadPath : " + uploadPath);
				
		if(uploadPath.exists()==false) {//해당 경로가 없으면 생성해줘야함
			uploadPath.mkdirs();			
		}
		//연/월/일 폴더 생성 끝-------
		
		
		AttachFilesVO vo = new AttachFilesVO();
	
		
		//이미지 3개를 업로드 한다면 3회 반복
		for(MultipartFile multipartFile : uploadFile) {
			logger.info("-----------");
			logger.info("파일명 : " + multipartFile.getOriginalFilename());
			logger.info("파일크기 : " + multipartFile.getSize());
			
			//각 파일 별로 세팅할 VO 
			
			
			//1) 파일id(기본키데이터), 파일시퀀스번호,파일명과 크기를 세팅
			
			vo.setAtchfileSz(""+multipartFile.getSize());
			vo.setAtchfileNm( multipartFile.getOriginalFilename());
			
			
			
			//-----------UUID 파일명 처리 시작 ----------------------------
			//동일한 이름으로 업로드되면 기존 파일을 지우게 되므로 이를 방지하기 위함
			UUID uuid = UUID.randomUUID();
			
			String uploadFileName = uuid.toString() + "-" + multipartFile.getOriginalFilename();
			// c:\\upload\\gongu03.jpg으로 조립
			// 이렇게 업로드 하겠다라고 설계 uploadFolder -> uploadPath
			// /resources/upload/2022/02/21/asdfsadfsdafsda_test.jpg
			vo.setUploadFileName("/resources/upload/" + getFolder() + "/" + uploadFileName);
			
			empVO.setEmpImg("/resources/upload/" + getFolder() + "/" + uploadFileName);
			
			File saveFile = new File(uploadPath,uploadFileName);
			//-----------UUID 파일명 처리 끝 ----------------------------
			
			try {
				//transferTo() : 물리적으로 파일 업로드가 됨
				multipartFile.transferTo(saveFile);
			
				
				
				
			}catch(Exception e){
				logger.info(e.getMessage());
			}//end catch
		}
		
		
		logger.info("attachFilesVO능?!" + vo);
		
		//attach_files 테이블로 insert
		empService.insertAttachFiles(vo);
				 
				
		logger.info("empVo는2: "+ empVO);
		int intresult = empService.empinsert(empVO);
		
		if(intresult>0) { //고객 등록 성공
			
			// 목록으로 이동
			return "redirect:/emp/emplist";
			
		}else {
			return "emp/empinsert";
		}
	}

	
	@GetMapping("/emplist")
	public String emplist(Model model, @RequestParam(defaultValue="1") int currentPage
			, @RequestParam(required=false) String keyWord
			, @RequestParam(defaultValue="5",required=false) int size, @RequestParam Map<String,Object> map) {	
		
		logger.info("size:뒤진다" + size);
		map.put("keyWord", keyWord);
		map.put("currentPage", currentPage);
		map.put("size", size);
		  
		logger.info(map.toString());
		//직원 목록
		List<EmpVO> list = this.empService.emplist(map);
		for(EmpVO empVO : list) {
			CmncdVO cmncdVO = new CmncdVO(); 
			cmncdVO = empService.sdselect(empVO.getCmncdCd());
			
			  String brn = empService.brnselect(empVO.getBrncofcId());
			  logger.info("왜안대:"+brn);
			 
				 empVO.setBrncofcNm(brn); 
			 
			empVO.setOpt(cmncdVO.getCmncdGuNm());
			empVO.setDptopt(cmncdVO.getCmncdNm1());
			empVO.setLelopt(cmncdVO.getCmncdNm2());
			logger.info("제발!!!!!!!!!!"+ empVO.toString());
		}
		
		logger.info("list능 ?" + list.toString());
		
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
		logger.info("이게몬가용가리?"+ empVO.toString());
		
		
		  String brn = empService.brnselect(empVO.getBrncofcId());
		  logger.info("왜안대:"+brn); empVO.setBrncofcNm(brn);
		  
		
		CmncdVO cmncdVO = new CmncdVO(); 
		cmncdVO = empService.sdselect(empVO.getCmncdCd());
		
		empVO.setOpt(cmncdVO.getCmncdGuNm());
		empVO.setDptopt(cmncdVO.getCmncdNm1());
		empVO.setLelopt(cmncdVO.getCmncdNm2());
		
		model.addAttribute("data", empVO);
		
		return "emp/empdetail";
	}
	
	//로그인 페이지로 이동
	@GetMapping("/loginpage")
	public String loginpage(Model model) {
		
				return "emp/login/loginpage";
		
	}
	//비번 찾기 페이지로 
	@GetMapping("/findPass")
	public String findPass(Model model) {
		
		return "emp/login/findPass";
		
	}
	// 아이디 찾기 페이지로 
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
			logger.info("안됨!!!!!!!!!!!!!!!!!!!!");
			return "redirect:/emp/loginpage";
		} else {
			logger.info("로그인성공!!!!!!!!!!!!!!!!!!!!" + empVO.getEmpImg());
			session.setAttribute("userID", username);
			session.setAttribute("userPW", password);
			session.setAttribute("userNM", empVO.getEmpNm());
			session.setAttribute("img", empVO.getEmpImg());
			session.setAttribute("email", empVO.getEmpMail());	//이메일
			session.setAttribute("cmncdCd", empVO.getCmncdCd()); //공통코드
			session.setAttribute("brncofcId", empVO.getBrncofcId()); //지점
			session.setAttribute("brncofcNm", empVO.getBrncofcNm()); //지점명
			session.setAttribute("dptopt", empVO.getDptopt()); //부서
			session.setAttribute("lelopt", empVO.getLelopt()); //직급
			
			session.setAttribute("empVO", empVO); // 채팅용

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
	
	// 수정시 @ResponseBody써줘야 ajax로 return값이 전달됨 !!
	
	// 직원 연락처수정
	@ResponseBody
	@PostMapping("/empTelupdate")
	public int empTelupdate(@ModelAttribute EmpVO empVO) {
		logger.info("emp를보시오"+empVO.toString());
		int isUpdateSuccess = empService.empTelupdate(empVO);
		logger.info("결과능: "+ isUpdateSuccess);

		return isUpdateSuccess;
		
	}
	
	// 직원 이메일 수정
	@ResponseBody
	@PostMapping("/empMailupdate")
	public int empMailupdate(@ModelAttribute EmpVO empVO) {

		int isUpdateSuccess = empService.empMailupdate(empVO);
		logger.info("결과능: "+ isUpdateSuccess);
		
		
		return isUpdateSuccess;
		
	}
	
	// 직원  비밀번호 수정
	@ResponseBody
	@PostMapping("/empPswdupdate")
	public int empPswdupdate(@ModelAttribute EmpVO empVO) {
		logger.info("emp를보시오"+empVO.toString());
		int isUpdateSuccess = empService.empPswdupdate(empVO);
		logger.info("결과능: "+ isUpdateSuccess);
		
		
		return isUpdateSuccess;
		
	}
	
	// 직원  유형 수정
	@ResponseBody
	@PostMapping("/empSeupdate")
	public int empSeupdate(@ModelAttribute EmpVO empVO) {
		
		int isUpdateSuccess = empService.empSeupdate(empVO);
		logger.info("결과능: "+ isUpdateSuccess);
		
		
		return isUpdateSuccess;
		
	}
	
	//첨부파일을 보관하는 폴더를 연/월/일 계층 형태로 생성하기 위함
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			return str.replace("-", "/");
		}
		
		/* 이메일 인증 */ //웹페이지 -> 서버 (난수 생성)-> 난수 메일로 보냄 
		@ResponseBody
		@RequestMapping(value="/codSnd", method=RequestMethod.POST)
		public String codSnd(Model model ,String email) throws Exception{
			
			/* 뷰(View)로부터 넘어온 데이터 확인 */
			logger.info("이메일 데이터 전송 확인");
			logger.info("이메일 : " + email);
					
			/* 인증번호(난수) 생성 */
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			logger.info("인증번호 " + checkNum);
			
			/* 이메일 보내기 */
			String setFrom = "qwd6747@naver.com";
			String toMail = email;
			String title = "아이디 찾기/비밀번호 변경 인증 이메일 입니다.";
			String content = 
					"TCO 홈페이지를 방문해주셔서 감사합니다." +
					"<br><br>" + 
					"인증 번호는 " + checkNum + "입니다." + 
					"<br>" + 
					"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";		
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				  //true는 html을 사용하겠다는 의미입니다.
				FileSystemResource file = 
						new FileSystemResource(new File("D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\images\\TCO로고_가로1.png")); 
				helper.addAttachment("TCO로고_가로.png", file);

				
				mailSender.send(message);
				
			}catch(Exception e) {
				e.printStackTrace();
			}		
			
			String randomCode = Integer.toString(checkNum);
			model.addAttribute("data", randomCode);
			return randomCode;
			
		}
		
		//사번 찾기 메일보내기
		@ResponseBody
		@RequestMapping(value = "/sendMail",method = RequestMethod.POST)
	    public String sendMail(Model model
				, @RequestParam String empName
				, @RequestParam String email) throws Exception{
			logger.info("사번 찾기 메일보내기 유저 이메일 : " + email);
			logger.info("사번 찾기 메일보내기 유저 이름 : " + empName);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("email", email);
			map.put("empName", empName);
			String empId = this.empService.forgotId(map);
			logger.info("쿼리에서 나온 사번 : " + empId);
			/* 이메일 보내기 */
			String setFrom = "qwd6747@naver.com";
			String toMail = email;
			String title = "T-CO 로그인용 사번 찾기 결과 입니다. ";
			String content = 
					"TCO 홈페이지를 방문해주셔서 감사합니다." +
					"<br><br>" + 
					"사우 님의 사원 번호는 " + empId+  "입니다."+
					"<br>" + 
					"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";		
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				  //true는 html을 사용하겠다는 의미입니다.
				FileSystemResource file = 
						new FileSystemResource(new File("D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\images\\TCO로고_가로1.png")); 
				helper.addAttachment("TCO로고_가로.png", file);
				
				mailSender.send(message);
			}catch(Exception e) {
				e.printStackTrace();
			}		
			model.addAttribute("data", empId);
			
			return empId;
	    }

		// 직원  비밀번호 수정
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
			
			logger.info("결과능: "+ isUpdateSuccess);
			
			
			return isUpdateSuccess;
			
		}
		
}
