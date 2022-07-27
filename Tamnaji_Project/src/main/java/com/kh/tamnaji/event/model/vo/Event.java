package com.kh.tamnaji.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Event {
    private int eventNo; //이벤트 번호
    private String eventWriter; //작성자
    private String eventTitle; //이벤트명
    private String eventContent; //이벤트 내용
    private String status; //이벤트 상태
    private String originName; //첨부파일 원본명
    private String changeName; //첨부파일 수정명
    private String startDate; //이벤트 시작일
    private String endDate; //이벤트 종료일
    private String post; //이벤트 게시 상태 (진행전, 진행중, 종료)
}
