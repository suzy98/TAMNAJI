package com.kh.tamnaji.space.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Space {
	
	private int spaceNo;
	private String spType; // SP_TYPE NUMBER NOT NULL,
	private int memberNo; // MEMBER_NO NUMBER NOT NULL,
	private String memberWriter; // MEMBER_NO NUMBER NOT NULL,
	private String sellerName; // MEMBER_NO NUMBER NOT NULL,
	
	
	private String categoryName, categoryDetail; // SP_TYPE NUMBER NOT NULL,
	private String spaceTitle; // SPACE_TITLE VARCHAR2(100) NOT NULL,
	private String spaceSubTitle; // SPACE_SUBTITLE VARCHAR2(500),
	private String spaceDescription; // SPACE_DISCRIPTION VARCHAR2(1000) NOT NULL,
	private String address; // ADDRESS VARCHAR2(500) NOT NULL,
	private String latitude; 
	private String longitude; 
	private String hashtag; // HASHTAG VARCHAR2(1000) NOT NULL,
	private String status; // STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y','N')),

	private int count;
	
	private String originName;
    private String changeName;
    private int price;
    private String phone;
    private String nickName;
    
    private int likeCount;
    private int gradeAVG;
    private int myLikeListYN;
	
}
