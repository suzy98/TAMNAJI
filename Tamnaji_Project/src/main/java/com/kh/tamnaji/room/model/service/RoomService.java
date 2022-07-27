package com.kh.tamnaji.room.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.room.model.vo.RoomVO;

public interface RoomService {
	
	// 룸 리스트조회
	ArrayList<RoomVO> roomGets(int spaceNo);
	
	// 룸 단일조회
	RoomVO roomGet(Map<String, String> body);
	
	// 룸 생성
	int roomPost(RoomVO room);
	
	// 룸 정보 수정
	int roomPut(RoomVO room);

	// 룸 삭제
	int roomDelete(int roomNo);
	
	// 관리자 조회
    public ArrayList<RoomVO> adminRoomGets(PageInfo pi);

    //객실 등록
    int roomInsert(RoomVO room);

	ArrayList<RoomVO> selectRoomList(int spaceNo);

	RoomVO selectRoom(int roomNo);
}
