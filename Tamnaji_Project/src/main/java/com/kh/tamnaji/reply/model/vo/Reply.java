package com.kh.tamnaji.reply.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reply {
	// service, dao 는 필요없다 생각해서 지웠으나 필요하면 추가할것
	// 자유게시판 댓글, 공간 리뷰를 관리하고자 따로 패키지를 뺐음
	// 강사님이 알려준건 게시판 댓글만 있어서 이거랑 좀 다름
	private int replyNo; // REPLY_NO NUMBER PRIMARY KEY,
	private int boardNo; // BOARD_NO NUMBER NOT NULL,
	private int memberNo; // MEMBER_NO NUMBER NOT NULL,
	private String replyContent; // REPLY_CONTENT VARCHAR2(1000),
	private String status; // STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')),
	private String createDate; // CREATE_DATE DATE DEFAULT SYSDATE,
	private String nickname;


}
