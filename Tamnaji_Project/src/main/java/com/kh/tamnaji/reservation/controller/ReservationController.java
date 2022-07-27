package com.kh.tamnaji.reservation.controller;

import java.io.IOException;
import java.net.URISyntaxException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.common.template.OrderIdCreate;
import com.kh.tamnaji.common.template.Pagination;
import com.kh.tamnaji.reservation.model.vo.KakaoPayApproveVO;
import com.kh.tamnaji.reservation.model.vo.KakaoPayCancelVO;
import com.kh.tamnaji.reservation.model.vo.KakaoPayReadyVO;
import com.kh.tamnaji.reservation.model.vo.OrderCancelVO;
import com.kh.tamnaji.reservation.model.vo.OrderVO;
import com.kh.tamnaji.reservation.model.service.ReservationService;
import com.kh.tamnaji.reservation.model.vo.Reservation;
import com.kh.tamnaji.room.model.service.RoomService;
import com.kh.tamnaji.room.model.vo.RoomVO;
import com.kh.tamnaji.space.model.service.SpaceService;
import com.kh.tamnaji.space.model.vo.Space;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private SpaceService spaceService;

	@Autowired
	private RoomService roomService;
	
	// 예약하는 화면으로 넘어가는 매핑주소
	@GetMapping("/reservationForm")
	public String reservationForm(String roNo, String mNo, String checkInDate, String checkOutDate, String peopleCount, Model model) throws ParseException {
		
		StringTokenizer st = new StringTokenizer(checkInDate, "-");
		StringTokenizer st2 = new StringTokenizer(checkOutDate, "-");
		String str = "";
		String str2 = "";
		while(st.hasMoreTokens()) {
			str += st.nextToken();
		}
		while(st2.hasMoreTokens()) {
			str2 += st2.nextToken();
		}
		
		Map<String, String> body = new HashMap<String, String>();
		body.put("roomNo", roNo);
		body.put("memberNo", mNo);
		body.put("checkInDate", str);
		body.put("checkOutDate", str2);
		body.put("peopleCount", peopleCount);
		
        Date format1 = new SimpleDateFormat("yyyyMMdd").parse(str);
        Date format2 = new SimpleDateFormat("yyyyMMdd").parse(str2);
        
        long diffSec = (format2.getTime() - format1.getTime()) / 1000; //초 차이
        long diffMin = (format2.getTime() - format1.getTime()) / 60000; //분 차이
        long diffHor = (format2.getTime() - format1.getTime()) / 3600000; //시 차이
        long diffDays = diffSec / (24*60*60); //일자수 차이
        
        body.put("stayPeriod", String.valueOf(diffDays));
		// 공간번호를 가지고 예약하려는 공간에 대한 정보를 띄워준다.
        RoomVO room = roomService.roomGet(body);
		body.put("spaceNo", String.valueOf(room.getSpaceNo()));
        Space space = spaceService.spaceGet(body);
		
		model.addAttribute("body", body);
		model.addAttribute("space", space);
		model.addAttribute("room", room);
		return "reservation/reservationForm";
	}


// --------------------------
// -------------------------- 관리자 화면		
	private static final String ADMINURL = "/adminReservationForm";
	private static final String APPLIJSON = "application/json; charset=utf-8";
	
	// 관리자화면에서 예약내역을 확인하는 화면으로 넘어가는 매핑주소
	@GetMapping("/adminReservationForm")
	public String adminReservationForm() {
		return "admin/adminReservation";
	}
	
	//관리자 예약내역 확인 리스트를 띄우는 비동기(관리자화면의 좌측 사이드바에 해당 함수를 걸어놓고, 일단 예약내역과 취소예약내역을 구별해서 출력예정)
	@GetMapping(value="/adminReservations", produces=APPLIJSON)
	@ResponseBody
	public String adminReservationGets(String cPage, String payStatus) {
		int listCount = reservationService.adminReservationCount(payStatus);
		int currentPage = Integer.parseInt(cPage);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		Map<String, Object> body = new HashMap<>();
		body.put("pi", pi);
		body.put("payStatus", payStatus);

		ArrayList<Reservation> adminRList = reservationService.adminReservationGets(body);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pi", pi);
		data.put("adminRList", adminRList);
		
		return new Gson().toJson(data);
	}
	
	@GetMapping(value="/adminReservation", produces=APPLIJSON)
	public String adminReservationGet(String orderId, Model model) {
		Reservation adminR = reservationService.adminReservationGet(orderId);
		
		model.addAttribute("reservation", adminR);
		
		if(adminR.getPayStatus().equals("결제취소")) {
			return "admin/adminReservationCancelDetail";
		} else {
			return "admin/adminReservationDetail";
		}
	}
	
	@PutMapping(value="/adminReservation", produces=APPLIJSON)
	@ResponseBody
	public String adminReservationPut(String orderId) {
		 Map<String, Object> body = new HashMap<String, Object>();
		int result = reservationService.adminReservationPut(body);
		// 실제로 수정하기
		return result > 0 ? new Gson().toJson("NNNNY") : new Gson().toJson("NNNNN");
	}
	
	@DeleteMapping(value="/adminReservation", produces=APPLIJSON)
	@ResponseBody
	public String adminReservationDelete(String orderId) {
		int result = reservationService.adminReservationDelete(orderId);
		// 예약취소, 삭제
		return result > 0 ? new Gson().toJson("NNNNY") : new Gson().toJson("NNNNN");
	}
	
	// 예약된 날짜 조회
    @ResponseBody
	@RequestMapping(value="getReservedDate.re", produces="application/json; charset=UTF-8")
	public String ajaxReservedDate(int roomNo) {
		
    	ArrayList<Reservation> list = reservationService.reservedDate(roomNo);
		return new Gson().toJson(list);
	}
	
