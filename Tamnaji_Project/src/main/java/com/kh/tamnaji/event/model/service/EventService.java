package com.kh.tamnaji.event.model.service;

import java.util.ArrayList;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.event.model.vo.Event;

public interface EventService {
    // 이벤트 리스트 조회 서비스 + 페이징 처리
    // 이벤트 총 갯수 조회
    int selectListCount();

    // 이벤트 리스트 조회
    ArrayList<Event> selectList(PageInfo pi);

    //이벤트 추가
	int insertEvent(Event ev);

    //이벤트 삭제
    int deleteEvent(int eventNo);

    //이벤트 상세 조회
    Event selectEvent(int eventNo);

    //이벤트 수정
    int updateEvent(Event ev);

}
