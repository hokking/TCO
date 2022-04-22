package kr.or.tco.cust.vo;

import org.springframework.web.multipart.MultipartFile;

public class CkEditorVO {
	private static String attach_path;
	private static MultipartFile upload;
	private static String filename;
	private static String CKEditorFuncNum;

	public static String getAttach_path() {
		return attach_path;
	}

	public static void setAttach_path(String attach_path) {
		CkEditorVO.attach_path = attach_path;
	}

	public static MultipartFile getUpload() {
		return upload;
	}

	public static void setUpload(MultipartFile upload) {
		CkEditorVO.upload = upload;
	}

	public static String getFilename() {
		return filename;
	}

	public static void setFilename(String filename) {
		CkEditorVO.filename = filename;
	}

	public static String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}

	public static void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}

}
