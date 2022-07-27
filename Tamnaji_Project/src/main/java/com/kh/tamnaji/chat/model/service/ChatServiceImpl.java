 package com.kh.tamnaji.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tamnaji.chat.model.dao.ChatDao;
import com.kh.tamnaji.chat.model.vo.ChatMessage;
import com.kh.tamnaji.chat.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<ChatRoom> selectChatRoom(String memberId) {
		return chatDao.selectChatRoom(sqlSession, memberId);
	}

	@Override
	public int createChatRoom(String memberId) {
		return chatDao.createChatRoom(sqlSession, memberId);
	}

	@Override
	public ArrayList<ChatRoom> selectChatRoomList(String memberId) {

		return chatDao.selectChatRoomList(sqlSession, memberId);
	}

	@Override
	public int selectUnReacCount(int chatRoomNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ChatMessage> selectChatMessageList(int chatRoomNo) {
		
		return chatDao.selectChatMessageList(sqlSession, chatRoomNo);
	}

	@Override
	public int updateUnRead(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertChatMessage(ChatMessage message) {
		return chatDao.insertChatMessage(sqlSession, message);
	}

}