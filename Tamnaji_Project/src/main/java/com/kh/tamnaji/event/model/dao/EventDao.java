package com.kh.tamnaji.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.event.model.vo.Event;

@Repository
public class EventDao {

    // 이벤트 리스트 조회 서비스 + 페이징 처리
    // 이벤트 총 갯수 조회
    public int selectListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("eventMapper.selectListCount");
    }

    // 이벤트 리스트 조회
    public ArrayList<Event> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);

        return (ArrayList) sqlSession.selectList("eventMapper.selectList", null, rowBounds);
    }

    // 이벤트 추가
    public int insertEvent(SqlSessionTemplate sqlSession, Event ev) {
        return sqlSession.insert("eventMapper.insertEvent", ev);
    }

    // 이벤트 삭제
    public int deleteEvent(SqlSessionTemplate sqlSession, int eventNo) {
        return sqlSession.update("eventMapper.deleteEvent",eventNo);
    }

    // 이벤트 상세 조회
    public Event selectEvent(SqlSessionTemplate sqlSession, int eventNo) {
        return sqlSession.selectOne("eventMapper.selectEvent", eventNo);
    }

    //이벤트 수정
    public int updateEvent(SqlSessionTemplate sqlSession, Event ev) {
        return sqlSession.update("eventMapper.updateEvent",ev);
    }

}
