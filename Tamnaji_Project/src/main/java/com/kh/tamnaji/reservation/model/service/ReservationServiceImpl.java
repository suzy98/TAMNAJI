package com.kh.tamnaji.reservation.model.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.common.template.OrderIdCreate;
import com.kh.tamnaji.reservation.model.vo.KakaoPayApproveVO;
import com.kh.tamnaji.reservation.model.vo.KakaoPayCancelVO;
import com.kh.tamnaji.reservation.model.vo.KakaoPayReadyVO;
import com.kh.tamnaji.reservation.model.vo.OrderCancelVO;
import com.kh.tamnaji.reservation.model.vo.OrderVO;
import com.kh.tamnaji.reservation.model.dao.ReservationDao;
import com.kh.tamnaji.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{

	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int reservationPost(Map<String, Object> resMap) {
		return reservationDao.reservationPost(sqlSession, resMap);
	}

	@Override
	public Reservation payGet(String orderId) {
		return reservationDao.payGet(sqlSession, orderId);
	}
	
	@Override
	public int payPut(KakaoPayApproveVO approveVO) {
		return reservationDao.payPut(sqlSession, approveVO);
	}
	@Override
	public int payDelete(KakaoPayCancelVO cancelVO) {	
		return reservationDao.payDelete(sqlSession, cancelVO);
	}

	
	@Override
	public ArrayList<Reservation> reservationGets(int memberNo) {
		return reservationDao.reservationGets(sqlSession, memberNo);
	}

	@Override
	public Reservation reservationGet(String orderId) {
		return reservationDao.reservationGet(sqlSession, orderId);
	}


	@Override
	public int reservationPut(String orderId) {
		return reservationDao.reservationPut(sqlSession, orderId);
	}
	
	@Override
	public int reservationDelete(String orderId) {
		return reservationDao.reservationDeleteRequest(sqlSession, orderId);
	}


	@Override
	public int adminReservationCount(String payStatus) {
		return reservationDao.adminReservationCount(sqlSession, payStatus);
	}

	@Override
	public ArrayList<Reservation> adminReservationGets(Map<String, Object> body) {
		return reservationDao.adminReservationGets(sqlSession, body);
	}

	@Override
	public Reservation adminReservationGet(String orderId) {
		return reservationDao.adminReservationGet(sqlSession, orderId);
	}

	@Override
	public int adminReservationPut(Map<String, Object> body) {
		return reservationDao.adminReservationPut(sqlSession, body);
	}

	@Override
	public int adminReservationDelete(String orderId) {
		return reservationDao.adminReservationDelete(sqlSession, orderId);
	}

	@Override
	public ArrayList<Reservation> reservedDate(int roomNo) {
		return reservationDao.reservedDate(sqlSession, roomNo);
	}
	
	// --------------------------
	// -------------------------- 카카오페이 결제 관련 메소드
	
	private static final String HOST = "https://kapi.kakao.com/";
	
	private static final String ADMIN = "0aa355826308da994b69843e7f9e7c2c";
	
	private static final String CID = "TC0ONETIME";
	
	public KakaoPayReadyVO kakaopayReady(OrderVO orderVO) throws RestClientException, URISyntaxException {
		
		 RestTemplate restTemplate = new RestTemplate();
			
		 HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + ADMIN);
	        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        
	        orderVO.setOrderId(OrderIdCreate.getOrderIdCreate());
	        String url = "http://192.168.40.17:8888/tamnaji/reservation/";
	        			//  http:localhost:8888/
	        params.add("cid", CID);
	        params.add("partner_order_id", orderVO.getOrderId());
	        params.add("partner_user_id", orderVO.getMemberId());
	        params.add("item_name", orderVO.getItem_name());
	        params.add("quantity", orderVO.getQuantity());
	        params.add("total_amount", orderVO.getTotal_amount());
	        params.add("tax_free_amount", "0");
	     
	        params.add("approval_url", url+"success?partner_order_id="+orderVO.getOrderId()+"&checkInDate="+orderVO.getCheckInDate()+"&checkOutDate="+orderVO.getCheckOutDate());
	        params.add("cancel_url", url+"cancel");
	        params.add("fail_url", url+"fail");
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	         // 외부 url 요청 통로 열기
	        KakaoPayReadyVO kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
	        kakaoPayReadyVO.setPartner_order_id(orderVO.getOrderId());
	        orderVO.setTid(kakaoPayReadyVO.getTid());
	        // tid값을 가진 예약 데이터 생성
	        
			Map<String, Object> resMap = new HashMap<String, Object>();
			resMap.put("order", orderVO);
			resMap.put("kakao", kakaoPayReadyVO);
			reservationPost(resMap);
      
	        return kakaoPayReadyVO;
				
	}
	
	public KakaoPayApproveVO kakaoPayInfo(String pg_token, Reservation resVO) throws RestClientException, URISyntaxException {

       RestTemplate restTemplate = new RestTemplate();

       // 서버로 요청할 Header
       HttpHeaders headers = new HttpHeaders();
       headers.add("Authorization", "KakaoAK " + ADMIN);
       headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

       // 서버로 요청할 Body
       MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
       params.add("cid", CID); // 사업자 번호
       params.add("tid", resVO.getTid());
       params.add("partner_order_id", resVO.getOrderId()); // 주문번호
       params.add("partner_user_id", resVO.getMemberWriter()); //  회원 정보
       params.add("pg_token", pg_token);
       params.add("payload", resVO.getPayload());	
       
       HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

       KakaoPayApproveVO kakaoPayApproveVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApproveVO.class);

       return kakaoPayApproveVO;

   }

	// 바닐라 js
	public KakaoPayCancelVO kakaopayCancel(OrderCancelVO orderCancelVO) throws URISyntaxException {
		
		RestTemplate restTemplate = new RestTemplate();
		 
       // 서버로 요청할 Header
       HttpHeaders headers = new HttpHeaders();
       headers.add("Authorization", "KakaoAK " + ADMIN);
       headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

       // 서버로 요청할 Body
       MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
       params.add("cid", CID); // 사업자 번호
       params.add("tid", String.valueOf(orderCancelVO.getTid())); // 결제 고유번호
       params.add("cancel_amount", String.valueOf(orderCancelVO.getCancel_amount())); // 취소 금액
       params.add("cancel_tax_free_amount", String.valueOf(0)); // 취소 비과세 금액
       
       HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
      
       KakaoPayCancelVO kakaoPayCancelVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/cancel"), body, KakaoPayCancelVO.class);
       
       return kakaoPayCancelVO;

	}
		
	public int depositDelete(String orderId) {
		return reservationDao.depositDelete(sqlSession, orderId);
	}

	@Override
	public int reservationPut(Reservation reservation) {
		return reservationDao.reservationPut(sqlSession, reservation);
	}

	@Override
	public int depositPut(String orderId) {
		return reservationDao.depositPut(sqlSession, orderId);
	}
	
	@Override
	public int depositPut(String orderId) {
		return reservationDao.depositPut(sqlSession, orderId);
	}
	
}
