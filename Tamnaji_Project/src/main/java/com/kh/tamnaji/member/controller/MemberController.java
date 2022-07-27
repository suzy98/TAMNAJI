package com.kh.tamnaji.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.common.template.Pagination;
import com.kh.tamnaji.member.model.service.MemberService;
import com.kh.tamnaji.member.model.vo.Member;
import com.kh.tamnaji.member.model.vo.Review;
import com.kh.tamnaji.reservation.model.vo.Reservation;
import com.kh.tamnaji.room.model.vo.RoomVO;
import com.kh.tamnaji.space.model.service.SpaceService;

@Controller
public class MemberController {

   @Autowired
   private MemberService memberService;
   
   @Autowired
   private SpaceService spaceService;
   
   @Autowired
   private BCryptPasswordEncoder bCryptPasswordEncoder; // bcryptPasswordEncoder
   
   // 암호화 비번 대조용 메소드
   public String compareCheck(String checkId, String checkPwd, String encPwd) {
         
      // 만약 맞을 경우
      if(bCryptPasswordEncoder.matches(checkPwd, encPwd)) {// checkPwd: 사용자 입력받은 비번, encPwd: 암호화된 비번 
                  
         String result = memberService.PwdCheck(checkId);
         return "NNNNY"; // 수정가능하게 풀어줌
      }
      else {
         return "NNNNN"; // 수정불가하게 disabled 비활성화
      }
   }
   
   // 암호화 비밀번호 만드는 용도 메소드
   public Member encodeCheck(Member m) {
         
      String encPwd = bCryptPasswordEncoder.encode(m.getMemberPwd()); // getter메소드 필드값
      m.setMemberPwd(encPwd); // 멤버 비번 암호화
         
      return m;
   }
   
   // 로그인 화면
   @RequestMapping("loginForm.me")
   public String loginForm() {

      return "member/memberLoginForm";
   }
   // 마이페이지 화면
   @RequestMapping("myPage.me")
   public String mypage() {
      return "member/myPage";
   }
   // 나의 비밀번호 변경 화면
   @RequestMapping("myPwd.me")
   public String PwdCheck() {
      
      return "member/myPwdChange";
   }
   // 호스트 전환 신청 화면
   @RequestMapping("HostRequestView.me")
   public String HostRequestView() {
      
      return "member/hostRequest";
   }
   
   // 로그인
   @RequestMapping(value="login.me")
   public ModelAndView loginMember(
                       Member m,
                       HttpSession session,
                       ModelAndView mv,
                       String saveId,
                       HttpServletResponse response) {
      // saveId 값이 "y" 라면 => 아이디를 저장하겠다. => 쿠키 생성
      if(saveId != null && saveId.equals("y")) {

         Cookie cookie = new Cookie("saveId", m.getMemberId());
         cookie.setMaxAge(1 * 24 * 60 * 60); // 초로 환산해서 만료시간 1일
         response.addCookie(cookie);
      } else {

         Cookie cookie = new Cookie("saveId", m.getMemberId());
         cookie.setMaxAge(0); // 삭제한 효과
         response.addCookie(cookie);
      }
      // 비밀번호 암호화 후
      Member loginUser = memberService.loginMember(m);
      // 아이디만 일치하는지 1차 체크

      // 비밀번호도 일치하는지 2차 체크
      // 일단 조회된 회원결과가 있는지 그리고 평문비밀번호와 암호문비밀번호가 일치하는지
      if(loginUser != null && bCryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) { // 로그인 성공

         session.setAttribute("loginUser", loginUser);
         session.setAttribute("alertMsg", "로그인에 성공했습니다.");

         mv.setViewName("redirect:/");
      } else { // 로그인 실패 => 에러페이지로 포워딩

         mv.addObject("errorMsg", "로그인 실패");
         mv.setViewName("common/errorPage");
      }
      return mv;
   }

   // 로그아웃
   @RequestMapping("logout.me")
   public String logoutMember(HttpSession session) {

      session.invalidate();
      return "redirect:/";
   }

