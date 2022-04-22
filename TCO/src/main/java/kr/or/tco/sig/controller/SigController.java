package kr.or.tco.sig.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.tco.emp.vo.AttachFilesVO;
import kr.or.tco.sig.ArticlePage;
import kr.or.tco.sig.service.SigService;
import kr.or.tco.sig.vo.SigVO;

@RequestMapping("/sig")
@Controller
public class SigController {
	private static final Logger logger = 
			LoggerFactory.getLogger(SigController.class);
	
	@Autowired
	SigService sigService;
	
	@GetMapping("/siglist")
	public String siglist(Model model, @RequestParam(defaultValue="1") int currentPage
			, @RequestParam(required=false) String keyWord
			, @RequestParam(defaultValue="7",required=false) int size, @RequestParam Map<String,Object> map) {
		
		map.put("keyWord", keyWord);
		map.put("currentPage", currentPage);
		map.put("size", size);
		
		List<SigVO> list = sigService.siglist(map);
		logger.info("시그 리스트: "+list);
		for(SigVO sigVO : list) {
			String name = sigService.selectname(sigVO.getEmpId());
			sigVO.setEmpNm(name);
		}
		
		int total = sigService.selectCount(map);
		
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, list));
				
		model.addAttribute("total", total);
		
		model.addAttribute("data", list);
		
		
		return "sig/siglist";
	}
	
	@GetMapping("/sigdetail")
	public String sigdetail(@RequestParam int brdId, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userID");
		logger.info("시그 디테일 userId : "+userId);
		
		SigVO sigVO = new SigVO();
		sigVO = sigService.sigdetail(brdId);
		logger.info("시그 디테일 sigVO : "+sigVO);
		
		if(userId==sigVO.getEmpId()) {
			sigService.sigevi(brdId);
		}
		logger.info("sigVO: "+ sigVO.toString());
		model.addAttribute("list", sigVO);
		model.addAttribute("userId", userId);
		
		return "sig/sigdetail";
	}
	
	@GetMapping("/siginsert")
	public String noticeinsert(Model model) {
		
		model.addAttribute("sigVO", new SigVO());
		
		return "sig/siginsert";
	}
	
	@PostMapping("/siginsert")
	public String siginsert(SigVO sigVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String empId = (String) session.getAttribute("userID");
		logger.info("유저아이디는" + empId);
		logger.info("sigVo는: "+ sigVO.toString());
		sigVO.setEmpId(empId);
		
		//업로드한 파일 
		MultipartFile[] uploadFile = sigVO.getUploadFile();
		
		//파일 저장 경로 설정
		String uploadFolder = 
		"D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\upload";
				
		//연/월/일 폴더 생성 시작-------
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("uploadPath : " + uploadPath);
				
		if(uploadPath.exists()==false) {//해당 경로가 없으면 생성해줘야함
			uploadPath.mkdirs();			
		}
		
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
			
			sigVO.setBrdImg("/resources/upload/" + getFolder() + "/" + uploadFileName);
			
			File saveFile = new File(uploadPath,uploadFileName);
			//-----------UUID 파일명 처리 끝 ----------------------------
			
			try {
				//transferTo() : 물리적으로 파일 업로드가 됨
				multipartFile.transferTo(saveFile);
			
				
			}catch(Exception e){
				logger.info(e.getMessage());
			}//end catch
		}
		
		//attach_files 테이블로 insert
		sigService.insertAttachFiles(vo);
		
		int intresult = sigService.siginsert(sigVO);
		
		if(intresult>0) { //고객 등록 성공
			
			// 목록으로 이동
			return "redirect:/sig/siglist";
			
		}else {
			return "sig/siginsert";
		}
		
				
		
	}
	
	
	
	//첨부파일을 보관하는 폴더를 연/월/일 계층 형태로 생성하기 위함
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			return str.replace("-", "/");
		}
		
	
	
	    

	
}
