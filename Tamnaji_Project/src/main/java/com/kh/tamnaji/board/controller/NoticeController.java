package com.kh.tamnaji.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tamnaji.board.model.service.NoticeService;
import com.kh.tamnaji.board.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	// FAQ 전체 화면
	@RequestMapping("list.faq")
	public String FAQlist() {
		return "board/FAQListView";
	}
	
	// 공지사항 전체 조회
	@RequestMapping("list.no")
	public String selectList(Model model) {
		
		ArrayList<Notice> nlist = noticeService.selectList();
		model.addAttribute("nlist", nlist);
		
		// 공지사항 전체 화면 포워딩
		return "board/noticeListView";
	}

	// 공지사항 작성 화면
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		return "board/noticeEnrollForm"; 
	}
	
	// 공지사항 작성
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, Model model, HttpSession session) {
		
		int result = noticeService.insertNotice(n);
		
		if(result > 0) { // 성공 => 공지사항 전체 조회 화면으로 url 재요청
		
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			
			return "redirect:list.no";
		} else { // 실패 => 에러페이지로 포워딩
			
			model.addAttribute("errorMsg", "공지사항 등록 실패");
			
			return "common/errorPage";
		}
	}
	
	// 공지사항 삭제
	@RequestMapping("delete.no")
	public String deleteNotice(int nno, Model model, HttpSession session) {
	
		int result = noticeService.deleteNotice(nno);
		
		if(result > 0) { // 성공 => 공지사항 전체 조회 화면으로 url 재요청
			
			session.setAttribute("alertMsg", "성공적으로 공지사항이 삭제되었습니다.");
			
			return "redirect:list.no";
		} else { // 실패 => 에러페이지로 포워딩
			
			model.addAttribute("errorMsg", "공지사항 삭제 실패");
			
			return "common/errorPage";
		}
	}
	
	// 공지사항 수정 화면
	@RequestMapping("updateForm.no")
	public String updateForm(Notice n, int nno, Model model) {
		// 해당 공지사항의 상세조회 요청
		n.setNoticeNo(nno);
		n = noticeService.selectNotice(nno);
		// Model 에 데이터 담기
		model.addAttribute("n", n);
		
		return "board/noticeUpdateForm";
	}
	
	// 공지사항 수정
	@RequestMapping("update.no")
	public String updateNotice(Notice n, Model model, HttpSession session) {
		
		int result = noticeService.updateNotice(n);
		
		if(result > 0) {  // 성공 => 공지사항 전체 조회 화면으로 url 재요청
			
			session.setAttribute("alertMsg", "성공적으로 공지사항이 수정되었습니다.");
			
			return "redirect:list.no";
		} else { // 실패 => 에러페이지로 포워딩
			
			model.addAttribute("errorMsg", "공지사항 수정 실패");
			
			return "common/errorPage";
		}
	}
	
	// we are Tamnaji 포워딩
	@RequestMapping("list.tam")
	public String weAreTamnaji() {
		return "board/we";
	}
}
