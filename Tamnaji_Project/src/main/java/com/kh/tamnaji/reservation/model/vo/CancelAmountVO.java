package com.kh.tamnaji.reservation.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class CancelAmountVO {
	private Integer total; //	Integer	이번 요청으로 취소된 전체 금액
	private Integer tax_free; //	Integer	이번 요청으로 취소된 비과세 금액
	private Integer vat; //	Integer	이번 요청으로 취소된 부가세 금액
	
}
