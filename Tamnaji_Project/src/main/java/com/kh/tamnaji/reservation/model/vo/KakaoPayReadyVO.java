package com.kh.tamnaji.reservation.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class KakaoPayReadyVO {
	private String tid;
	private String next_redirect_pc_url;
	private String partner_order_id;
	private String created_at;
	
}
