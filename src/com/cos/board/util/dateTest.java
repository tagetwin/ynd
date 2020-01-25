package com.cos.board.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class dateTest {
	public static void main(String[] args){
		String textDate = "2007-07-22";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(textDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("date: "+date);
		
		 SimpleDateFormat format1 = new SimpleDateFormat("yyyy년MM월dd일");
		 String dateString = format1.format(date);
		 System.out.println("dateString :"+dateString);
		
	}
}
