package com.kh.tamnaji.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tamnaji.chat.model.vo.ChatMessage;
import com.kh.tamnaji.chat.model.vo.ChatRoom;

@Repository
public class ChatDao {

	// 채팅방 유무 확인겸 한방에 같이 불러오기
	public ArrayList<ChatRoom> selectChatRoom(SqlSessionTemplate sqlSession, String memberId) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatRoom", memberId);
	}
	
	// 채팅방 생성
//	public int createChatRoom(SqlSessionTemplate sqlSession, ChatRoom room) {return 0;}
	public int createChatRoom(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.insert("chatMapper.insertChatRoom", userId);
	}
		
	// 채팅방 전체 조회
	public ArrayList<ChatRoom> selectChatRoomList(SqlSessionTemplate sqlSession, String memberId) {
			
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatRoomList", memberId);	
	}
		
	// 내가 확인하지 않은 메시지 몇개인지 조회
	public int selectUnReacCount(SqlSessionTemplate sqlSession, int roomNo) {
		return 0;
	}
		
	// 채팅 메시지 전체 조회
	public ArrayList<ChatMessage> selectChatMessageList(SqlSessionTemplate sqlSession, int chatRoomNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatMessageList", chatRoomNo);
	}
		
	// 안읽은 메시지를 확인 메시지로 변경
	public int updateUnRead(SqlSessionTemplate sqlSession, ChatMessage message) {
		return 0;
	}
		
	// 메시지 저장
	public int insertChatMessage(SqlSessionTemplate sqlSession, ChatMessage message) {
		return sqlSession.insert("chatMapper.insertChatMessage", message);
	}

	

	public int searchChatRoom(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("chatMapper.selectChatRoom", memberId);
	}

}