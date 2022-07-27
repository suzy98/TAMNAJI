package com.kh.tamnaji.chat.model.service;

import java.util.ArrayList;

import com.kh.tamnaji.chat.model.vo.ChatMessage;
import com.kh.tamnaji.chat.model.vo.ChatRoom;

public interface ChatService {
	
		// 채팅방 유무 확인용
		ArrayList<ChatRoom> selectChatRoom(String memberId);
		
		// 채팅방 생성
		int createChatRoom(String memberId);
		
		// 채팅방 전체 조회
		ArrayList<ChatRoom> selectChatRoomList(String memberId);
		
		// 내가 확인하지 않은 메시지 몇개인지 조회
		int selectUnReacCount(int roomNo);
		
		// 채팅 메시지 전체 조회
		ArrayList<ChatMessage> selectChatMessageList(int chatRoomNo);
		
		// 안읽은 메시지를 확인 메시지로 변경
		int updateUnRead(ChatMessage message);
		
		// 메시지 저장
		int insertChatMessage(ChatMessage message);



}