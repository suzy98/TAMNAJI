package com.kh.tamnaji.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tamnaji.board.model.vo.Notice;

@Repository
public class NoticeDao {

	// 공지사항 전체 조회 서비스 + 페이징 처리
	// 공지사항 전체 조회 (select)
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("noticeMapper.selectList");
	}
	
	// 공지사항 상세 조회 (select)
	public Notice selectNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.selectOne("noticeMapper.selectNotice", nno);
	}
	
	// 공지사항 작성 (insert)
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	// 공지사항 삭제 (update)
	public int deleteNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.deleteNotice", nno);
	}
	
	// 공지사항 수정 (update)
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
}
