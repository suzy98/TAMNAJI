package com.kh.tamnaji.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {

	private int memberNo;
	private String orderId;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String gender;
	private String birthday;
	private String nickname;
	private String introduce;
	private String phone;
	private String bankName;
	private String accountNumber;
	private String originName;
	private String changeName;
	private int reportCount;
	private Date enrollDate;
	private String sellerYN;
	private String sellerRequestYN;
	private String status;
	private String blacklistYN;
	
}