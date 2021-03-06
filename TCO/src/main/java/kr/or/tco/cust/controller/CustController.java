package kr.or.tco.cust.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

import kr.or.tco.ArticlePage;
import kr.or.tco.cust.service.CustService;
import kr.or.tco.cust.vo.CustVO;
import kr.or.tco.store.service.StoreService;

@RequestMapping("/cust")
@Controller
public class CustController {
	
	@Autowired
	CustService custService;
	@Autowired
	StoreService storeService;
	@Autowired
	private JavaMailSender mailSender;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(CustController.class);
	
	
	@GetMapping("/custinsert")
	public String getCustInsert(Model model) {
		CustVO custVO = new CustVO();
		model.addAttribute("custVO", custVO);
//		logger.info("custVO11111111 : " + custVO.toString());
		
		return "cust/custinsert";
	}
	
	
	@PostMapping("/custinsert")
	public String postCustInsert(@Validated CustVO custVO,
			BindingResult result) {
		//validation ????????? ???????????????
		
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
//			List<FieldError> fieldErrors = result.getFieldErrors();
			//validation ?????? ?????? ????????? ???????????? ??????..
			for(int i=0;i<allErrors.size();i++) {
				ObjectError objectError = allErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			
			for(ObjectError objectError : globalErrors) {
				logger.info("objectError : " + objectError);
			}
			
//			for(FieldError fieldError : fieldErrors) {
//				logger.info("fieldError : " + fieldError.getDefaultMessage());
//			}
			// redirect(x) => ???????????? ?????? ??? ??????
			// forwarding(o)
			//????????? ???????????? ????????????????????? ???????????? forward
			return "cust/custinsert";
		}//end if
		
		
		logger.info("custVO2222222 : " + custVO.toString());
		if(custVO.getCustMktRcptnAgreYn() == null) {
			custVO.setCustMktRcptnAgreYn("N");
		}
		
		//?????? ???????????? ?????? ?????? ??? -> ??? ?????? update?????????..
		int insertCustRslt = custService.custInsert(custVO);
		
		if(!(insertCustRslt > 0)) {//?????? ??????
			return "cust/custinsert";
		}
		
		//?????????????????? ????????????
		return "redirect:/cust/custlist";
	}
	
	
	@GetMapping("/custlist")
	public String getCustList(Model model
			, @RequestParam(defaultValue = "1", required = false) int currentPage
			, @RequestParam(defaultValue = "7", required = false) int size
			, @RequestParam(required = false) String keyWord) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("size", size);
		map.put("currentPage", currentPage);
		
		// ?????? ?????? ????????? - ??????
		int total = this.custService.getCustTotal(map);
		// ?????? ?????? ????????? - ??????
		int total1 = this.custService.getCustTotal1(map);
		// ?????? ?????? ????????? - ??????
		int total2 = this.custService.getCustTotal2(map);
		
		// ?????? ?????? ??????
		List<CustVO> list = this.custService.custSelect(map);
		List<CustVO> list1 = this.custService.custSelectH(map);
		List<CustVO> list2 = this.custService.custSelectT(map);
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, list));
		model.addAttribute("list1", new ArticlePage(total1, currentPage, size, 5, list1));
		model.addAttribute("list2", new ArticlePage(total2, currentPage, size, 5, list2));
		model.addAttribute("total", total);
		model.addAttribute("total1", total1);
		model.addAttribute("total2", total2);
		
		return "cust/custlist";
	}
	
	@ResponseBody
	@PostMapping("/custlist")
	public ArticlePage postCustList(Model model
			, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage
			, @RequestParam(defaultValue = "7", required = false) int size
			, @RequestParam(value = "keyWord", required = false) String keyWord) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("size", size);
		map.put("currentPage", currentPage);
		
		// ?????? ?????? ????????? - ??????
		int total = this.custService.getCustTotal(map);
		
		// ?????? ?????? ??????
		List<CustVO> list = this.custService.custSelect(map);
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, list));
		model.addAttribute("total", total);
		
		ArticlePage a = new ArticlePage(total, currentPage, size, 5, list);
		
		return a;
	}
	@ResponseBody
	@PostMapping("/custlist1")
	public ArticlePage postCustList1(Model model
			, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage
			, @RequestParam(defaultValue = "7", required = false) int size
			, @RequestParam(value = "keyWord", required = false) String keyWord) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("size", size);
		map.put("currentPage", currentPage);
		
