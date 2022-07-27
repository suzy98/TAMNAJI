package com.kh.tamnaji.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Board {

	private int boardNo; // BOARD_NO NUMBER PRIMARY KEY,
	private String nickname;
	private int boardWriter; // BOARD_WRITER NUMBER NOT NULL,
	private String boardTitle; // BOARD_TITLE VARCHAR2(500) NOT NULL,
	private String boardContent; // BOARD_CONTENT VARCHAR2(1000) NOT NULL,
	// Date 로 받아야하나?
	private String createDate; // CREATE_DATE DATE DEFAULT SYSDATE,
	private String status; // STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
	private int viewCount; // VIEW_COUNT NUMBER DEFAULT 0,

}
