package com.kh.tamnaji.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tamnaji.board.model.dao.BoardDao;
import com.kh.tamnaji.board.model.vo.Board;
import com.kh.tamnaji.board.model.vo.BoardAttachment;
import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.reply.model.vo.Reply;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return boardDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {
		return boardDao.insertBoard(sqlSession, b);
	}
	
	@Override
	public int insertBoardAttachment(BoardAttachment ba) {
		return boardDao.insertBoardAttachment(sqlSession, ba);
	}
	
	@Override
	public int updateBoardAttachment(BoardAttachment ba) {
		return boardDao.updateBoardAttachment(sqlSession, ba);
	}
	
	@Override
	public int reinsertBoardAttachment(BoardAttachment ba) {
		return boardDao.reinsertBoardAttachment(sqlSession, ba);
	}

	@Override
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public BoardAttachment selectBoardAttachment(int boardNo) {
		return boardDao.selectBoardAttachment(sqlSession, boardNo);
	}
	
	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int updateBoard(Board b) {
		return boardDao.updateBoard(sqlSession, b);
	}
	
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return boardDao.selectReplyList(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Reply r) {
		return boardDao.insertReply(sqlSession, r);
	}

	@Override
	public int deleteReply(int replyNo) {
		return boardDao.deleteReply(sqlSession, replyNo);
	}






	

}
