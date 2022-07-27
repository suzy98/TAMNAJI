package com.kh.tamnaji.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatRoom {
	
	private int chatRoomNo;   // 채팅방 번호
	private String senderId;     // 보내는 사람
	private String receiverId;       // 받는사람
	// MEMBER TABLE USER_ID => MEMBER_ID로 ??
	// CHATROOM 테이블에 없는 필드
	private int unReadCount; // 

}