   // 회원가입 화면
   @RequestMapping("enrollForm.me")
   public String enrollForm() {

      return "member/memberEnrollForm";
   }

   // 회원가입
   @RequestMapping("insert.me")
   public String insertMember(Member m, Model model, HttpSession session) {

      String encPwd = bCryptPasswordEncoder.encode(m.getMemberPwd());
      m.setMemberPwd(encPwd);
      
      int result = memberService.insertMember(m);

      if(result > 0) { // 성공 => 메인페이지 url 재요청

         session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
         return "redirect:/";
      } else { // 실패 => 에러문구를 담아서 에러페이지로 포워딩

         model.addAttribute("errorMsg", "회원가입 실패");
         return "common/errorPage";
      }
   }
   
   @ResponseBody
   @RequestMapping(value="PwdCheck.me", produces="text/html; charset=UTF-8")
   public String PwdCheck(String checkId, String checkPwd, HttpSession session) {
      
      // 1. <input type="hidden"> 로 넘겨오기
      // 2. Controller 단에서 session 으로 알아내기
      
      // checkPwd : 사용자가 입력한 본인의 비밀번호 평문
      // session 객체의 loginUser 객체의 userPwd 필드값 : 암호화된 비밀번호
      // => matches 메소드로 대조작업
      String encPwd = ((Member)session.getAttribute("loginUser")).getMemberPwd();
      
      return compareCheck(checkId, checkPwd, encPwd); 
   }
   
