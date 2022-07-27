package com.kh.tamnaji.reservation.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class KakaoPayCancelVO {
	private String aid, tid, cid, status, partner_order_id, partner_user_id, payment_method_type;
	private AmountVO amount;
	private CancelAmountVO approved_cancel_amount;
	private String item_name, item_code;
	private Integer quantity;
	private Date created_at, approved_at, canceled_at;
	private String payload;
	
}