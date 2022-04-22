package kr.or.tco.notice.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
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
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.google.gson.JsonObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.tco.att.controller.AttController;
import kr.or.tco.emp.vo.AttachFilesVO;
import kr.or.tco.notice.ArticlePage;
import kr.or.tco.notice.service.NoticeService;
import kr.or.tco.notice.vo.BrdVO;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	private static final Logger logger = 
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/noticelist")
	public String noticelist(Model model, @RequestParam(defaultValue="1") int currentPage
			, @RequestParam(required=false) String keyWord
			, @RequestParam(defaultValue="5",required=false) int size, @RequestParam Map<String,Object> map) {
		
		map.put("keyWord", keyWord);
		map.put("currentPage", currentPage);
		map.put("size", size);
		
		// 글 목록
		List<BrdVO> list = noticeService.noticelist(map);
		// 작성자 이름값 넣어주기
		for(BrdVO brdVO : list) {
			String name = noticeService.selectname(brdVO.getEmpId());
			brdVO.setEmpNm(name);
		}
		
		int total = noticeService.selectCount(map);
		
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, list));
				
		model.addAttribute("total", total);
		
		logger.info("list를 뽑아보아요옹: "+ list);
		model.addAttribute("data", list);
		
		
		return "notice/noticelist";
	}
	
	@GetMapping("/noticedetail")
	public String noticedetail(@RequestParam int brdId, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userID");
		
		BrdVO brdVO = new BrdVO();
		brdVO = noticeService.noticedetail(brdId);
		
		String name = noticeService.selectname(brdVO.getEmpId());
		brdVO.setEmpNm(name);
		
		logger.info("brdVO.getEmpId():  "+ brdVO.getEmpId());
		logger.info("userID:    "+ userId);
		logger.info("brdId:    "+ brdId);
		
		
			noticeService.noticevi(brdId);
		
		logger.info("brdVO요기릉 보슈: "+ brdVO.toString());
		model.addAttribute("list", brdVO);
		model.addAttribute("userId", userId);
		
		return "notice/noticedetail";
	}
	
	@GetMapping("/noticeinsert")
	public String noticeinsert(Model model) {
		
		model.addAttribute("brdVO", new BrdVO());
		
		return "notice/noticeinsert";
	}
	
	/*
	 * @PostMapping("/noticeinsert") public String pnoticeinsert(BrdVO brdVO,
	 * HttpServletRequest request) { HttpSession session = request.getSession();
	 * String empId = (String) session.getAttribute("userID"); logger.info("유저아이디는"
	 * + empId); logger.info("noticeVo는: "+ brdVO.toString());
	 * brdVO.setEmpId(empId);
	 * 
	 * //업로드한 파일 MultipartFile[] uploadFile = brdVO.getUploadFile();
	 * 
	 * //파일 저장 경로 설정 String uploadFolder =
	 * "D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\upload";
	 * 
	 * //연/월/일 폴더 생성 시작------- File uploadPath = new File(uploadFolder,
	 * getFolder()); logger.info("uploadPath : " + uploadPath);
	 * 
	 * if(uploadPath.exists()==false) {//해당 경로가 없으면 생성해줘야함 uploadPath.mkdirs(); }
	 * 
	 * AttachFilesVO vo = new AttachFilesVO();
	 * 
	 * 
	 * //이미지 3개를 업로드 한다면 3회 반복 for(MultipartFile multipartFile : uploadFile) {
	 * logger.info("-----------"); logger.info("파일명 : " +
	 * multipartFile.getOriginalFilename()); logger.info("파일크기 : " +
	 * multipartFile.getSize());
	 * 
	 * //각 파일 별로 세팅할 VO
	 * 
	 * 
	 * //1) 파일id(기본키데이터), 파일시퀀스번호,파일명과 크기를 세팅
	 * 
	 * vo.setAtchfileSz(""+multipartFile.getSize()); vo.setAtchfileNm(
	 * multipartFile.getOriginalFilename());
	 * 
	 * 
	 * 
	 * //-----------UUID 파일명 처리 시작 ---------------------------- //동일한 이름으로 업로드되면 기존
	 * 파일을 지우게 되므로 이를 방지하기 위함 UUID uuid = UUID.randomUUID();
	 * 
	 * String uploadFileName = uuid.toString() + "-" +
	 * multipartFile.getOriginalFilename(); // c:\\upload\\gongu03.jpg으로 조립 // 이렇게
	 * 업로드 하겠다라고 설계 uploadFolder -> uploadPath //
	 * /resources/upload/2022/02/21/asdfsadfsdafsda_test.jpg
	 * vo.setUploadFileName("/resources/upload/" + getFolder() + "/" +
	 * uploadFileName);
	 * 
	 * brdVO.setBrdImg("/resources/upload/" + getFolder() + "/" + uploadFileName);
	 * 
	 * File saveFile = new File(uploadPath,uploadFileName); //-----------UUID 파일명 처리
	 * 끝 ----------------------------
	 * 
	 * try { //transferTo() : 물리적으로 파일 업로드가 됨 multipartFile.transferTo(saveFile);
	 * 
	 * 
	 * 
	 * 
	 * }catch(Exception e){ logger.info(e.getMessage()); }//end catch }
	 * 
	 * //attach_files 테이블로 insert noticeService.insertAttachFiles(vo);
	 * 
	 * int intresult = noticeService.noticeinsert(brdVO);
	 * 
	 * if(intresult>0) { //고객 등록 성공
	 * 
	 * // 목록으로 이동 return "redirect:/notice/noticelist";
	 * 
	 * }else { return "notice/noticeinsert"; }
	 * 
	 * 
	 * 
	 * }
	 */
	
	
	//첨부파일을 보관하는 폴더를 연/월/일 계층 형태로 생성하기 위함
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			return str.replace("-", "/");
		}
		
		@PostMapping("/noticefile")
		@ResponseBody 
		public void ckUpload(Model model, HttpServletRequest req
				, HttpServletResponse res
				, @RequestParam MultipartFile upload) throws Exception { 
			logger.info("ckUpload 진입 =========================================1"); 
			logger.info("multipartfile : " + upload); 
			// 랜덤 문자 생성 
			UUID uid = UUID.randomUUID(); 
			OutputStream out = null; 
			PrintWriter printWriter = null;
			JsonObject json = new JsonObject();
			
			String uploadPathFile ="D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\upload";
			File uploadPath = new File(uploadPathFile, getFolder());
			logger.info("uploadPath : " + uploadPath);
			
			if(uploadPath.exists()==false) {//해당 경로가 없으면 생성해줘야함
				uploadPath.mkdirs();			
			}
			
			// 인코딩 
			res.setCharacterEncoding("utf-8"); 
			res.setContentType("text/html;charset=utf-8"); 
			try { 
				String fileName = upload.getOriginalFilename(); 
				String uploadFileName = uid.toString() + "-" + fileName;
				logger.info("uploadFileName : " + uploadFileName);
				// 파일 이름 가져오기 
				byte[] bytes = upload.getBytes(); 
				File saveFile = new File(uploadPath, uploadFileName);
//				File saveFile = new File(uploadPathFile, fileName);
				
				// 업로드 경로 
				out = new FileOutputStream(saveFile); 
				out.write(bytes); 
				out.flush(); 
				// out에 저장된 데이터를 전송하고 초기화
				String callback = req.getParameter("CKEditorFuncNum"); 
				printWriter = res.getWriter(); 
				String fileUrl = "/resources/upload/" + getFolder() + "/" + uid.toString() + "-" + fileName; 
//				String fileUrl = "cid:" + fileName; 
//				String fileUrl = "https://mail.naver.com/read/image/?mailSN=13615&attachIndex=1&contentType=image/jpeg&offset=2185&size=176478&mimeSN=1649325600.325245.23553.5888&org=1&u=qkrwldms1403"; 
				// 작성화면 
				//String fileUrl = "/ckUpload/" + uid + "&fileName=" + fileName; 
				
	            
	            // json 데이터로 등록
	            // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
	            // 이런 형태로 리턴이 나가야함.
				json.addProperty("uploaded", 1);
				json.addProperty("fileName", fileName);
				json.addProperty("url", fileUrl);
				
				printWriter.println(json);
	            
	            // 작성화면
	            // 업로드시 메시지 출력 
//	            printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction(" + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')" +"</script>"); 
//	            printWriter.flush();
	            
			} catch (IOException e) { 
				e.printStackTrace(); 
			} finally { 
				try { 
					if(out != null) { out.close(); } 
					if(printWriter != null) { printWriter.close(); } 
					} 
				catch(IOException e) { e.printStackTrace(); } 
			}
			
			return; 
			
		}
		
		
		@PostMapping("/noticeinsert")
	    public String insert (@ModelAttribute BrdVO brdVO,  HttpSession session) throws Exception{
	      
	       //로그인한 사용자의 아이디를 체크
		  //아이디를 체크해서 자신의 글에만 수정과 삭제가 가능하게 할 예정
			/* String userId = (String) session.getAttribute("userID"); */
	        /*dto.setUser_id(user_id);*/
	        
			/*
			 * insert.setContentType("text/html; charset=UTF-8"); PrintWriter out_write =
			 * insert.getWriter(); logger.info("out_write"+ out_write);
			 * 
			 * out_write.println("<script>alert('글이 작성되었습니다.');</script>");
			 * out_write.flush();
			 */
			 String userId = (String) session.getAttribute("userID");
			brdVO.setEmpId(userId);
			logger.info("brdVO"+brdVO);
	        
	        //레코드를 저장함
	       /* memberboardservice.create(dto);*/
			 noticeService.noticeinsert(brdVO) ;
	        
	        
	        //게시물을 저장한 후에 게시물 목록페이지로 다시 이동함
	        return "redirect:/notice/noticelist";
	        }
		

	  
	  @GetMapping("/noticeupdate")
	  public String noticeupdate(@ModelAttribute BrdVO brdVO, Model model) {
		  logger.info("brdVO1"+ brdVO);
		  brdVO =  noticeService.noticedetail(brdVO.getBrdId());
		  logger.info("brdVO2"+ brdVO);
		  
		  model.addAttribute("list", brdVO);
		  
		  return "notice/noticeupdate";
	  }
	  
	  @PostMapping("/noticeupdate")
	  public String pnoticeupdate(BrdVO brdVO) {
		  logger.info("brdVO~~"+ brdVO);
		  int result = noticeService.noticeupdate(brdVO);
		  
		  if(result>0) {
			  
			  return "redirect:/notice/noticelist";
		  }else {
			  return "notice/noticeupdate";
		  }
	  }
	  
	  @GetMapping("/noticedelete")
	  public String noticedelete(@RequestParam String brdId) {
		  logger.info("brdId???"+ brdId);
		  int result = noticeService.noticedelete(brdId);
		  
		  if(result>0) {
			  return "redirect:/notice/noticelist";
		  }else {
			  return "redirect:/notice/noticelist";
		  }
		  
	  }
		
	
	
	    

	
}
