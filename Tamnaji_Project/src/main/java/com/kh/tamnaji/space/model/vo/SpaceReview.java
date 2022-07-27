package com.kh.tamnaji.space.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SpaceReview {

	private int reviewNo;
	private int spaceNo;
	private String orderId;
	private String reviewContent;
	private String reportContent;
	private String createDate;
	private String reviewStatus;
	private int grade;
	private String changeName;
	private String nickname;
	
}
