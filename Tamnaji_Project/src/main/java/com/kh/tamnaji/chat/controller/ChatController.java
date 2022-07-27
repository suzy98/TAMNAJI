package com.kh.tamnaji.chat.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.tamnaji.chat.model.service.ChatService;
import com.kh.tamnaji.chat.model.vo.ChatMessage;
import com.kh.tamnaji.chat.model.vo.ChatRoom;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@ResponseBody
	@RequestMapping("searchChatRoom.ch")
	public ArrayList<ChatRoom> searchChatRoom(String memberId, HttpSession session) {
		
		ArrayList<ChatRoom> list = chatService.selectChatRoom(memberId);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("createChatRoom.ch")
	public int createChatRoom(String senderId) {
		
		int result = chatService.createChatRoom(senderId);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("selectChatMessage.ch")
	public ArrayList<ChatMessage> selectChatMessageList(int roomNo) {
		
		ArrayList<ChatMessage> messageList = chatService.selectChatMessageList(roomNo);
		return messageList;
	}
	
	@ResponseBody
	@PostMapping(value="listview.ch", produces="application/json; charset=UTF-8")
	public ArrayList<ChatRoom> ajaxselectChatRoomList(String memberId) {
		
		ArrayList<ChatRoom> list =  chatService.selectChatRoomList(memberId);
		return list;
	}
	
	@ResponseBody
	@PostMapping(value="listdetail.ch", produces="application/json; charset=UTF-8")
	public ArrayList<ChatMessage> ajaxselectChatMessageList(int chatRoomNo) {
		
		ArrayList<ChatMessage> list = chatService.selectChatMessageList(chatRoomNo);
	
		return list;
	}

}