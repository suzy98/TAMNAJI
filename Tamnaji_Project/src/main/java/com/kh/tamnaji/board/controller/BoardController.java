package com.kh.tamnaji.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tamnaji.board.model.service.BoardService;
import com.kh.tamnaji.board.model.vo.Board;
import com.kh.tamnaji.board.model.vo.BoardAttachment;
import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.common.template.Pagination;
import com.kh.tamnaji.reply.model.vo.Reply;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
			Model model) {
		// System.out.println("cpage : " + currentPage);
		
		// 페이징처리를 위한 변수들 셋팅 => PageInfo 객체
		
		int listCount = boardService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = boardService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		// System.out.println("BoardController list.bo list === " + list);
		// System.out.println("BoardController pi : " + pi);
		
		// 게시판 리스트 화면 포워딩
		return "board/boardListView"; 
	}
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm"; 
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, BoardAttachment ba, MultipartFile upfile, HttpSession session, Model model) {
		
		// Service 단으로 b 를 넘겨서 insert 요청
		// 넘어온 첨부파일이 있을 경우 b : 제목, 내용, 작성자, 원본파일명, 수정파일명
		// 넘어온 첨부파일이 없을 경우 b : 제목, 내용, 작성자
		int result = boardService.insertBoard(b);
		
		// 전달된 파일이 있을 경우
		// 1. 파일명 수정 => yyyymmddhhmmssxxxxx.확장자
		// 2. 서버로 업로드
		// 3. 원본명, 서버에 업로드된 수정명, 경로를 db 로 insert
		if(!upfile.getOriginalFilename().equals("")) {

			// saveFile 메소드로 위의 코드를 따로 정의함
			String changeName = saveFile(upfile, session);
			
			ba.setOriginName(upfile.getOriginalFilename());
			ba.setChangeName("resources/uploadFiles/" + changeName);
			ba.setBoardNo(b.getBoardNo());
		}
		
		if(result > 0) { // 성공 => 게시글 리스트페이지로 url 재요청
		
			// 첨부파일 insert
			// originName에 값이 담겨있을때 실행
			if(ba.getOriginName() != null) {
				boardService.insertBoardAttachment(ba);
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
			return "redirect:list.bo";
		}
		else { // 실패 => 에러페이지 포워딩
			
			model.addAttribute("errorMsg", "게시글 등록 실패");
			
			return "common/errorPage"; // /WEB-INF/views/common/errorPage.jsp
		}
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		
		// bno 에는 상세조회하고자 하는 해당 게시글 번호가 담겨있음
		
		// 1. 해당 게시글 조회수 증가용 서비스 먼저 요청
		int result = boardService.increaseCount(bno);
		
		if(result > 0) {
			// 2. 조회수 증가가 잘 이루어졌다면 그때 상세조회 서비스 요청
			Board b = boardService.selectBoard(bno);
			
			int memberNo = b.getBoardWriter();
			
			System.out.println("memberNo : " + memberNo);
			
			BoardAttachment ba = boardService.selectBoardAttachment(bno);
			
			// ModelAndView 객체의 addObject 메소드는 자기자신을 리턴해주기 때문에
			// 한번에 setViewName 메소드까지 메소드체이닝으로 호출 가능하다.
			mv.addObject("ba",ba);
			mv.addObject("b", b).setViewName("board/boardDetailView"); // /WEB-INF/views/board/boardDetailView.jsp
		}
		else { // 조회수 증가가 실패했을 경우
			
			mv.addObject("errorMsg", "게시글 상세조회 실패").setViewName("common/errorPage"); // /WEB-INF/views/common/errorPage.jsp
		}
		return mv;
	}
	
	@RequestMapping(value="delete.bo", method=RequestMethod.POST)
	public String deleteBoard(int bno, Model model, String filePath, HttpSession session) {
	
		int result = boardService.deleteBoard(bno);
		
		if(result > 0) { // 성공
			
			// 문구 담아서
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			// 게시판 리스트 페이지로 url 재요청
			return "redirect:list.bo";
		}
		else { // 실패 => 에러문구 담아서 에러페이지로 포워딩
			
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage"; // /WEB-INF/views/common/errorPage.jsp
		}
		
	}
	
	@RequestMapping(value="updateForm.bo", method=RequestMethod.POST)
	public String updateForm(int bno, Model model) {
		
		// 해당 게시글의 상세조회 요청
		Board b = boardService.selectBoard(bno);
		BoardAttachment ba = boardService.selectBoardAttachment(bno);
		
		// Model 에 데이터 담기
		model.addAttribute("b", b);
		model.addAttribute("ba", ba);
		System.out.println("BoardController updateForm.bo ba : " + ba);
		
		// 수정하기 페이지 포워딩
		return "board/boardUpdateForm"; // /WEB-INF/views/board/boardUpdateForm.jsp
	}
	
	@RequestMapping("update.bo")
	public String updateBoard(Board b, MultipartFile reupfile, HttpSession session, Model model) {
		
		System.out.println("BoardController update.bo b: " + b);
		System.out.println("BoardController update.bo reupfile: " + reupfile);
		
		BoardAttachment ba = new BoardAttachment();
		BoardAttachment flag = boardService.selectBoardAttachment(b.getBoardNo());
		
		String changeName = saveFile(reupfile, session);
		ba.setBoardNo(b.getBoardNo());
		ba.setOriginName(reupfile.getOriginalFilename());
		ba.setChangeName("resources/uploadFiles/" + changeName);
		
		if(!reupfile.getOriginalFilename().equals("")) {
			
			boardService.updateBoardAttachment(ba);
		}
		if(flag == null) {
			//
			boardService.reinsertBoardAttachment(ba);
		}
		
		int result = boardService.updateBoard(b);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			
			// detail.bo?bno=x 으로 url 재요청
			return "redirect:detail.bo?bno=" + b.getBoardNo();
		}
		else { // 실패
			
			model.addAttribute("errorMsg", "게시글 수정 실패");
			
			return "common/errorPage"; // /WEB-INF/views/common/errorPage.jsp
		}
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int bno) {
		
		ArrayList<Reply> list = boardService.selectReplyList(bno);
		//System.out.println("BoardController rlist.bo list : " + list);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.bo", produces="text/html; charset=UTF-8")
	public String ajaxInsertReply(Reply r) {
		
		// Ajax 또한 커맨드 객체 방식으로 요청시 전달값을 받을 수 있다.
		
		int result = boardService.insertReply(r);
		// System.out.println("BoardController r : " + r);
		return (result > 0) ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="rdelete.bo", produces="text/html; charset=UTF-8")
	public String ajaxDeleteReply(int replyNo) {
		
		// Ajax 또한 커맨드 객체 방식으로 요청시 전달값을 받을 수 있다.
		
		int result = boardService.deleteReply(replyNo);
		//System.out.println("BoardController rdelete.bo replyNo : " + replyNo);
		return (result > 0) ? "success" : "fail";
	}
	
	// 일반 메소드
	
	// * 스프링에서 반드시 요청을 처리하는 메소드만 Controller 에 들어가라는 법은 없다!!
	// 현재 넘어온 첨부파일의 이름을 수정 후 서버의 그 폴더에 저장하는 메소드
	// => url 요청을 처리하는 메소드가 아닌 일반 메소드로 만듬
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 파일명 수정 후 업로드 시키기
		// 예) "flower.png" => "2022061511020112345.png"
		// 1. 원본파일명 가져오기
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		// 2. 시간 형식을 문자열로 뽑아내기
		// "20220615110201" (년월일시분초) => SimpleDateFormat
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 뒤에 붙을 5자리 랜덤값 뽑기
		// "13253"
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 4. 원본파일명으로부터 확장자 부분만 추출
		// ".png"
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 5. 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;
				
		// 6. 업로드 하고자 하는 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
				
		// 7. 경로와 수정파일명을 합체시킨 후 저장
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
}