//		// ?????? ?????? ????????? - ??????
		int total1 = this.custService.getCustTotal1(map);
		
		// ?????? ?????? ??????
		List<CustVO> list1 = this.custService.custSelectH(map);
		model.addAttribute("list1", new ArticlePage(total1, currentPage, size, 5, list1));
		model.addAttribute("total1", total1);
		
		ArticlePage a = new ArticlePage(total1, currentPage, size, 5, list1);
		
		return a;
	}
	@ResponseBody
	@PostMapping("/custlist2")
	public ArticlePage postCustList2(Model model
			, @RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage
			, @RequestParam(defaultValue = "7", required = false) int size
			, @RequestParam(value = "keyWord", required = false) String keyWord) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("size", size);
		map.put("currentPage", currentPage);
		
//		// ?????? ?????? ????????? - ??????
		int total2 = this.custService.getCustTotal2(map);
		
		// ?????? ?????? ??????
		List<CustVO> list2 = this.custService.custSelectT(map);
		model.addAttribute("list", new ArticlePage(total2, currentPage, size, 5, list2));
		model.addAttribute("total2", total2);
		
		ArticlePage a = new ArticlePage(total2, currentPage, size, 5, list2);
		
		return a;
	}
	
	@GetMapping("/custdetail/{custId}")
	public String getCustDetail(Model model, @PathVariable("custId") String custId) {
		logger.info("custId : " + custId);
		
		CustVO custVO = this.custService.custDetailSelect(custId);
		String brdt = custVO.getCustBrdt().substring(0, 10);
		custVO.setCustBrdt(brdt);
		if(custVO != null) {
			logger.info("custVO!!!!!!!!!!!!!!!!! : " + custVO.toString());
			logger.info("custVO : " + custVO.getCustBrdt());
		}
		
		model.addAttribute("custVO", custVO);
		
		
		return "cust/custdetail";
	}
	
	@ResponseBody
	@PostMapping("/custupdate")
	public int postCustUpdate(@RequestParam String custId,
			@ModelAttribute CustVO custVO, BindingResult result) {
		
		logger.info("custVO???????????? : " + custVO.toString());
		logger.info("result.hasErrors() : " + result.hasErrors());
		custVO.setCustId(custId);
		
		logger.info("custVO2222222 : " + custVO.toString());
		if(custVO.getCustMktRcptnAgreYn() == null) {
			custVO.setCustMktRcptnAgreYn("N");
		}
		
		int updateResult = this.custService.custDetailUpdate(custVO);
		
		return updateResult;
	}
	
	@ResponseBody
	@PostMapping("/custdelete")
	public int postCustDelete(Model model
			, @RequestParam String custId) {
		logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		model.addAttribute("custId", custId);
		
		int deleteResult = this.custService.custDeleteUpdate(custId);

		return deleteResult;
	}
	
	@ResponseBody
	@PostMapping("/custfilter")
	public List<CustVO> postCustFilter(Model model
			, @RequestParam(required = false) String keyWord
			, @RequestParam(value = "age[]", required = false) List<String> age
			, @RequestParam(value = "gender[]", required = false) List<String> gender
			, @RequestParam(value = "rank[]", required = false) List<String> rank
			, @RequestParam(value = "mrg[]", required = false) List<String> mrg
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ageList", age);
		map.put("genderList", gender);
		map.put("rankList", rank);
		map.put("mrgList", mrg);
		map.put("keyWord", keyWord);
				
		List<CustVO> list = this.custService.custMktSelect(map);
		model.addAttribute("list", list);
		
		return list;
	}
	@ResponseBody
	@PostMapping("/custfilter1")
	public List<CustVO> postCustFilter1(Model model
			, @RequestParam(required = false) String keyWord
			, @RequestParam(value = "age[]", required = false) List<String> age
			, @RequestParam(value = "gender[]", required = false) List<String> gender
			, @RequestParam(value = "rank[]", required = false) List<String> rank
			, @RequestParam(value = "mrg[]", required = false) List<String> mrg
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ageList", age);
		map.put("genderList", gender);
		map.put("rankList", rank);
		map.put("mrgList", mrg);
		map.put("keyWord", keyWord);
		
		List<CustVO> list = this.custService.custMktSelect1(map);
//		model.addAttribute("list", list);
		
		return list;
	}
	@ResponseBody
	@PostMapping("/custfilter2")
	public List<CustVO> postCustFilter2(Model model
			, @RequestParam(required = false) String keyWord
			, @RequestParam(value = "age[]", required = false) List<String> age
			, @RequestParam(value = "gender[]", required = false) List<String> gender
			, @RequestParam(value = "rank[]", required = false) List<String> rank
			, @RequestParam(value = "mrg[]", required = false) List<String> mrg
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ageList", age);
		map.put("genderList", gender);
		map.put("rankList", rank);
		map.put("mrgList", mrg);
		map.put("keyWord", keyWord);
		
		List<CustVO> list = this.custService.custMktSelect2(map);
//		model.addAttribute("list", list);
		
		return list;
	}

	
	@GetMapping("/custprmt")
	public String getCustPrmt(Model model
			, @RequestParam(required = false) String keyWord) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);

		List<CustVO> list = this.custService.custMktSelect(map);
		model.addAttribute("list", list);
		List<CustVO> list1 = this.custService.custMktSelect1(map);
		model.addAttribute("list1", list1);
		List<CustVO> list2 = this.custService.custMktSelect2(map);
		model.addAttribute("list2", list2);
		
		return "cust/custprmt";
	}
	
	@GetMapping("/custmail")
	public String getCustMail(Model model
			, @RequestParam(value = "sendCust") List<String> mailList
			, @RequestParam(value = "custId") List<String> custList) {
		for(String s : custList) {
			logger.info("cust~!!!!!!! : " + s);
		}
		List<CustVO> list = new ArrayList<CustVO>();
		for(int i = 0; i < mailList.size(); i++) {
			CustVO custVO = new CustVO();
			custVO.setCustId(custList.get(i));
			custVO.setCustMail(mailList.get(i));
			logger.info("mails!!!!!!!!!!!!!!!! : " + mailList.get(i));
			list.add(custVO);
		}
//		logger.info("list!!!! : " + list.get(0));
//		logger.info("list!!!! : " + list.get(1));
		model.addAttribute("list", list);
		model.addAttribute("mails", mailList);
		
		return "cust/custmail";
	}
	
	@RequestMapping(value="/custfile", method = RequestMethod.POST) 
	@ResponseBody 
	public void ckUpload(Model model, HttpServletRequest req
			, HttpServletResponse res
			, @RequestParam MultipartFile upload) throws Exception { 
		logger.info("ckUpload ?????? =========================================1"); 
		logger.info("multipartfile : " + upload); 
		// ?????? ?????? ?????? 
		UUID uid = UUID.randomUUID(); 
		OutputStream out = null; 
		PrintWriter printWriter = null;
		JsonObject json = new JsonObject();
		
		String uploadPathFile ="D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\upload";
		File uploadPath = new File(uploadPathFile, getFolder());
		logger.info("uploadPath : " + uploadPath);
		
		if(uploadPath.exists()==false) {//?????? ????????? ????????? ??????????????????
			uploadPath.mkdirs();			
		}
		
		// ????????? 
		res.setCharacterEncoding("utf-8"); 
		res.setContentType("text/html;charset=utf-8"); 
		try { 
			String fileName = upload.getOriginalFilename(); 
			String uploadFileName = uid.toString() + "-" + fileName;
			logger.info("uploadFileName : " + uploadFileName);
			// ?????? ?????? ???????????? 
			byte[] bytes = upload.getBytes(); 
			File saveFile = new File(uploadPath, uploadFileName);
//			File saveFile = new File(uploadPathFile, fileName);
			
			// ????????? ?????? 
			out = new FileOutputStream(saveFile); 
			out.write(bytes); 
			out.flush(); 
			// out??? ????????? ???????????? ???????????? ?????????
			String callback = req.getParameter("CKEditorFuncNum"); 
			printWriter = res.getWriter(); 
			String fileUrl = "/resources/upload/" + getFolder() + "/" + uid.toString() + "-" + fileName; 
//			String fileUrl = "cid:" + fileName; 
//			String fileUrl = "https://mail.naver.com/read/image/?mailSN=13615&attachIndex=1&contentType=image/jpeg&offset=2185&size=176478&mimeSN=1649325600.325245.23553.5888&org=1&u=qkrwldms1403"; 
			// ???????????? 
			//String fileUrl = "/ckUpload/" + uid + "&fileName=" + fileName; 
			
            
            // json ???????????? ??????
            // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
            // ?????? ????????? ????????? ????????????.
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", fileUrl);
			
			printWriter.println(json);
            
            // ????????????
            // ???????????? ????????? ?????? 
//            printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction(" + callback+",'"+ fileUrl+"','???????????? ????????????????????????.')" +"</script>"); 
//            printWriter.flush();
            
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
	
	
	@PostMapping("/sendMail")
	@ResponseBody
    public boolean sendMailTest(HttpServletRequest request
    		, @RequestParam(value = "mails", required = false) String[] mails
			, @RequestParam(value = "subject", required = false) String subject
			, @RequestParam(value = "file", required = false) String file
			, @RequestParam(value = "file1", required = false) MultipartFile multi) throws Exception{
        
		logger.info(multi.getOriginalFilename());
		
		String uploadFolder = 
		"D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\TCO\\src\\main\\webapp\\resources\\upload";
		
		//???/???/??? ?????? ?????? ??????-------
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("uploadPath : " + uploadPath);
				
		if(uploadPath.exists()==false) {//?????? ????????? ????????? ??????????????????
			uploadPath.mkdirs();			
		}
		
		
		UUID uuid = UUID.randomUUID();
		
		String uploadFileName = uuid.toString() + "-" + multi.getOriginalFilename();
		// c:\\upload\\gongu03.jpg?????? ??????
		// ????????? ????????? ??????????????? ?????? uploadFolder -> uploadPath
		// /resources/upload/2022/02/21/asdfsadfsdafsda_test.jpg
		String upfilename = "/resources/upload/" + getFolder() + "/" + uploadFileName;
		
		File saveFile = new File(uploadPath,uploadFileName);
		//-----------UUID ????????? ?????? ??? ----------------------------
		
		try {
			//transferTo() : ??????????????? ?????? ???????????? ???
			multi.transferTo(saveFile);
		}catch(Exception e){
			logger.info(e.getMessage());
		}//end catch
		
		boolean result = true;
		if(mails != null) {
//			for(String c : mails) {
				logger.info("mail : " + mails[0].substring(1));
//			}
		} else {
			logger.info("???????????? ???????????????????????????????????????????????????");
		}
		
		logger.info("file~!!!!!!!!~!~ : " + file);
		
//		for(int i = 0; i < mails.size(); i++) {
			
			try{
				
				MimeMessage message = mailSender.createMimeMessage();
				//true ?????? multipart ??????
				MimeMessageHelper messageHelper=new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setSubject(subject);
//			messageHelper.setText(vo.getMessage(), true); //true ??? html ??????
				
			logger.info("custvo : " + mails);
				
				
				messageHelper.setFrom(new InternetAddress("qwd6747@naver.com", "TCO?????????", "UTF-8"));
				// ?????? ?????? ??????????????? ??????
			InternetAddress[] toAddr = new InternetAddress[mails.length];
			for(int i = 0; i < mails.length; i++) {
				if(i == 0) {
					if(i == mails.length-1) {
						toAddr[i] =  new InternetAddress(mails[i].substring(1, mails[i].length()-1));
					} else {
						toAddr[i] =  new InternetAddress(mails[i].substring(1));
					}
				} else if(i == mails.length-1) {
					toAddr[i] =  new InternetAddress(mails[i].substring(0, mails[i].length()-1));
				} else {
					toAddr[i] =  new InternetAddress(mails[i]);
				}
			}
//				messageHelper.setTo(new InternetAddress(mails.get(i)));
				message.setRecipients(Message.RecipientType.TO, toAddr);
				messageHelper.setText(file, true);   // ?????? ??????
				
				FileSystemResource file3 = new FileSystemResource(saveFile); 
				messageHelper.addAttachment(uploadFileName, file3);
				
				mailSender.send(message);
				
				
			} catch (MessagingException e) {
				result=false;
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				result=false;
				e.printStackTrace();
			}
//		}

		return result;
        
    }
	
//	@GetMapping("/ntslTest")
//	public String ntslTest() {
//		return "cust/ntslTest";
//	}

	//?????? ???????????????
	@PostMapping("/ntsl.do")
	@ResponseBody
	public int autoNtsl(@RequestParam String brncofc
					   ,@RequestParam int qty
					   ,@RequestParam String cust
					   ,@RequestParam int prod) {
		logger.info("brncofc : " + brncofc + " / qty : " + qty + " / cust : " + cust + " / prod : " + prod);
		
		//????????? ????????????
		String prodId = "";
		if(prod < 10) {
			prodId = "PROD0000" + prod;
		}else if(prod < 99){
			prodId = "PROD000" + prod;
		}else {
			prodId = "PROD00" + prod;
		}
		
		//???????????? ????????????
		int amt = custService.amtFind(prodId);
		//???????????? * ??????
		amt = amt * qty;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brncofcId", brncofc);
		map.put("custId", cust);
		map.put("prodInfoId", prodId);
		map.put("custNtslQty", qty);
		map.put("custNtslAmt", amt);
		map.put("refill", -qty);
		//????????? ????????? ??????
		int result = custService.autoNtsl(map);
		//?????? ?????? - ????????????(???????????? ?????? ????????? ????????? ??????)
		int stock = storeService.shopSell(map);
		
		if(result + stock == 2) {
			result = 1;
		}else { result = 0; }
		
		return result;
	}
		

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", "/");
	}
}
