package kr.or.tco.cal.controller;

import static dev.samstevens.totp.util.Utils.getDataUriForImage;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base32;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.samstevens.totp.code.CodeGenerator;
import dev.samstevens.totp.code.CodeVerifier;
import dev.samstevens.totp.code.DefaultCodeGenerator;
import dev.samstevens.totp.code.DefaultCodeVerifier;
import dev.samstevens.totp.code.HashingAlgorithm;
import dev.samstevens.totp.exceptions.QrGenerationException;
import dev.samstevens.totp.qr.QrData;
import dev.samstevens.totp.qr.QrGenerator;
import dev.samstevens.totp.qr.ZxingPngQrGenerator;
import dev.samstevens.totp.secret.DefaultSecretGenerator;
import dev.samstevens.totp.secret.SecretGenerator;
import dev.samstevens.totp.time.SystemTimeProvider;
import dev.samstevens.totp.time.TimeProvider;
import kr.or.tco.cal.service.CalService;
import kr.or.tco.cal.vo.CustNtsVO;
import kr.or.tco.cal.vo.PosVO;
import kr.or.tco.cal.vo.StrgWrhsVO;
import kr.or.tco.cust.service.CustService;
import kr.or.tco.cust.vo.CustVO;
import kr.or.tco.emp.vo.EmpVO;
import kr.or.tco.prod.vo.ProdVO;

//?????? ????????????
@RequestMapping("/calculate")
@Controller
public class CalController {
	private static final Logger logger = LoggerFactory.getLogger(CalController.class);
	@Autowired
	CalService calService;
	@Autowired
	CustService custService;

	/**
	 * ?????? ?????? ??????
	 * 
	 * @return ?????? ?????? vo ??? ?????? list ??? ??????.
	 */
	@RequestMapping(value = "/dailyPrc", method = RequestMethod.GET)
	public String dailyPrc(Model model, 
			@RequestParam(required = false) String brnSelect,
			@RequestParam(required = false) String startDay, 
			@RequestParam(required = false) String endDay) {

		logger.info("brnSelect : " + brnSelect);
		logger.info("startDay : " + startDay);
		logger.info("endDay : " + endDay);
		// <key,value>
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("brnSelect", brnSelect);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		List<StrgWrhsVO> dailyPrc = this.calService.dailyPrc(map);
		List<CustNtsVO> dailyCustNts = this.calService.dailyCustNts(map);
		model.addAttribute("dailyPrc", dailyPrc);
		model.addAttribute("dailyCustNts", dailyCustNts);

		logger.info("dailyPrc : " + dailyPrc);
		logger.info("dailyCustNts : " + dailyCustNts);

		// forwarding
		return "calculate/dailyPrc";
	}

	// ???????????? ??????
	@ResponseBody
	@RequestMapping(value = "/dailyCalInsert", method = RequestMethod.POST)
	public String dailyCalInsert(Model model, @RequestParam(required = false) String calbrn,
			@RequestParam(required = false) int netIncome, @RequestParam(required = false) int prcsum,
			@RequestParam(required = false) int slssum) {
		// <key,value>
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("calbrn", calbrn);
		map.put("netIncome", netIncome);
		map.put("prcsum", prcsum);
		map.put("slssum", slssum);
		int result = this.calService.dailyCalInsert(map);
		model.addAttribute("dailyCalInsert", result);

		// ??????????????? ??????
		if (result > 0) {
			// forward
			return "success";
		} else { // ?????? ??????

			return "fail";
		}
	}

	// ??????????????? ???????????? ????????????
	@ResponseBody
	@RequestMapping(value = "/prodDetail", method = RequestMethod.GET)
	public ProdVO detail(Model model, @RequestParam("prodInfoNm") String prodInfoNm) {

		ProdVO prodVO = calService.prodDetail(prodInfoNm);
		logger.info("prodVO : " + prodVO);

		model.addAttribute("prodVO", prodVO);

		return prodVO;
	}

