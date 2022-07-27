package com.kh.tamnaji.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.member.model.vo.Member;
import com.kh.tamnaji.member.model.vo.Review;
import com.kh.tamnaji.reservation.model.vo.Reservation;
import com.kh.tamnaji.room.model.vo.RoomVO;

@Repository
public class MemberDao {

	// 로그인 (select)
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	// 회원가입 (insert)
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("memberMapper.insertMember", m);
	}

	// 아이디 중복체크 (select)
	public int idCheck(SqlSessionTemplate sqlSession, String memberId) {

		return sqlSession.selectOne("memberMapper.idCheck", memberId);
	}
	
	public String PwdCheck(SqlSession sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.PwdCheck", checkId);
	}

	// 닉네임 중복체크 (select)
	public int nameCheck(SqlSessionTemplate sqlSession, String nickname) {
		
		return sqlSession.selectOne("memberMapper.nameCheck", nickname);
		
	}

	// 비밀번호 재설정 (update)
	public int pwdReset(SqlSessionTemplate sqlSession, HashMap<String, String> map) {

		return sqlSession.update("memberMapper.pwdReset", map);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updatePwd", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.update("memberMapper.deleteMember", m);
	}
	
	public int MyReservationListCount(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.selectOne("memberMapper.MyReservationListCount", memberId);
	}
	
	public ArrayList<Reservation> MyReservationList(SqlSessionTemplate sqlSession, PageInfo pi, String memberId) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.MyReservationList", memberId, rowBounds);
	}
	
	public int HostRequest(SqlSession sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.HostRequest", m);
	}
	
	public int adminSelectAllMemberListCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("memberMapper.adminSelectAllMemberListCount");
	}
	
	public ArrayList<Member> adminSelectAllMember(SqlSessionTemplate sqlSession, PageInfo pi, String condition) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.adminSelectAllMember", condition, rowBounds);
	}

	public Member adminMemberDetail(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("memberMapper.adminMemberDetail", mno);
	}

	public int acceptRequest(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.update("memberMapper.acceptRequest", mno);
	}

	public int hostSelectSpaceListCount(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("memberMapper.hostSelectSpaceListCount", memberNo);	
	}

	public ArrayList<RoomVO> hostSelectSpaceInfo(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.hostSelectSpaceInfo", memberNo, rowBounds);
	}

	public int hostReservationListCount(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("memberMapper.hostReservationListCount", memberNo);
	}

	public ArrayList<Reservation> hostReservationList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.hostReservationList", memberNo, rowBounds);
	}
	
	public int ReviewSelectListCount(SqlSessionTemplate sqlSession, String memberNo) {
		
		return sqlSession.selectOne("memberMapper.ReviewSelectListCount", memberNo);
	}

	
	public ArrayList<Review> ReviewSelectList(SqlSessionTemplate sqlSession, PageInfo pi, String memberNo) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.ReviewSelectList", memberNo, rowBounds);
	}
	
	public int reviewListCount(SqlSessionTemplate sqlSession, Review r) {
		
		return sqlSession.selectOne("memberMapper.reviewListCount", r);		
	}

	public int reviewCreate(SqlSessionTemplate sqlSession, Review r) {
		
		return sqlSession.insert("memberMapper.reviewCreate", r);
	}

	public int reviewDelete(SqlSessionTemplate sqlSession, int roomNo) {
		
		return sqlSession.delete("memberMapper.reviewDelete", roomNo);
	}

	
}

