package com.kh.tamnaji.event.controller;

import java.util.Date;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.common.template.Pagination;
import com.kh.tamnaji.event.model.service.EventService;
import com.kh.tamnaji.event.model.vo.Event;


@Controller
public class EventController {
    @Autowired
    private EventService eventService;

    //관리자 이벤트 리스트 조회
    @RequestMapping("eventList.ev")
    public String eventList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
        int listCount = eventService.selectListCount();

        int pageLimit = 10;
        int boardLimit = 5;

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

        ArrayList<Event> list = eventService.selectList(pi);

        model.addAttribute("list", list).addAttribute("pi", pi);
        return "admin/adminEvent";
    }

    //이벤트 추가 폼 이동
    @RequestMapping("eventEnrollForm.ev")
    public String eventEnrollForm() {
        return "event/eventEnrollForm";
    }

    //이벤트 추가
    @RequestMapping("insertEvent.ev")
    public String insertEvent(Event ev, MultipartFile upfile, HttpSession session, Model model) {
        //System.out.println(ev);
        //System.out.println(upfile);

        if (!upfile.getOriginalFilename().equals("")) {
            String changeName = saveFile(upfile, session);

            ev.setOriginName(upfile.getOriginalFilename());
            ev.setChangeName("resources/uploadFiles/" + changeName);
        }

        int result = eventService.insertEvent(ev);
        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 이벤트가 등록되었습니다");

            return "redirect:eventList.ev";
        } else {
            model.addAttribute("errorMsg", "이벤트 등록 실패");
            return "common/errorPage";
        }
    }

    // 이벤트 수정 폼
    @RequestMapping("eventUpdateForm.ev")
    public String eventUpdateForm(int eventNo, Model model) {
        Event event = eventService.selectEvent(eventNo);

        model.addAttribute("ev", event);

        return "event/eventUpdateForm";
    }
    
    //이벤트 수정
    @RequestMapping("updateEvent.ev")
    public String updateEvent(Event ev, MultipartFile reUpfile, HttpSession session, Model model, int fileDelete) {
        // 넘어온 첨부파일이 없을 경우 : filename 속성값이 빈 문자열
        // 넘어온 첨부파일이 있을 경우 : filename 속성값에 원본파일명이 들어있음
        if (!reUpfile.getOriginalFilename().equals("")) {// "새로운" 첨부파일이 있을 경우
            // 새롭게 첨부된 파일이 O, 기존 첨부파일 O
            if (ev.getOriginName() != null) {// 기존 첨부파일의 원본명이 있을 경우
                // 기존 첨부파일을 서버로부터 삭제 (수정명)
                String savePath = session.getServletContext().getRealPath(ev.getChangeName());
                new File(savePath).delete();
            }
            // 이 시점에서 서버에 파일 업로드 가능
            String changeName = saveFile(reUpfile, session);

            // ev 에 새로 넘어온 첨부파일에 대한 원본명, 수정명을 필드값으로 수정
            ev.setOriginName(reUpfile.getOriginalFilename());
            ev.setChangeName("resources/uploadFiles/" + changeName);
        }
        // 이 시점에서
        // 새로운 첨부파일이 있을 경우 ev 의 원본명, 수정명 필드가 수정되어있을 것
        // 새로운 첨부파일이 없을 경우 ev 의 원본명, 수정명 필드가 그대로 남아있을것

        /*
         * 추가적으로 고려해야 하는 경우의 수
         * 1. 새롭게 첨부된 파일이 X, 기존 첨부파일 X
         * => originName : null, changeName : null
         * 
         * 2. 새롭게 첨부된 파일이 X, 기존 첨부파일 O
         * => originName : 기존첨부파일의원본명, changeName : 기존첨부파일의수정명
         * 
         * 3. 새롭게 첨부된 파일이 O, 기존 첨부파일 X
         * => originName : 새로운첨부파일의원본명, changeName : 새로운첨부파일의수정명
         * 
         * 4. 새롭게 첨부된 파일이 O, 기존 첨부파일 O
         * => originName : 새로운첨부파일의원본명, changeName : 새로운 첨부파일의수정명
         */
        if (fileDelete == 1) { // 업로드 되어있는 파일 삭제
            new File(session.getServletContext().getRealPath(ev.getChangeName())).delete();
            ev.setOriginName(null);
            ev.setChangeName(null);
        }
        int result = eventService.updateEvent(ev);

        if (result > 0) { // 성공

            session.setAttribute("alertMsg", "성공적으로 이벤트가 수정되었습니다.");

            //return "redirect:eventList.ev?eventNo="+ev.getEventNo(); 페이징 넣고 할 예정
            return "redirect:eventList.ev";
        } else { // 실패

            model.addAttribute("errorMsg", "이벤트 수정 실패");

            return "common/errorPage"; // /WEB-INF/views/common/errorPage.jsp
        }
    }

    // 이벤트 전체 조회
    @RequestMapping("selectEventList.ev")
    public String selectEventList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
        int listCount = eventService.selectListCount();

        int pageLimit = 10;
        int boardLimit = 5;

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

        ArrayList<Event> list = eventService.selectList(pi);

        model.addAttribute("list", list).addAttribute("pi", pi);
        return "event/eventList";
    }
    
    //이벤트 삭제
    @ResponseBody
    @RequestMapping("deleteEvent.ev")
    public int deleteEvent(int eventNo) {
        return eventService.deleteEvent(eventNo);
    }

    //이벤트 상세 조회
    @RequestMapping("eventDetail.ev")
    public String eventDetail(int eventNo, Model model) {
        Event ev = eventService.selectEvent(eventNo);
        model.addAttribute("e", ev);
        return "event/eventDetail";
    }

    //첨부파일
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
        int ranNum = (int) (Math.random() * 90000 + 10000);

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
