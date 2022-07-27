package com.kh.tamnaji.space.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SpaceFacility {
	
    private int sfNo; 				// 공간 편의시설 번호
    private String facilityName; 	// 공간 편의시설 이름
    private String categoryDetail; 	// 공간 카테고리 상세
    private String originName;
    private String changeName;
}
