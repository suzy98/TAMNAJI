package com.kh.tamnaji.reservation.model.service;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.client.RestClientException;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.reservation.model.vo.KakaoPayApproveVO;
import com.kh.tamnaji.reservation.model.vo.KakaoPayCancelVO;
import com.kh.tamnaji.reservation.model.vo.KakaoPayReadyVO;
import com.kh.tamnaji.reservation.model.vo.OrderCancelVO;
import com.kh.tamnaji.reservation.model.vo.OrderVO;
import com.kh.tamnaji.reservation.model.vo.Reservation;

public interface ReservationService {
	
	// 결제요청 시 예약테이블 생성
	int reservationPost(Map<String, Object> resMap);
	
	// 결제승인 과정에서 식별자번호로 예약 테이블 호출
	Reservation payGet(String orderId);
	
	// 결제승인 과정에서 데이터 최종 입력
	int payPut(KakaoPayApproveVO payInfo);

	// 결제취소
	int payDelete(KakaoPayCancelVO kakaopayCancelVO);
	
	// 나의 예약내역 전체 조회;
	ArrayList<Reservation> reservationGets(int memberNo);
	
	// 나의 예약내역에서 단일 예약내역 확인
	Reservation reservationGet(String orderId);
	
	// 나의 예약내역 수정
	int reservationPut(String orderId);
	
	// 나의 예약내역 삭제->예약 취소 요청
	int reservationDelete(String orderId);
	
	// 관리자 전체 예약내역 리스트 갯수
	int adminReservationCount(String payStatus);

	// 관리자 전체 예약내역 확인하기
	ArrayList<Reservation> adminReservationGets(Map<String, Object> body);

	// 관리자 상세 예약내역 확인하기
	Reservation adminReservationGet(String orderId);

	// 관리자 상세 예약내역 수정하기
	int adminReservationPut( Map<String, Object> body);

	// 관리자 상세 예약내역 삭제하기
	int adminReservationDelete(String orderId);
	
	// 예약된 날짜 조회하기
	ArrayList<Reservation> reservedDate(int roomNo);

	KakaoPayReadyVO kakaopayReady(OrderVO orderVO) throws RestClientException, URISyntaxException;

	KakaoPayApproveVO kakaoPayInfo(String pgToken, Reservation resVO) throws RestClientException, URISyntaxException;

	KakaoPayCancelVO kakaopayCancel(OrderCancelVO orderCancelVO) throws URISyntaxException;

	int depositDelete(String orderId);

	int reservationPut(Reservation reservation);

	int depositPut(String orderId);
}
