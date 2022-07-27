package com.kh.tamnaji.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.common.template.Pagination;
import com.kh.tamnaji.member.model.service.MemberService;
import com.kh.tamnaji.member.model.vo.Member;

@Controller
public class AdminPageController {
	
	@Autowired
	private MemberService memberService;
	
	// 메인2 포워딩
	@RequestMapping("main2Page.co")
	public String main2Page() {
		return "common/main2";
	}
	
	// 헤더에서 관리자페이지 누르면 관리자메인페이지로 포워딩
	@RequestMapping("adminPage.co")
	public String adminPage() {
		return "common/adminMainPage";
	}
	
	// 관리자 회원관리 페이지 포워딩
	@RequestMapping("adminMemberManage.ad")
	public String adminMemberManage() {
		return "admin/adminMemberManage";
	}
	
	@RequestMapping("adminMemberDetailView.ad")
	public String adminSelectMemberDetail() {	
		return "admin/adminMemberDetailView";
	}
	
	@RequestMapping("selectMember.ad")
	public String adminSelectAllMember(
			@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String condition,
			Model model) {
	
		// System.out.println("condition : " + condition);
		
		// System.out.println("cpage : " + currentPage);
		
		int listCount = memberService.adminSelectAllMemberListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = memberService.adminSelectAllMember(pi, condition);
		

		// System.out.println("listCount : " + listCount);
		// System.out.println("list : " + list);
		// System.out.println("pi : " + pi);
		
		model.addAttribute("pi", pi); 
		model.addAttribute("list", list); 
		model.addAttribute("condition", condition); // 검색 조회용
		// System.out.println(condition);
		return "admin/adminMemberManage";
	}
	
	@RequestMapping("openChat.co")
	public String chatPage() {
		return "admin/adminChat";
	}
	
	@RequestMapping("adminDetailView.ad")
	public ModelAndView adminMemberDetail(int mno, ModelAndView mv) {
		
		Member m = memberService.adminMemberDetail(mno);
		
		mv.addObject("m", m).setViewName("admin/adminMemberDetailView");
		System.out.println(m);
		return mv;
	}
	
	
	
	@RequestMapping("acceptRequest.ad")
	public String acceptRequest(int mno, HttpSession session, Model model) {
		
		// System.out.println(mno);
		int result = memberService.accepRequest(mno);
		
		if(result > 0) {
			
			model.addAttribute("mno", mno);
			
			session.setAttribute("alertMsg", "판매자로 전환되었습니다.");
			
			return "admin/adminMemberManage";
		}
		else {
			
			model.addAttribute("errorMsg", "판매자 전환 실패!");
			
			return "common/errorPage";
		}
	}
}