	// ?????? ??????
	@GetMapping("/prodList")
	public String prodList(Model model, @RequestParam(defaultValue = "1", required = false) int currentPage,
			@RequestParam(defaultValue = "7", required = false) int size,
			@RequestParam(required = false) String keyWord) {

		logger.info("keyWord : " + keyWord);

		// mapper??? ???????????? ?????? ??????????????? hashMap ??????
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyWord", keyWord);

		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("keyWord", keyWord);

		List<PosVO> prodList = this.calService.prodList(map);
		List<CustVO> custlist = this.custService.custQRSelect(map2);

		model.addAttribute("prodList", prodList);
		model.addAttribute("custlist", custlist);

		// forwarding
		return "calculate/prodList";
	}

	@ResponseBody
	@RequestMapping(value = "/custValChk", method = RequestMethod.POST)
	public String custValChk(Model model, @RequestParam(required = false) String custId) {
		logger.info("custId : " + custId);
		// mapper??? ???????????? ?????? ??????????????? hashMap ??????
		Map<String, String> map = new HashMap<String, String>();
		map.put("custId", custId);
		String result = this.calService.custValChk(map);
//		model.addAttribute("custId", custId);
		// ??????????????? ??????
		if (result != null) {
			// forward
			return "success";
		} else { // ?????? ??????
			return "fail";
		}
	}

	@RequestMapping(value = "/pos", method = RequestMethod.GET)
	public String pos(Model model, @RequestParam(required = false) String selectBrn,
			@RequestParam(required = false) String custId, @RequestParam(required = false) String prodInfoId,
			@RequestParam(required = false) String prodInfoNtslAmt, @RequestParam(required = false) String streStckQty,
			@RequestParam(required = false) String custNtslQty) {

		// <key,value>
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("selectBrn", selectBrn);
		map.put("custId", custId);
		map.put("prodInfoId", prodInfoId);
		map.put("prodInfoNtslAmt", prodInfoNtslAmt);
		map.put("custNtslQty", custNtslQty);

//		int CustNtsInsert = this.calService.CustNtsInsert(map);
//		model.addAttribute("CustNtsInsert",CustNtsInsert);
//		logger.info("CustNtsInsert : " + CustNtsInsert);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("streStckQty", streStckQty);
		map2.put("custNtslQty", custNtslQty);
		map2.put("selectBrn", selectBrn);
		map2.put("prodInfoId", prodInfoId);

//		int streStckDsc = this.calService.streStckDsc(map2);
//		model.addAttribute("streStckDsc",streStckDsc);
//		logger.info("streStckDsc : " + streStckDsc);

		// forwarding
		return "calculate/pos";
	}

	// pos??? ??????->????????? ?????? ?????? ajax ??????
	@ResponseBody
	@RequestMapping(value = "/CustNtsInsert", method = RequestMethod.POST)
	public String CustNtsInsert(Model model, @RequestParam(required = false) String selectBrn,
			@RequestParam(required = false) String custId, @RequestParam(required = false) String prodInfoId,
			@RequestParam(required = false) String prodInfoNtslAmt, @RequestParam(required = false) String custNtslAmt,
			@RequestParam(required = false) String custNtslQty) {
//		logger.info("selectBrn : " + selectBrn);
//		logger.info("custId : " + custId);
//		logger.info("prodInfoId : " + prodInfoId);
//		logger.info("prodInfoNtslAmt : " + prodInfoNtslAmt);
//		logger.info("custNtslAmt : " + custNtslAmt);
//		logger.info("custNtslQty : " + custNtslQty);
		// <key,value>
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("selectBrn", selectBrn);
		map.put("custId", custId);
		map.put("prodInfoId", prodInfoId);
		map.put("custNtslQty", custNtslQty);
		map.put("prodInfoNtslAmt", prodInfoNtslAmt);
		map.put("custNtslAmt", custNtslAmt);

		int CustNtsInsert = this.calService.CustNtsInsert(map);
		model.addAttribute("CustNtsInsert", CustNtsInsert);
//		logger.info("CustNtsInsert : " + CustNtsInsert);

		//////////////// ??? = ????????? ?????? ??????(????????????) /// ?????? = ?????? ?????? ??????(????????????)

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("custNtslQty", custNtslQty);
		map2.put("selectBrn", selectBrn);
		map2.put("prodInfoId", prodInfoId);

		int streStckDsc = this.calService.streStckDsc(map2);
		model.addAttribute("streStckDsc", streStckDsc);
//		logger.info("streStckDsc : " + streStckDsc);

		// ??????????????? ??????
		if (CustNtsInsert > 0 && streStckDsc > 0) {
			// forward
			return "success";
		} else { // ?????? ??????

			return "fail";
		}
	}

