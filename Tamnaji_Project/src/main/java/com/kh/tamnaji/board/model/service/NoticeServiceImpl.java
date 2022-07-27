package com.kh.tamnaji.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tamnaji.board.model.dao.NoticeDao;
import com.kh.tamnaji.board.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 공지사항 전체 조회 서비스 + 페이징 처리
	// 공지사항 전체 조회 (select)
	@Override
	public ArrayList<Notice> selectList() {
		return noticeDao.selectList(sqlSession);
	}
	
	// 공지사항 상세 조회 서비스 (select)
	@Override
	public Notice selectNotice(int nno) {
		return noticeDao.selectNotice(sqlSession, nno);
	}
	
	// 공지사항 작성 서비스 (insert)
	@Override
	public int insertNotice(Notice n) {
		return noticeDao.insertNotice(sqlSession, n);
	}
	
	// 공지사항 삭제 서비스 (update)
	@Override
	public int deleteNotice(int nno) {
		return noticeDao.deleteNotice(sqlSession, nno);
	}
	
	// 공지사항 수정 서비스 (update)
	@Override
	public int updateNotice(Notice n) {
		return noticeDao.updateNotice(sqlSession, n);
	}
	
}
