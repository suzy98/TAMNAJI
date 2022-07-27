package com.kh.tamnaji.room.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class RoomVO {
	
	private int roomNo;
	private int spaceNo; // SPACE_NO NUMBER
	

	private String spaceTitle;
	private String spaceSeller;
	
	private String roomTitle; // ROOM_TITLE	VARCHAR2(100 BYTE)
	private String bedType; // BED_TYPE	VARCHAR2(100 BYTE)
	private int bedCount; // BED_COUNT	NUMBER
	private String status; // STATUS	VARCHAR2(1 BYTE)
	private String startDate; // START_DATE	DATE
	private String endDate; // END_DATE	DATE
	private int price; // LOWSEASON_PRICE	NUMBER
	private int peopleCount; // PEOPLE_COUNT	NUMBER
	private String originName; // ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String changeName; // CHANGE_NAME	VARCHAR2(100 BYTE)

	private String spaceDescription;
	private String payStatus;
	
}
