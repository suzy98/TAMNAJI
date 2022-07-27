package com.kh.tamnaji.reservation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Reservation {

	private String orderId, paymentMethod, memberNo;

	private String tid, roomTitle;
	private String checkInDate, checkOutDate;
	private int stayPeriod;
	private String reservationName;

	private String spaceDescription;
	private int spaceNo, roomNo;

	private int peopleCount;
	private String paymentType, bedType;
	private Integer price;
	private String status, payStatus, payload;

	private String approveDate, cancelDate, startDate, endDate;
  
	private String originName;
	private String changeName;
	
	// 추가
	private String spaceTitle, memberWriter;
	private String spaceRoomTitle;
	private String phone, email;
	private String bankName, accountName, accountNumber;
	private String address;
	
	private String sellerName;
	private String sellerPhone;
	
}