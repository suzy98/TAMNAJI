package com.kh.tamnaji.space.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SpaceAttachment {
    private int saNo;
    private int spaceNo;
    private int step;
    private String originName;
    private String changeName;
}
