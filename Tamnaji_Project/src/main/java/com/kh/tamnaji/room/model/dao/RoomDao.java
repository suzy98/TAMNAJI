package com.kh.tamnaji.room.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.room.model.vo.RoomVO;

@Repository
public class RoomDao {

	public ArrayList<RoomVO> roomGets(SqlSession sqlSession, int spaceNo) {
		return (ArrayList)sqlSession.selectList("roomMapper.roomGets", spaceNo);
	}

	public RoomVO roomGet(SqlSession sqlSession, Map<String, String> body) {
		return sqlSession.selectOne("roomMapper.roomGet", body);
	}
	
	public int roomPost(SqlSession sqlSession, RoomVO room) {
		return 0;//sqlSession.insert("roomMapper.roomPost", room);
	}
	
	public int roomPut(SqlSession sqlSession, RoomVO room) {
		return 0;//sqlSession.update("roomMapper.roomPut", room);
	}

	public int roomDelete(SqlSession sqlSession, int roomNo) {
		return 0;//sqlSession.update("roomMapper.roomDelete", roomNo);
		
	}

	/// 관리자 조회
	
	public ArrayList<RoomVO> adminRoomGets(SqlSession sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("roomMapper.roomGets", null, rowBounds);
	}

    public int roomInsert(SqlSession sqlSession, RoomVO room) {
        return sqlSession.insert("roomMapper.roomInsert", room);
    }

	public ArrayList<RoomVO> selectRoomList(SqlSession sqlSession, int spaceNo) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectRoomList", spaceNo);
	}

	public RoomVO selectRoom(SqlSession sqlSession, int roomNo) {
		return sqlSession.selectOne("roomMapper.selectRoom", roomNo);
	}

}
