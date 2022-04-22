package kr.or.tco;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.digest.Sha2Crypt;

public class PasswordTest {
	public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException {
		String userId = "test";
		String password = "qwer1234!";
		
//		System.out.println(Sha2Crypt.sha256Crypt(password.getBytes()));
//		System.out.println(Sha2Crypt.sha256Crypt(password.getBytes()));
//		System.out.println(Sha2Crypt.sha256Crypt(password.getBytes(), "$5$"+userId));
//		System.out.println(Sha2Crypt.sha256Crypt(password.getBytes(), "$5$admin"));
		
		
		AES256Utils aes256Utils= new AES256Utils();
		String telNo = "010-123-4567";
		
		String  encTelNo = aes256Utils.encrypt(telNo);
		System.out.println(encTelNo);
		System.out.println(aes256Utils.decrypt(encTelNo));
		
	}
}
