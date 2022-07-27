package com.kh.tamnaji.reservation.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class OrderVO implements Cloneable{
	
	private String orderId;
	private int spaceNo; // 판매자는 스페이스번호를 가지고 db검색!!!!!
	private int roomNo;
	private String checkInDate, checkOutDate;
	private int peopleCount;
	private int stayPeriod;
	private int MemberNo; // 예약하는 회원!!!!!!!!
	private String payload;
	private String tid;
	private String memberId, paymentMethod;
	private String reservationName;
	private String item_name;
	private String quantity;
	private String total_amount;

	private String payStatus;
	
	// 2차 수정
	private String phone, email;
	private String bankName, accountName, accountNumber;
	private String address;
	
	private String spaceRoomTitle;
	
}