	// pos??? ???????????? ?????? ?????? ??????
	@ResponseBody
	@RequestMapping(value = "/salesSuspensionChk", method = RequestMethod.POST)
	public String salesSuspensionChk(Model model, @RequestParam(required = false) String prodInfoId) {
		logger.info("prodInfoId : " + prodInfoId);
		// <key,value>
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("prodInfoId", prodInfoId);

		ProdVO prodVO = new ProdVO();

		prodVO = this.calService.salesSuspensionChk(prodInfoId);
		model.addAttribute("salesSuspensionChk", prodVO);
		logger.info("salesSuspensionChk : " + prodVO);

		// ?????? ?????? ??????
		if (prodVO != null) {
			// forward
			return "success";
		} else { // ?????? ?????? ??????

			return "fail";
		}
	}

	@RequestMapping(value = "/otp/generate", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> createOtp(Locale locale, @RequestParam HashMap<String, String> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		String usrEmail = paramMap.get("email"); // ???????????? ????????? get
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ???????????? ???, map ??????
//		EmpVO updateMember = (EmpVO) session.getAttribute("userID");  // ???????????? ?????? id ??????

		SecretGenerator secretGenerator = new DefaultSecretGenerator(); // ??????????????? ??????
		String secret = secretGenerator.generate(); // ????????? String ????????? ??????

		QrData data = new QrData.Builder() // ?????????+????????? ???????????? ????????? ?????? ??? ?????????
				.label(usrEmail).secret(secret).issuer("Application Name").algorithm(HashingAlgorithm.SHA1).digits(6)
				.period(30).build();

		QrGenerator qrGenerator = new ZxingPngQrGenerator(); // ?????? ????????? QR ?????????
		byte[] imageData;
		try {
			imageData = qrGenerator.generate(data);
		} catch (QrGenerationException e) {
			// QR ?????? ?????? ?????? ??????
			return new ResponseEntity<>(resultMap, HttpStatus.BAD_REQUEST);// QR?????? ?????? ??? ?????? ?????? ???
		}

		String mimeType = qrGenerator.getImageMimeType(); // ?????????
		String dataUrl = getDataUriForImage(imageData, mimeType); // ?????????????????? + ?????????
		resultMap.put("encodedKey", secret);
		resultMap.put("url", dataUrl);
		return new ResponseEntity<>(resultMap, HttpStatus.OK); // ????????? + ?????????????????? ???????????? QR ?????? ??????, 6?????? OTP ??????
	}

	@RequestMapping(value = "/otp/verify", method = RequestMethod.POST)
	public boolean verifyOtp(Locale locale, @RequestParam HashMap<String, String> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		String encodedKey = paramMap.get("encodedKey");
		String otpNumber = paramMap.get("otpNumber");

		TimeProvider timeProvider = new SystemTimeProvider();
		CodeGenerator codeGenerator = new DefaultCodeGenerator();
		CodeVerifier verifier = new DefaultCodeVerifier(codeGenerator, timeProvider);

		boolean check = verifier.isValidCode(encodedKey, otpNumber); // ??????????????? ????????? ??? ????????? ????????? otp??? ??????

		if (check) {
			// OTP??? ????????? ?????? ??????.
		}
		return check;
	}
/////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/account/otp.do")
	public String otp(
	        @ModelAttribute("empVO") EmpVO empVO,
	        RedirectAttributes redirectAttributes,
	        HttpServletRequest request,
	        ModelMap model) throws Exception {
	 
	    byte[] buffer = new byte[5 + 5 * 5];
	    new Random().nextBytes(buffer);
	    Base32 codec = new Base32();
	    byte[] secretKey = Arrays.copyOf(buffer, 10);  //16??? ????????????????????? 10?????? ?????? ??????
	    byte[] bEncodedKey = codec.encode(secretKey);
	     
	    //????????? ??????
	    String encodedKey = new String(bEncodedKey); 
	    //????????? ?????? ??????
	    String QrUrl = getQRBarcodeURL1("admin", "facbank", encodedKey); 
	     
	    model.addAttribute("encodedKey", encodedKey);
	    model.addAttribute("QrUrl", QrUrl);
	 
	 return "/account/login/otp";
	}
	 
	 
	//????????? ?????? ??????
	public static String getQRBarcodeURL1(String user, String host, String secret) {
	    String format = "http://chart.apis.google.com/chart?cht=qr&amp;chs=300x300&amp;chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&amp;chld=H|0";
	     
	    return String.format(format, user, host, secret);
	}
	
	//OTP ?????? ????????????
	@RequestMapping(value ="/adms/stat/status/list.do")
	public String statList(@ModelAttribute("searchVO") EmpVO searchVO, HttpServletRequest request, ModelMap model) throws Exception {
	try{
		String code = request.getParameter("code");
		long codeCheck = Integer.parseInt(code);
		String encodedKey = request.getParameter("encodedKey");
		long l = new Date().getTime();
		long ll =  l / 30000;
		 
		boolean check_code = false;
		check_code = check_code(encodedKey, codeCheck, ll);
		 
		if(!check_code) {
		    model.addAttribute("errorMsg", "????????? ???????????? ????????????.");
		    
		    byte[] buffer = new byte[5 + 5 * 5];
		    new Random().nextBytes(buffer);
		    Base32 codec = new Base32();
		    byte[] secretKey = Arrays.copyOf(buffer, 10);
		    byte[] bEncodedKey = codec.encode(secretKey);
		     
		    //????????? ??????
		    String encodedKey2 = new String(bEncodedKey); 
		    //????????? ?????? ??????
		    String QrUrl = getQRBarcodeURL1("admin", "facbank", encodedKey2); 
		     
		    model.addAttribute("encodedKey", encodedKey2);
		    model.addAttribute("QrUrl", QrUrl);
		    
		    
		    return "/login/otp";
		}
			 
		}catch(Exception e){
		System.out.println(e.toString());
		}
		 
	return "tiles:adms/stat/status/list";
	}
	 
	 
	//????????? ?????? ??????
	public static String getQRBarcodeURL(String user, String host, String secret) {
	  String format = "http://chart.apis.google.com/chart?cht=qr&amp;chs=300x300&amp;chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&amp;chld=H|0";
	   
	  return String.format(format, user, host, secret);
	}
	 
	//?????? ?????? ??????
	private static boolean check_code(String secret, long code, long t) throws InvalidKeyException, NoSuchAlgorithmException {
	  Base32 codec = new Base32();
	  byte[] decodedKey = codec.decode(secret);
	 
	  int window = 3;
	  for (int i = -window; i <= window; ++i) {
	      long hash = verify_code(decodedKey, t + i);
	 
	      if (hash == code) {
	          return true;
	      }
	  }
	 
	  return false;
	}
	 
	//?????? ?????? ??????
	private static int verify_code(byte[] key, long t) throws NoSuchAlgorithmException, InvalidKeyException{
	  byte[] data = new byte[8];
	  long value = t;
	  for (int i = 8; i-- > 0; value >>>= 8) {
	      data[i] = (byte) value;
	  }
	 
	  SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
	  Mac mac = Mac.getInstance("HmacSHA1");
	  mac.init(signKey);
	  byte[] hash = mac.doFinal(data);
	 
	  int offset = hash[20 - 1] & 0xF;
	 
	  long truncatedHash = 0;
	  for (int i = 0; i < 4; ++i) {
	      truncatedHash <<= 8;
	      truncatedHash |= (hash[offset + i] & 0xFF);
	  }
	 
	  truncatedHash &= 0x7FFFFFFF;
	  truncatedHash %= 1000000;
	 
	  return (int) truncatedHash;
	}

	

}
