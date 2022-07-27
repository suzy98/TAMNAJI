package com.kh.tamnaji.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.member.model.vo.Member;
import com.kh.tamnaji.member.model.vo.Review;
import com.kh.tamnaji.reservation.model.vo.Reservation;
import com.kh.tamnaji.room.model.vo.RoomVO;

public interface MemberService {

	// 로그인 서비스 (select)
	Member loginMember(Member m);

	// 회원가입 서비스 (insert)
	int insertMember(Member m);

	// 아이디 중복체크 서비스 (select)
	int idCheck(String memberId);

	// 닉네임 중복체크 서비스 (select)
	int nameCheck(String nickname);

	// 비밀번호 재설정 서비스 (update)
	int pwdReset(HashMap<String, String> map);

	// 기존 비밀번호 확인용 서비스(select)
	String PwdCheck(String checkId);

	// 새 비밀번호 변경용 서비스(update)
	int updatePwd(Member m);

	// 나의 정보수정 변경용 서비스 (update)
	int updateMember(Member m);

	// 회원 탈퇴용 서비스 (update)
	int deleteMember(Member m);
	
	// 나의 예약 리스트 조회 서비스 + 페이징 처리
	// 예약리스트 총 갯수 조회
	int MyReservationListCount(String memberId);
	
	// 나의 예약리스트 조회
	ArrayList<Reservation> MyReservationList(PageInfo pi, String memberId);
	
	// 호스트 전환요청
	int HostRequest(Member m);
	
	// admin 회원전체 리스트 조회 서비스 + 페이징 처리
	// 전체회원  행 총 갯수 조회
	int adminSelectAllMemberListCount();
	
	// admin 회원전체조회서비스
	ArrayList<Member> adminSelectAllMember(PageInfo pi, String condition);
	
	// 관리자 페이지 판매자 전환요청 상세서비스
	Member adminMemberDetail(int mno);
	
	// 호스트 전환 신청 서비스
	int accepRequest(int mno);
	
	// 호스트 공간조회 리스트 갯수 카운트 서비스
	int hostSelectSpaceListCount(int memberNo);
	
	// 호스트 공간 등록 정보조회 서비스
	ArrayList<RoomVO> hostSelectSpaceInfo(PageInfo pi, int memberNo);
	
	// 호스트 예약현황 리스트 총개수 서비스
	int hostReservationListCount(int memberNo);
	
	// 호스트 예약현황 리스트 서비스
	ArrayList<Reservation> hostReservationList(PageInfo pi, int memberNo);
	
	// 나의 리뷰내역 총 조회 개수 서비스
	int ReviewSelectListCount(String memberNo);
	
	// 나의 리뷰내역 조회 서비스
	ArrayList<Review> ReviewSelectList(PageInfo pi, String memberNo);
	
	// 리뷰 리스트 카운트 조회 서비스
	int reviewListCount(Review r);
	
	// 리뷰 후기 작성 서비스
	int reviewCreate(Review r);
	
	// 리뷰 삭제 서비스
	int reviewDelete(int roomNo);

	

}
