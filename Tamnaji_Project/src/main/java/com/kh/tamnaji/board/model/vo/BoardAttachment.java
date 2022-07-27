package com.kh.tamnaji.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardAttachment {

	private int baNo; // BA_NO
	private int boardNo; // BOARD_NO
	private int step; // STEP
	private String originName; // ORIGIN_NAME
	private String changeName; // CHANGE_NAME

}