   @RequestMapping("updatePwd.me")
   public String updatePwd(Member m, Model model, HttpSession session) {
      
      Member m_ = encodeCheck(m); // 암호화된 비번
      
      int result = memberService.updatePwd(m_); // 암호화된 비번
         
      if(result > 0) {
            
         Member updatePwd = memberService.loginMember(m_); // 로그인메소드 호출 비번 가공
            
         session.setAttribute("loginUser", updatePwd);
         session.setAttribute("alertMsg", "비밀번호가 성공적으로 수정되었습니다.");
         session.removeAttribute("loginUser");
         
         return "redirect:/";
      }
      else { // 실패시
            
         model.addAttribute("errorPage", "비밀번호 변경 실패!");
            
         return "common/errorPage";
      }
   }
   
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
      } catch (IOException e) {
         e.printStackTrace();
      }
      return changeName;
   }
   
   @RequestMapping("updateMember.me")
   public String updateMember(Member m, MultipartFile reupfile, Model model, HttpSession session) {
      

      if(m.getGender().equals("X")) { // X값을 null로 처리
         
         m.setGender(null);
      }

      // 넘어온 첨부파일이 없을 경우 : filename 속성값이 빈 문자열
      // 넘어온 첨부파일이 있을 경우 : filename 속성값에 원본파일명이 들어있음
      if(!reupfile.getOriginalFilename().equals("")) { // "새로운" 첨부파일이 있을 경우
               
            // 4. 새롭게 첨부된 파일이  O, 기존 첨부파일 O
            if(m.getOriginName() != null) { // 기존 첨부파일의 원본명이 있을 경우
                  
            // 기존 첨부파일을 서버로부터 삭제 (수정명)
            String savePath = session.getServletContext().getRealPath(m.getChangeName());
            new File(savePath).delete();
         }
               
         // 이 시점에서 서버에 파일 업로드 가능
         String changeName = saveFile(reupfile, session);
               
         // b 에 새로 넘어온 첨부파일에 대한 원본명, 수정명을 필드값으로 수정
         m.setOriginName(reupfile.getOriginalFilename());
         m.setChangeName("resources/uploadFiles/" + changeName);
      }

      else { // 새로운 첨부파일이 없을 경우
         
         m.setOriginName(null);
         m.setChangeName(null);
      }

      int result = memberService.updateMember(m);
            
      if(result > 0) { // 성공
               
         session.setAttribute("alertMsg", "성공적으로 정보가 수정되었습니다.");
               
         Member updateMem = memberService.loginMember(m); // 새로 바뀐 정보로 한번 더 조회

         
         session.setAttribute("loginUser", updateMem); // 세션에 덮어씌우기
         
         return "redirect:myPage.me";

      }
      else { // 실패
               
         model.addAttribute("errorMsg", "회원정보 변경실패!");
         
         return "common/errorPage"; // /WEB-INF/views/common/errorPage.jsp
      }
   }

  

    @RequestMapping("delete.me")
    public String deleteMember(Member m, Model model, HttpSession session) {

        int result = memberService.deleteMember(m);

        if (result > 0) { // 성공

            session.setAttribute("alertMsg", "그동안 이용해주셔서 감사합니다.");
            session.removeAttribute("loginUser");

            return "redirect:/";
        } else { // 성공

            model.addAttribute("errorPage", "회원탈퇴 실패!");

            return "common/errorPage";
        }
    }

    // 이메일 인증, 중복체크
    @ResponseBody
    @RequestMapping(value = "mailCheck.me", produces = "text/html; charset=utf-8")
    public String sendEmail(HttpServletRequest request, HttpServletResponse response, String memberId)
            throws Exception {

        int count = memberService.idCheck(memberId);
        // count 에 1이 담겨있을경우 => 이미 사용중인 아이디가 있음 (사용불가)
        if (count > 0) { // 이미 존재하는 아이디 => "N"

            return "N";
        } else {
            // 메일 관련 정보
            String host = "smtp.naver.com";
            final String username = "wearetamnaji"; // 네이버 이메일 주소중 @ naver.com 앞주소만 작성
            final String password = "tamnaji4"; // 네이버 이메일 비밀번호를 작성
            int port = 465; // 네이버 STMP 포트 번호

            Properties props = System.getProperties();

            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", port);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.enable", "true");
            props.put("mail.smtp.ssl.trust", host);

            StringBuffer temp = new StringBuffer();
            Random rnd = new Random();
            for (int i = 0; i < 6; i++) {
                int rIndex = rnd.nextInt(3);
                switch (rIndex) {
                    case 0:
                        // a-z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                        break;
                    case 1:
                        // A-Z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                        break;
                    case 2:
                        // 0-9
                        temp.append((rnd.nextInt(10)));
                        break;
                }

            }

            String AuthenticationKey = temp.toString();
            // 메일 내용
            String recipient = memberId; // 메일을 발송할 이메일 주소를 기재해 줍니다.
            String subject = "탐나지 이메일 인증번호"; // 메일 발송시 제목을 작성
            String body = AuthenticationKey; // 메일 발송시 내용 작성

            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                String un = username;
                String pw = password;

                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(un, pw);
                }
            });
            session.setDebug(true); // for debug

            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress("wearetamnaji@naver.com"));
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(body);
            Transport.send(mimeMessage);

            return AuthenticationKey;
        }
    }
  
   // 닉네임 중복 체크
   @ResponseBody
   @RequestMapping(value="nameCheck.me", produces="text/html; charset=utf-8")
   public String nameCheck(HttpServletRequest request, HttpServletResponse response, String nickname) {
      
      int count = memberService.nameCheck(nickname);
      // count 에 1이 담겨있을경우 => 이미 사용중인 닉네임이 있음 (사용불가)
      return (count > 0) ? "N" : "Y"; // 삼항연산자 이용
   }
   
   // 비밀번호 재설정
   @ResponseBody
   @RequestMapping(value="mailPwd.me", produces="text/html; charset=utf-8")
   public String sendPwdEmail(HttpServletRequest request, HttpServletResponse response, String memberId, ModelAndView mv) throws Exception {
      
      int count = memberService.idCheck(memberId);
      // count 에 1이 담겨있을경우 => 회원가입한 아이디가 있음
      if(count > 0) {
         // 메일 관련 정보
          String host = "smtp.naver.com";
          final String username = "wearetamnaji"; // 네이버 이메일 주소중 @ naver.com 앞주소만 작성
          final String password = "tamnaji4";	// 네이버 이메일 비밀번호를 작성
          int port=465;	// 네이버 STMP 포트 번호
          
          Properties props = System.getProperties();
          
          props.put("mail.smtp.host", host);
          props.put("mail.smtp.port", port);
          props.put("mail.smtp.auth", "true");
          props.put("mail.smtp.ssl.enable", "true");
          props.put("mail.smtp.ssl.trust", host);
          
           StringBuffer temp = new StringBuffer();
           Random rnd = new Random();
           for(int i=0; i<5; i++) {
               int rIndex = rnd.nextInt(3);
               switch (rIndex) {
               case 0:
                   // a-z
                   temp.append((char)((int)(rnd.nextInt(26)) + 97));
                   break;
               case 1:
                   // 0-9
                   temp.append((rnd.nextInt(10)));
                   break;
               }
           }
           
           String AuthenticationKey = "수정된 비밀번호 : " + temp.toString() + System.lineSeparator() + "로그인 후 마이페이지에서 비밀번호를 변경해 주세요.";
           
           String changedPwd = bCryptPasswordEncoder.encode(temp.toString());
           
           HashMap<String, String> map = new HashMap<String, String>();
           map.put("memberId", memberId);
           map.put("changedPwd", changedPwd);
           
           int result = memberService.pwdReset(map);
           // 메일 내용
          String recipient = memberId;      // 메일을 발송할 이메일 주소를 기재해 줍니다.
          String subject = "탐나지 새비밀번호";   // 메일 발송시 제목을 작성
          String body = AuthenticationKey;   // 메일 발송시 내용 작성
          
          Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
        	  String un=username;
              String pw=password;
              protected PasswordAuthentication getPasswordAuthentication() {
            	  return new PasswordAuthentication(un, pw);
              }
          });
          session.setDebug(true); // for debug

          Message mimeMessage = new MimeMessage(session);
          mimeMessage.setFrom(new InternetAddress("wearetamnaji@naver.com"));
          mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
          mimeMessage.setSubject(subject);
          mimeMessage.setText(body);
          Transport.send(mimeMessage);

          return AuthenticationKey;
      } else {  // 존재하지 않는 아이디 => "N"

         return "N";
      }
   }
   
   // 마이페이지에 '나의 예약내역' 메뉴를 클릭해서 요청한 경우 => /MyReservationList.me (기본적으로 1 번 페이지를 요청하게끔 처리)
   // 페이징바의 "숫자" 를 클릭해서 요청한 경우 => /MyReservationList.me?cpage=요청하는페이지수
   @RequestMapping("MyReservationList.me")
   public String MyReservationList(
         @RequestParam(value="cpage", defaultValue="1") int currentPage, 
         Model model, HttpSession session) {
      
      // 현재 로그인한 사용자의 아이디
      String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
      
      // System.out.println("cpage : " + currentPage);
      
      // 페이징처리를 위한 변수들 셋팅 => PageInfo 객체
      
      int listCount = memberService.MyReservationListCount(memberId);
      
      int pageLimit = 5;
      int boardLimit = 2;
      
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
      
      ArrayList<Reservation> list = memberService.MyReservationList(pi, memberId);
      
      // System.out.println("listCount : " + listCount);
      //System.out.println("list : " + list);
      // System.out.println("pi : " + pi);
      
      model.addAttribute("pi", pi); // 페이징 처리 값
      model.addAttribute("list", list); // vo객체 가공한 데이터 값
      //System.out.println(list);
      // 나의 예약내역 리스트 포워딩
      return "member/memberReservationList";
   }
   
   @ResponseBody
   @RequestMapping(value="myReviewList.me", produces="application/json; charset=UTF-8")
   public String ajaxReviewSelect(String cpage,
		   HttpSession session) {
	   
	   int currentPage = Integer.parseInt(cpage);
	   
	   // System.out.println(currentPage);
	   
	   String memberNo = String.valueOf(((Member)(session.getAttribute("loginUser"))).getMemberNo());
	   
	   int listCount = memberService.ReviewSelectListCount(memberNo);
	      
	   int pageLimit = 5;
	   int boardLimit = 2;
	      
	   PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	   
	   ArrayList<Review> list = memberService.ReviewSelectList(pi, memberNo);
	   
	   HashMap <String, Object> res = new HashMap<>();
	   res.put("list", list);
	   res.put("pi", pi);
	   // System.out.println("memberNo : " + memberNo);
	   //System.out.println("listCount : " + listCount);
	   //System.out.println("pi : " + pi);
	   
	   return new Gson().toJson(res);
   }
   
   // 포워딩화면
   @RequestMapping("myReviewListView.me")
   public String myReviewView() {
	   
	   
	   return "member/myReviewList";
   }
   
   @RequestMapping(value="reviewCreate.me")
   public String reviewCreate(Review r, HttpSession session) {
	   
	   // 인서트하기 전에 오더 아이디 기준으로 후기 테이블 행이 있는지 없는지 조회하고 인서트한다.
	   int reviewCK = memberService.reviewListCount(r);
	   

	   if(reviewCK == 0) {
		   
		   int result = memberService.reviewCreate(r);

		   session.setAttribute("alertMsg", "리뷰가 성공적으로 등록되었습니다.");
		   
		   return "redirect:/myReviewListView.me";	  
	   }
	   else {
		   
		   session.setAttribute("alertMsg", "이미 후기를 작성하셨습니다!");
		   
		   return "redirect:/MyReservationList.me";
	   }   
   }
   
   @ResponseBody
   @RequestMapping(value="reviewDelete.me", produces="application/json; charset=UTF-8")
   public String ajaxreviewDelete(int roomNo) {

	   int result = memberService.reviewDelete(roomNo);
	   
	 
	   return new Gson().toJson(result);
   }
   
   
   
  @RequestMapping("hostRequest.me")
   public String hostRequest(Member m, HttpSession session, Model model) {
      
      int result = memberService.HostRequest(m);
      
      if(result > 0) {
         
         session.setAttribute("alertMsg", "호스트 신청이 접수되었습니다. 관리자승인 후 판매자 서비스 이용가능합니다.");
         
         Member updateMem = memberService.loginMember(m);
         
         session.setAttribute("loginUser", updateMem);
         
         return "member/hostRequest";
      }
      else {
         
         model.addAttribute("errorPage", "은행명, 계좌번호 업데이트 실패!");
         
         return "common/errorPage";
      }
   }
   
   @RequestMapping("hostSelect.me")
   public String hostSelectSpaceInfo(
		   @RequestParam(value="cpage", defaultValue="1") int currentPage,
	         String cpage,
	         Model model, HttpSession session) {
	   
	   
	   // 현재 로그인한 사용자의 아이디
	   int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
	   
       int listCount = memberService.hostSelectSpaceListCount(memberNo);
       
       // System.out.println(memberNo);
       
       int pageLimit = 5;
       int boardLimit = 2;
       
       PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
       
       ArrayList<RoomVO> list = memberService.hostSelectSpaceInfo(pi, memberNo);
       
       // System.out.println("controller :" + pi);
 
       model.addAttribute("pi", pi); // 페이징 처리 값
       model.addAttribute("list", list); // vo객체 가공한 데이터 값
       
       // 나의 예약내역 리스트 포워딩
       return "member/hostSelectSpace";
   }
   
   @RequestMapping("hostReservation.me")
   public String hostReservationList(
		   	@RequestParam(value="cpage", defaultValue="1") int currentPage, 
	         Model model, HttpSession session) {
	   
	   int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();	
	   
	   int listCount = memberService.hostReservationListCount(memberNo);
	      
       int pageLimit = 5;
       int boardLimit = 2;
       
       PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
       
       ArrayList<Reservation> list = memberService.hostReservationList(pi, memberNo);
       
       model.addAttribute("pi", pi); // 페이징 처리 값
       model.addAttribute("list", list); // vo객체 가공한 데이터 값
       
	   return "member/hostReservationList";	
   }
}