package com.kh.tamnaji.room.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.room.model.dao.RoomDao;
import com.kh.tamnaji.room.model.vo.RoomVO;

@Service
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<RoomVO> roomGets(int spaceNo) {
		return roomDao.roomGets(sqlSession, spaceNo);
	}

	@Override
	public RoomVO roomGet(Map<String, String> body) {
		return roomDao.roomGet(sqlSession, body);
	}
	

	@Override
	public int roomPost(RoomVO room) {
		return roomDao.roomPost(sqlSession, room);
	}
	
	@Override
	public int roomPut(RoomVO room) {
		return roomDao.roomPut(sqlSession, room);
	}

	@Override
	public int roomDelete(int roomNo) {
		return roomDao.roomDelete(sqlSession, roomNo);
	}

	@Override
	public ArrayList<RoomVO> adminRoomGets(PageInfo pi) {
		return roomDao.adminRoomGets(sqlSession, pi);
	}

    @Override
    public int roomInsert(RoomVO room) {
        return roomDao.roomInsert(sqlSession, room);
    }

	@Override
	public ArrayList<RoomVO> selectRoomList(int spaceNo) {
		return roomDao.selectRoomList(sqlSession, spaceNo);
	}

	@Override
	public RoomVO selectRoom(int roomNo) {
		return roomDao.selectRoom(sqlSession, roomNo);
	}

}
