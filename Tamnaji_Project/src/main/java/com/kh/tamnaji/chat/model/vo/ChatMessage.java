package com.kh.tamnaji.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatMessage {
	
	private int messageNo;     // 메시지 번호
	private int chatRoomNo;    // 채팅방 번호
	private String senderId;   // 송신자
	private String content;    // 메시지 내용
	private String chatTime;   // 전송 시간
	private String unRead;     // 확인 여부
	
	private String nickname;

}