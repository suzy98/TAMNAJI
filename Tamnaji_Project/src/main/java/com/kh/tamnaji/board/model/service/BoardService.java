package com.kh.tamnaji.board.model.service;

import java.util.ArrayList;

import com.kh.tamnaji.board.model.vo.Board;
import com.kh.tamnaji.board.model.vo.BoardAttachment;
import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.reply.model.vo.Reply;

public interface BoardService {
	
	// 게시판 리스트 조회 서비스 + 페이징 처리
	// 게시글 총 갯수 조회
	int selectListCount();
	// 게시글 리스트 조회
	ArrayList<Board> selectList(PageInfo pi);

	// 게시글 작성하기 서비스
	int insertBoard(Board b);
	// 게시글 첨부파일 처리 서비스
	int insertBoardAttachment(BoardAttachment ba);
	// 게시글 첨부파일 수정하기 서비스
	int updateBoardAttachment(BoardAttachment ba);
	
	int reinsertBoardAttachment(BoardAttachment ba);

	
	// 게시글 상세조회 서비스
	// 게시글 조회수 증가
	int increaseCount(int boardNo);
	// 게시글 상세 조회
	Board selectBoard(int boardNo);
	// 게시글 첨부파일 조회
	BoardAttachment selectBoardAttachment(int boardNo);
	
	// 게시글 삭제 서비스
	int deleteBoard(int boardNo);
	
	// 게시글 수정 서비스
	int updateBoard(Board b);
	
	// 댓글 리스트 조회 서비스 (Ajax)
	ArrayList<Reply> selectReplyList(int boardNo);
		
	// 댓글 작성 서비스
	int insertReply(Reply r);
	
	// 댓글 삭제 서비스
	int deleteReply(int replyNo);
	
	
	
}