// --------------------------
// -------------------------- 결제하기
	
	// 카카오페이 결제 시작
	@PostMapping(value="/reservation/kakaopay", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String kakaopay(@RequestBody String filterJSON, Model model) throws IOException, RestClientException, URISyntaxException {

		ObjectMapper mapper = new ObjectMapper();
		
		OrderVO orderVO = (OrderVO)mapper.readValue(filterJSON,new TypeReference<OrderVO>(){});

		KakaoPayReadyVO kakao = reservationService.kakaopayReady(orderVO);
		
		return new Gson().toJson(kakao);

	}
	@GetMapping("/reservation/success")
	public String payComplete(@RequestParam("pg_token") String pgToken, @RequestParam("partner_order_id") String orderId, String checkInDate, String checkOutDate, HttpSession session, Model model) throws RestClientException, URISyntaxException {
		
		// orderId 와 tid 값이 든 예약테이블을 가지고 온 뒤
		Reservation resVO = reservationService.payGet(orderId);
		KakaoPayApproveVO payInfo = reservationService.kakaoPayInfo(pgToken, resVO);
		model.addAttribute("info", payInfo);
		
		payInfo.setCheckInDate(checkInDate);
		payInfo.setCheckOutDate(checkOutDate);
		// 결제완료 정보를 가진 payInfo를 바탕으로 해당 예약테이블의 값들을 업데이트한 뒤
		int update = reservationService.payPut(payInfo);
		
		// 새롭게 예약테이블을 조회하고나서
		Reservation updResVO = reservationService.payGet(orderId);
		// 뿌려준다.
		model.addAttribute("reservation", updResVO);
		
		return "pay/success";
	}
	
	//
	@GetMapping("/reservation/fail")
	public ModelAndView fail(ModelAndView mv) {
		mv.setViewName("/pay/fail");
		return mv;
	}
	
	@GetMapping("/reservation/cancel")
	public ModelAndView cansle(ModelAndView mv) {
		mv.setViewName("/pay/cancel");
		return mv;
	}
	
	@PostMapping(value="/reservation/kakaopay/delete", produces="application/json; charset=UTF-8")
	public String kakaopayCancel(OrderCancelVO orderCancelVO, Model model) throws URISyntaxException, IOException {
		
		KakaoPayCancelVO kakaopayCancelVO = reservationService.kakaopayCancel(orderCancelVO);
		
		int result = reservationService.payDelete(kakaopayCancelVO);
		Reservation delResVO = null;
		if(result == 1) {
		delResVO = reservationService.payGet(kakaopayCancelVO.getPartner_order_id());
		}
		model.addAttribute("reservation", delResVO);
		model.addAttribute("kakaopayCancelVO", kakaopayCancelVO);
		
		return "pay/cancel";

	}
	
	// 무통장입금 방법
	@PostMapping(value="/reservation/deposit", produces=APPLIJSON)
	public String depositPost(OrderVO orderVO, Model model) throws IOException, RestClientException, URISyntaxException {

		orderVO.setOrderId(OrderIdCreate.getOrderIdCreate());
		orderVO.setPayStatus("결제대기");
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("order", orderVO);
		// 무통장입금으로 생성
		int result = reservationService.reservationPost(resMap);
		
		Reservation resVO = reservationService.reservationGet(orderVO.getOrderId());
		
		model.addAttribute("reservation", resVO);
		
		return "pay/depositSuccess";

	}
	
	@RequestMapping(value="/reservation/deposit/cancel")
	public String depositDelete(String orderId, Model model) {
		int result = reservationService.depositDelete(orderId);
		
		Reservation resVO = reservationService.reservationGet(orderId);
		
		model.addAttribute("reservation", resVO);
		return "pay/cancel";
	}
	
	@RequestMapping(value="/reservation/deposit/put")
	public String depositPut(String orderId, Model model) {
		int result = reservationService.depositPut(orderId);
		return "redirect:/adminReservationForm";
	}
	
	@GetMapping(value="/reservation")
	public String reservationGet(String orderId, Model model) {
		Reservation resVO = reservationService.reservationGet(orderId);
		
		model.addAttribute("reservation", resVO);
		return "reservation/reservationDetail";
		
	}
	
	@RequestMapping(value="/reservation/put")
	public String reservationPut(Reservation reservation, Model model) {
		
		int result = reservationService.reservationPut(reservation);
		
		Reservation resVO = reservationService.reservationGet(reservation.getOrderId());
		
		model.addAttribute("reservation", resVO);
		return "redirect:/reservation?orderId="+reservation.getOrderId();
	}
	
	@RequestMapping(value="/reservation/deposit/put")
	public String depositPut(String orderId, Model model) {
		int result = reservationService.depositPut(orderId);
		return "redirect:/adminReservationForm";
	}
}
