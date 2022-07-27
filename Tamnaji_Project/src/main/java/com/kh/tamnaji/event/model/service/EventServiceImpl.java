package com.kh.tamnaji.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.event.model.dao.EventDao;
import com.kh.tamnaji.event.model.vo.Event;

@Service
public class EventServiceImpl implements EventService {
    @Autowired
    private EventDao eventDao;

    @Autowired
    private SqlSessionTemplate sqlSession;

    // 이벤트 리스트 조회 서비스 + 페이징 처리
    // 이벤트 총 갯수 조회
    @Override
    public int selectListCount() {
        return eventDao.selectListCount(sqlSession);
    }

    // 이벤트 리스트 조회
    @Override
    public ArrayList<Event> selectList(PageInfo pi) {
        return eventDao.selectList(sqlSession,pi);
    }

    // 이벤트 추가
    @Override
    public int insertEvent(Event ev) {
        return eventDao.insertEvent(sqlSession, ev);
    }

    // 이벤트 삭제
    @Override
    public int deleteEvent(int eventNo) {
        return eventDao.deleteEvent(sqlSession, eventNo);
    }

    // 이벤트 상세 조회
    @Override
    public Event selectEvent(int eventNo) {
        return eventDao.selectEvent(sqlSession, eventNo);
    }

    //이벤트 수정
    @Override
    public int updateEvent(Event ev) {
        return eventDao.updateEvent(sqlSession, ev);
    }

}
