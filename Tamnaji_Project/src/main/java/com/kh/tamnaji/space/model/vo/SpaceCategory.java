package com.kh.tamnaji.space.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SpaceCategory {
    private int spType; 			// 공간 카테고리 식별자
    private String categoryName; 	// 공간 카테고리 이름
    private String categoryDetail;  // 공간 카테고리 상세
    private int spaceNo; //SPACE_NO	NUMBER
    private String originName;
    private String changeName;
}
