package kr.or.tco;

import dev.samstevens.totp.code.CodeGenerator;
import dev.samstevens.totp.code.CodeVerifier;
import dev.samstevens.totp.code.DefaultCodeGenerator;
import dev.samstevens.totp.code.DefaultCodeVerifier;
import dev.samstevens.totp.time.SystemTimeProvider;
import dev.samstevens.totp.time.TimeProvider;

class TotpTest2 {

	public boolean verifyQR(String secret, String key) {
		TimeProvider timeProvider = new SystemTimeProvider();
		CodeGenerator codeGenerator = new DefaultCodeGenerator();
		CodeVerifier verifier = new DefaultCodeVerifier(codeGenerator, timeProvider);

		return verifier.isValidCode(secret, key);
	}

	public static void main(String[] args) {
		TotpTest2 totp = new TotpTest2();

		boolean res = totp.verifyQR(

				"TYGBKCS34K52FY2LC5WKS3WURPOAEFSX",

				"159037"

		);

		System.out.println("result : " + res);
	}

}
