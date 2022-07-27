package com.kh.tamnaji.member.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	
	private int reviewNo;
	private String orderId;
	private String spaceTitle, roomTitle;
	private int roomNo;
	private String reviewContent;
	private String reportContent;
	private String originName;
	private String changeName;
	private Date createDate;
	private String reviewStatus;
	private String grade2; /* 나의 예약용 */
	private int grade; /* 나의 리뷰내역 용 */
}
