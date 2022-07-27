package com.kh.tamnaji.reservation.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.reservation.model.vo.KakaoPayApproveVO;
import com.kh.tamnaji.reservation.model.vo.KakaoPayCancelVO;
import com.kh.tamnaji.reservation.model.vo.OrderVO;
import com.kh.tamnaji.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {
	
	/////////////////////////////// 공간 예약 설정(결제 연동)
	
	public int reservationPost(SqlSession sqlSession, Map<String, Object> resMap) {
			int result1 = 1;
			OrderVO order = (OrderVO)resMap.get("order");
			if(order.getBankName() != null) {
				result1 = sqlSession.insert("reservationMapper.memberBankPut", resMap);	
			}
			int result2 = sqlSession.insert("reservationMapper.reservationPost", resMap);
			
			return (result1 == 1 && result1 == 1) ? 1 : 0;
	}

	public Reservation payGet(SqlSession sqlSession, String orderId) {
		// TODO Auto-generated method stub
		System.out.println(orderId);
		return sqlSession.selectOne("reservationMapper.payGet", orderId);
	}

	public int payPut(SqlSession sqlSession, KakaoPayApproveVO approveVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("reservationMapper.payPut", approveVO);
	}

	public int payDelete(SqlSession sqlSession, KakaoPayCancelVO cancelVO) {
		return sqlSession.update("reservationMapper.payDelete", cancelVO);
	}

	/////////////////////////////// 나의 예약 내역 관리
	
	
	public ArrayList<Reservation> reservationGets(SqlSession sqlSession, int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public Reservation reservationGet(SqlSession sqlSession, String orderId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reservationMapper.payGet", orderId);
	}

	public int reservationPut(SqlSession sqlSession, String orderId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int reservationDeleteRequest(SqlSession sqlSession, String orderId) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/////////////////////////////// 관리자 예약관리
	
	public int adminReservationCount(SqlSession sqlSession, String payStatus) {
		return sqlSession.selectOne("reservationMapper.adminReservationCount", payStatus);
	}
	
	public ArrayList<Reservation> adminReservationGets(SqlSession sqlSession, Map<String, Object> body) {
		PageInfo pi = (PageInfo)body.get("pi");
		int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reservationMapper.adminReservationGets", body, rowbounds);
	}
	
	public Reservation adminReservationGet(SqlSession sqlSession, String orderId) {
		return sqlSession.selectOne("reservationMapper.adminReservationGet", orderId);
	}

	public int adminReservationPut(SqlSession sqlSession, Map<String, Object> body) {
		return sqlSession.update("reservationMapper.adminReservationPut", body);
	}

	public int adminReservationDelete(SqlSession sqlSession, String orderId) {
		return sqlSession.update("reservationMapper.adminReservationDelete", orderId);
	}

	public ArrayList<Reservation> reservedDate(SqlSession sqlSession, int roomNo) {
		return (ArrayList)sqlSession.selectList("reservationMapper.reservedDate", roomNo);
	}

	public int depositDelete(SqlSession sqlSession, String orderId) {
		return sqlSession.update("reservationMapper.depositDelete", orderId);
	}
	
	public int depositPut(SqlSession sqlSession, String orderId) {
		return sqlSession.update("reservationMapper.depositPut", orderId);
	}

	public int reservationPut(SqlSession sqlSession, Reservation reservation) {
		return sqlSession.update("reservationMapper.reservationPut", reservation);
	}

	public int depositPut(SqlSession sqlSession, String orderId) {
		return sqlSession.update("reservationMapper.depositPut", orderId);
	}

}
