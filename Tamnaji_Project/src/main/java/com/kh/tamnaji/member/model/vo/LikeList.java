package com.kh.tamnaji.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class LikeList {
	private String memberId;
	private String originName;
	private String changeName;
	private String spaceDiscription;
	private int spaceNo;
}
