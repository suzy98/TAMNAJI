package com.kh.tamnaji.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.member.model.dao.MemberDao;
import com.kh.tamnaji.member.model.vo.Member;
import com.kh.tamnaji.member.model.vo.Review;
import com.kh.tamnaji.reservation.model.vo.Reservation;
import com.kh.tamnaji.room.model.vo.RoomVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인 서비스 (select)
	@Override
	public Member loginMember(Member m) {

		Member loginUser = memberDao.loginMember(sqlSession, m);

		return loginUser;
	}

	// 회원가입 서비스 (insert)
	@Override
	public int insertMember(Member m) {

		int result = memberDao.insertMember(sqlSession, m);

		return result;
	}

	// 아이디 중복체크 서비스 (select)
	@Override
	public int idCheck(String memberId) {

		return memberDao.idCheck(sqlSession, memberId);
	}

	// 닉네임 중복체크 서비스 (select)
	@Override
	public int nameCheck(String nickname) {
	
		return memberDao.nameCheck(sqlSession, nickname);
	}

	// 비밀번호 재설정 서비스 (update)
	@Override
	public int pwdReset(HashMap<String, String> map) {
		return memberDao.pwdReset(sqlSession, map);
	}

	@Override
	public int updatePwd(Member m) {

		return memberDao.updatePwd(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {

		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(Member m) {

		return memberDao.deleteMember(sqlSession, m);
	}

	@Override
	public String PwdCheck(String checkId) {
		
		return memberDao.PwdCheck(sqlSession, checkId);
	}

	public int MyReservationListCount(String memberId) {
		
		return memberDao.MyReservationListCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<Reservation> MyReservationList(PageInfo pi, String memberId) {
		
		return memberDao.MyReservationList(sqlSession, pi, memberId);
	}
	
	/*
	@Override
	public int MyWishListCount(String memberId) {
		
		return memberDao.MyWishListCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<LikeList> MyWishList(PageInfo pi, String memberId) {
		
		return memberDao.MyWishList(sqlSession, pi, memberId);
	}
	*/

	@Override
	public int HostRequest(Member m) {
		
		return memberDao.HostRequest(sqlSession, m);
	}

	@Override
	public int adminSelectAllMemberListCount() {
		
		return memberDao.adminSelectAllMemberListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> adminSelectAllMember(PageInfo pi, String condition) {
		
		return memberDao.adminSelectAllMember(sqlSession, pi, condition);
	}

	@Override
	public Member adminMemberDetail(int mno) {
		
		return memberDao.adminMemberDetail(sqlSession, mno);
	}

	@Override
	public int accepRequest(int mno) {
		
		return memberDao.acceptRequest(sqlSession, mno);
	}
	
	@Override
	public int hostSelectSpaceListCount(int memberNo) {
		
		return memberDao.hostSelectSpaceListCount(sqlSession, memberNo);
	}
	
	@Override
	public ArrayList<RoomVO> hostSelectSpaceInfo(PageInfo pi, int memberNo) {
		
		return memberDao.hostSelectSpaceInfo(sqlSession, pi, memberNo);
	}

	@Override
	public int hostReservationListCount(int memberNo) {
		
		return memberDao.hostReservationListCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Reservation> hostReservationList(PageInfo pi, int memberNo) {
		
		return memberDao.hostReservationList(sqlSession, pi, memberNo);
	}
	
	@Override
	public int ReviewSelectListCount(String memberNo) {
		
		return memberDao.ReviewSelectListCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Review> ReviewSelectList(PageInfo pi, String memberNo) {
		
		return memberDao.ReviewSelectList(sqlSession, pi, memberNo);
	}

	@Override
	public int reviewListCount(Review r) {
		
		return memberDao.reviewListCount(sqlSession, r);
	}
	
	@Override
	public int reviewCreate(Review r) {
		
		return memberDao.reviewCreate(sqlSession, r);
	}

	@Override
	public int reviewDelete(int roomNo) {
		
		return memberDao.reviewDelete(sqlSession, roomNo);
	}

	
}
