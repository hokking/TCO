package kr.or.tco;

import static dev.samstevens.totp.util.Utils.getDataUriForImage;

import java.util.Scanner;

import dev.samstevens.totp.code.HashingAlgorithm;
import dev.samstevens.totp.exceptions.QrGenerationException;
import dev.samstevens.totp.qr.QrData;
import dev.samstevens.totp.qr.QrGenerator;
import dev.samstevens.totp.qr.ZxingPngQrGenerator;
import dev.samstevens.totp.secret.DefaultSecretGenerator;
import dev.samstevens.totp.secret.SecretGenerator;

class TotpTest {

	private String dataUrl;
	private String secret;

	public String generateSecret(String email) {
		SecretGenerator secretGenerator = new DefaultSecretGenerator();
		secret = secretGenerator.generate();

		QrData data = new QrData.Builder().label(email).secret(secret).issuer("TOTP Test")
				.algorithm(HashingAlgorithm.SHA1).digits(6).period(30).build();

		System.out.println();
		byte[] imageData;

		QrGenerator generator = new ZxingPngQrGenerator();
		try {
			imageData = generator.generate(data);
		} catch (QrGenerationException e) {
			e.printStackTrace();
			return "";
		}

		String mimeType = generator.getImageMimeType();

		dataUrl = getDataUriForImage(imageData, mimeType);

		return secret;
	}

	public String getDataUrl() {
		return dataUrl;
	}

	public static void main(String[] args) {

		TotpTest totp = new TotpTest();
		Scanner sc = new Scanner(System.in);
//		System.out.print("Input your email : ");
		String secret = totp.generateSecret("pooyttl@naver.com");

		System.out.println("your secret code : " + secret);
		System.out.println("your QR url : " + totp.getDataUrl());

	}

}
