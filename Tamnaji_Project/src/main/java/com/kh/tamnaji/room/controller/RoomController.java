package com.kh.tamnaji.room.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.tamnaji.reply.model.vo.Reply;
import com.kh.tamnaji.room.model.service.RoomService;
import com.kh.tamnaji.room.model.vo.RoomVO;

@Controller
public class RoomController {
    @Autowired
    private RoomService roomService;

    // 객실 등록 폼 이동
    @RequestMapping("roomEnrollForm.sp")
    public String roomEnrollForm(int sno, Model model) {
        model.addAttribute("sno", sno);
        return "space/roomEnrollForm";
    }

    // 객실 등록
    @RequestMapping(value = "roomInsert.sp", produces = "text/html; charset=utf-8;")
    public String roomInsert(Model model, RoomVO room, MultipartFile roomFile, HttpSession session, int sno) {
        if (!roomFile.getOriginalFilename().equals("")) {
            String changeName = saveFile(roomFile, session);
            room.setOriginName(roomFile.getOriginalFilename());
            room.setChangeName("resources/uploadFiles/" + changeName);
        }
        room.setSpaceNo(sno);
        int result = roomService.roomInsert(room);
        if (result > 0) {
            session.setAttribute("alertMsg", "객실 등록 성공");
            return "redirect:/myPage.me";
        } else {
            model.addAttribute("errorMsg", "객실 등록 실패");
            return "common/errorPage";
        }
    }
    
    // 객실 조회
    @ResponseBody
	@RequestMapping(value="selectRoomList.ro", produces="application/json; charset=UTF-8")
	public String ajaxSelectRoomList(int spaceNo) {
		
		ArrayList<RoomVO> list = roomService.selectRoomList(spaceNo);
		return new Gson().toJson(list);
	}
    
    // 객실 정보 조회
    @ResponseBody
	@RequestMapping(value="loadRoomInfo.ro", produces="application/json; charset=UTF-8")
	public String ajaxLoadRoomInfo(int roomNo) {
		
    	RoomVO room = roomService.selectRoom(roomNo);
    	//System.out.println(room);
		return new Gson().toJson(room);
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
