package com.kh.tamnaji.reservation.model.vo;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@NoArgsConstructor

public class CardVO {
	
	private String purchase_corp;
	private String purchase_corp_code;
	
	private String issuer_corp;
	private String issuer_corp_code;
	
	private String bin;
	private String card_type;
	private String install_month;
	private String approved_id;
	private String card_mid;
	
	private String interest_free_install;
	private String card_item_code;
	
}
