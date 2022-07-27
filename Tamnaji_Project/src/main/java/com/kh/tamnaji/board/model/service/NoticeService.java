package com.kh.tamnaji.board.model.service;

import java.util.ArrayList;

import com.kh.tamnaji.board.model.vo.Notice;

public interface NoticeService {

	// 공지사항 전체 조회 서비스 + 페이징 처리
	// 공지사항 전체 조회 (select)
	ArrayList<Notice> selectList();
	
	// 공지사항 상세 조회 서비스 (select)
	Notice selectNotice(int nno);
	
	// 공지사항 작성 서비스 (insert)
	int insertNotice(Notice n);
	
	// 공지사항 삭제 서비스 (update)
	int deleteNotice(int nno);
	
	// 공지사항 수정 서비스 (update)
	int updateNotice(Notice n);
	
}
