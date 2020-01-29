package com.cos.board.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.cos.board.Model.MailAddress;

public class Sendmail {
	public static void gmailSend(HttpServletRequest req) {
		String user = "yndgapdlf@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		String password = "791346qwOP!@"; // 패스워드

		// SMTP 서버 정보를 설정한다.
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));

			
			// 수신자메일주소
//			message.addRecipient(Message.RecipientType.TO, new InternetAddress("tagetwin@naver.com"));

//			String[] mail = req.getParameter("mail");
			
//			for(int i = 0; i<mail.length; i++) {
//				message.setRecipient(Message.RecipientType.TO, new InternetAddress(mail[i]));
//				System.out.println("mail :"+mail[i]);
//				Transport.send(message); //// 전송
//			}
			
//			message.addRecipients(Message.RecipientType.TO, addArray);
//			InternetAddress [] addArray = new InternetAddress[i];
//			addArray[0] = new InternetAddress("ktko0@ktko0.com");
//			addArray[1] = new InternetAddress("ktko1@ktko1.com");
//			addArray[2] = new InternetAddress("ktko2@ktko2.com");
//			addArray[3] = new InternetAddress("ktko3@ktko3.com");
//			addArray[4] = new InternetAddress("ktko4@ktko4.com");

			String mailTitle = req.getParameter("mailTitle");
			String mailContent = req.getParameter("mailContent");
			
			// Subject
			message.setSubject(mailTitle); // 메일 제목을 입력

			// Text
			message.setText(mailContent); // 메일 내용을 입력

			// send the message
//			Transport.send(message); //// 전송
			System.out.println("message sent successfully...");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
