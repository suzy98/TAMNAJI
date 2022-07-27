package com.kh.tamnaji.space.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.common.template.Pagination;
import com.kh.tamnaji.member.model.vo.Member;
import com.kh.tamnaji.room.model.vo.RoomVO;
import com.kh.tamnaji.space.model.service.SpaceService;
import com.kh.tamnaji.space.model.vo.Space;
import com.kh.tamnaji.space.model.vo.SpaceAttachment;
import com.kh.tamnaji.space.model.vo.SpaceCategory;
import com.kh.tamnaji.space.model.vo.SpaceFacility;
import com.kh.tamnaji.space.model.vo.SpaceReview;

@Controller
public class SpaceController {

   @Autowired
   private SpaceService spaceService;
   
   @RequestMapping(value="mbtiPage.sp")
    public String selectMbitPage() {
        
        return "board/MBTIList";
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
      } catch (IllegalStateException | IOException e) {
         e.printStackTrace();
      }
      
      return changeName;
   }
   
   
   @RequestMapping(value="mbtilist.sp")
    public String selectMbitList(String mbti, Model model) {
      
      mbti = mbti.toUpperCase();
      
        ArrayList<Space> list = spaceService.selectMbtiList(mbti);
        
        model.addAttribute("mbti", mbti);
        model.addAttribute("list", list);
       
        return "board/mbtiResult";
    }
   
    // 스페이스 카테고리 조회
    @RequestMapping("adminCategory.sp")
    public String adminCategory(Model model, SpaceCategory sc) {
        ArrayList<SpaceCategory> list = spaceService.adminCategory(sc);
        model.addAttribute("list", list);
        return "admin/adminCategory";
    }
    
    // 스페이스 카테고리 생성
    @RequestMapping("adminCategoryCreate.sp")
    public String adminCategoryCreate(SpaceCategory sc) {
        int result = spaceService.adminCategoryCreate(sc);
        if (result > 0) {
            return "redirect:adminCategory.sp";
        } else {
            return "common/errorPage";
        }
    }
    
    // 스페이스 카테고리 삭제
    @ResponseBody
    @RequestMapping(value="adminCategoryDelete.sp", produces = "text/html; charset=utf-8;")
    public String adminCategoryDelete(int spType) {
        int result = spaceService.adminCategoryDelete(spType);
        if (result > 0) {
            return "Y";
        } else {
            return "N";
        }
    }
    
    // 스페이스 카테고리 수정
    @RequestMapping("adminCategoryUpdate.sp")
    public String adminCategoryUpdate(SpaceCategory sc) {
        int result = spaceService.adminCategoryUpdate(sc);
        if (result > 0) {
            return "redirect:adminCategory.sp";
        } else {
            return "common/errorPage";
        }
    }
    
    // 스페이스 편의시설 조회
    @RequestMapping("adminFacility.sp")
    public String adminFacility(Model model, SpaceFacility sf, SpaceCategory sc) {
        ArrayList<SpaceFacility> list = spaceService.adminFacility(sf);
        ArrayList<SpaceCategory> scList = spaceService.adminCategory(sc);
        model.addAttribute("list", list);
        model.addAttribute("scList", scList);
        return "admin/adminFacility";
    }
    
    // 스페이스 편의시설 생성
    @RequestMapping(value = "adminFacilityCreate.sp", produces = "text/html; charset=utf-8;")
    public String adminFacilityCreate(SpaceFacility sf, MultipartFile file, HttpSession session) {
        // 첨부파일 등록
        if (!file.getOriginalFilename().equals("")) {
            String changeName = saveFile(file, session);
            sf.setOriginName(file.getOriginalFilename());
            sf.setChangeName("resources/uploadFiles/" + changeName);
        }
        int result = spaceService.adminFacilityCreate(sf);
        if (result > 0) {
            return "redirect:adminFacility.sp";
        } else {
            return "common/errorPage";
        }
    }
    
    // 스페이스 편의시설 삭제
    @RequestMapping("adminFacilityDelete.sp")
    public String adminFacilityDelete(int sfNo) {
        int result = spaceService.adminFacilityDelete(sfNo);
        if (result > 0) {
            return "redirect:adminFacility.sp";
        } else {
            return "common/errorPage";
        }
    }
    
    // 스페이스 편의시설 수정
    @RequestMapping("adminFacilityUpdate.sp")
    public String adminFacilityUpdate(SpaceFacility sf) {
        int result = spaceService.adminFacilityUpdate(sf);
        if (result > 0) {
            return "redirect:adminFacility.sp";
        } else {
            return "common/errorPage";
        }
    }
    
    // 스페이스 관리 조회
    @RequestMapping("adminSpaceSelect.sp")
    public String adminSpaceSelect(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
        int listCount = spaceService.selectListCount();
        int pageLimit = 10;
        int boardLimit = 10;

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Space> list = spaceService.adminSpaceSelect(pi);
        model.addAttribute("list", list).addAttribute("pi", pi);
        return "admin/adminSpace";
    }
    
    // 스페이스 관리자 검색
    @ResponseBody
    @RequestMapping(value = "adminSpaceSearch.sp", produces = "application/json; charset=utf-8")
    public String adminSpaceSearch(Model model, String keyword, String search) {
        HashMap<String, String> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("search", search);
        ArrayList<Space> list = spaceService.adminSpaceSearch(map);

        model.addAttribute("list", list);
        return new Gson().toJson(list);
    }
    
    
    @RequestMapping("searchSpace")
    public ModelAndView seachSpace(@RequestParam(value = "cpage", defaultValue = "1") int currentPage
    		, @RequestParam(value = "categoryName", defaultValue = "숙박") String categoryName
    		, @RequestParam HashMap<String, Object> body, String keyword, HttpSession session, ModelAndView mv) {

    	String pm = String.join(",", (String) body.get("mapCheck"));
        if (pm.length() > 1) {
        	body.put("mapCheck", 0);
        }
        if (body.get("minPrice")==null||body.get("maxPrice")==null) {
            body.put("minPrice", 0);
            body.put("maxPrice", 30000000);
        }
    	
        body.put("categoryName", categoryName);
    	body.put("keyword", keyword);
    	Member m = (Member)session.getAttribute("loginUser");
        if ( m != null ) {
        	body.put("memberNo", m.getMemberNo());
        }
        int listCount = spaceService.searchListCount(body);
        int pageLimit = 10;
        int boardLimit = 6;

        
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Space> sList = spaceService.searchSpaceList(pi,body);

        ArrayList<SpaceCategory> sc = spaceService.selectCategoryList((String)body.get("categoryName"));
        ArrayList<SpaceFacility> sf = spaceService.selectFacilityList((String)body.get("categoryName"));

        mv.addObject("pi", pi)
                .addObject("sList", sList)
                .addObject("data", body)
                .addObject("sf", sf)
                .addObject("sc", sc)
        .setViewName("space/searchListView");
        return mv;
    	
    }
    
    // 스페이스 전체 조회
    @RequestMapping("space.sp")
    public ModelAndView selectStayList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, @RequestParam(value = "categoryName", defaultValue = "숙박") String categoryName
    		, ModelAndView mv, @RequestParam HashMap<String, Object> map
    		, HttpSession session, String category) {
            
        String pm = String.join(",", (String) map.get("mapCheck"));
        if (pm.length() > 1) {
            map.put("mapCheck", 0);
        }
        if (map.get("minPrice")==null||map.get("maxPrice")==null) {
            map.put("minPrice", 0);
            map.put("maxPrice", 30000000);
        }
        int listCount = spaceService.selectListCount(map);
        int pageLimit = 10;
        int boardLimit = 6;
        

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Space> sList = spaceService.selectSpaceList(pi,map);
        ArrayList<SpaceCategory> sc = spaceService.selectCategoryList(categoryName);
        ArrayList<SpaceFacility> sf = spaceService.selectFacilityList(categoryName);

        
        mv.addObject("space", sList)
                .addObject("sc", sc)
                .addObject("pi", pi)
                .addObject("map", map)
                .addObject("category", category)
        .setViewName("space/spaceListView");
        return mv;
    }
    
    // 공간 상세 조회
    @GetMapping("space")
    public ModelAndView selectSpace(String sno, ModelAndView mv, HttpSession session) {
       int spaceNo = Integer.parseInt(sno);
       // 1. 해당 공간 조회수 증가용 서비스 먼저 요청
       int result = spaceService.increaseCount(spaceNo);
       
       Member m = (Member)session.getAttribute("loginUser");
       int memberNo = 0;
       if(m != null) {
          memberNo = m.getMemberNo();
       }

      Map<String, Integer> data = new HashMap<String, Integer>();
      data.put("spaceNo", spaceNo);
      data.put("memberNo", memberNo);
      
      int wishYN = spaceService.wishListGet(data);
       
       
       if(result > 0) {
          // 2. 조회수 증가가 잘 이루어졌다면 그때 상세조회 서비스 요청
          Space s = spaceService.selectSpace(spaceNo);
          ArrayList<SpaceAttachment> saList = spaceService.selectAttachmentList(spaceNo);
            ArrayList<SpaceFacility> sfList = spaceService.selectFacilityList(spaceNo);
            
            ArrayList<String> hashtags = new ArrayList<>();
           StringTokenizer st = new StringTokenizer(s.getHashtag(), "#");
            
            while(st.hasMoreTokens()) {
               hashtags.add(st.nextToken());
            }
            mv.addObject("s", s)
               .addObject("hashTags", hashtags)
               .addObject("wishYN", wishYN)
              .addObject("saList", saList)
              .addObject("sfList", sfList)
            .setViewName("space/spaceDetailForm");
       } else { // 조회수 증가가 실패했을 때
          
          mv.addObject("errorMsg", "공간 상세조회 실패").setViewName("common/errorPage");
       }
       return mv;
    }
   
 // 객실에 대한 제한 인원수 조회
    @RequestMapping("peopleCount.sp")
    @ResponseBody
    public String peopleCount(RoomVO roomVO) {
       
       int peopleCount = 0; // spaceService.peopleCount(roomVO.getRoomNo());
       
       return String.valueOf(peopleCount);
    }
    
    
    /*  파일 업로드 */
    // 공간 편의시설 조회
    @RequestMapping("facility.sp")
    public String selectFacility(Model model, SpaceFacility sf, SpaceCategory sc) {
        ArrayList<SpaceFacility> list = spaceService.adminFacility(sf);
        ArrayList<SpaceCategory> scList = spaceService.adminCategory(sc);
        model.addAttribute("list", list);
        model.addAttribute("scList", scList);
        return "space/spaceDetailView";
    }
   
    // 스페이스 등록 폼으로 이동(유형 선택)
    @RequestMapping("spaceEnrollForm.sp")
    public String spaceEnrollForm() {
        //ArrayList<SpaceCategory> list = spaceService.adminCategory();
        //model.addAttribute("list", list);
        return "space/spaceEnrollForm";
    }

    //스페이스 등록 폼2
    @RequestMapping("spaceEnrollForm2.sp")
    public String spaceEnrollForm2(int spType, Model model) {
        ArrayList<SpaceFacility> sfList = spaceService.spaceFacilityList(spType);
        model.addAttribute("spType", spType).addAttribute("sfList",sfList);
        return "space/spaceEnrollForm2";
    }
    // 스페이스 등록
    @RequestMapping("spaceInsert.sp")
    public ModelAndView spaceInsert(ModelAndView mv, HttpSession session, SpaceAttachment sa, @RequestParam HashMap<String, Object> map,
            @RequestParam ArrayList<MultipartFile> file,
            @RequestParam(required = false) ArrayList<Integer> facilityName) {


        //스페이스 등록
        int result1 = spaceService.spaceInsert(map);
        int result2 = 0;
        int result3 = 0;

        //첨부파일 등록
        for (MultipartFile a : file) {
            if (!a.getOriginalFilename().equals("")) {
                String changeName = saveFile(a, session);

                sa.setOriginName(a.getOriginalFilename());
                sa.setChangeName("resources/uploadFiles/" + changeName);
                if (file.get(0) == a) {
                    sa.setStep(1);
                } else {
                    sa.setStep(2);
                }
                result2 = spaceService.spaceAttacmentInsert(sa);
            }
        }
        //편의시설 등록
        for (Integer spNo : facilityName) {
            result3 = spaceService.spaceFacilityInsert(spNo);
        }

        if (result1 * result2 * result3 > 0) {
            session.setAttribute("alertMsg", "성공적으로 공간이 등록되었습니다");
            mv.setViewName("redirect:hostSpaceList.sp");
        } else {
            mv.addObject("errorMsg", "공간 등록 실패").setViewName("common/errorPage");
        }
        return mv;
    }
    
   // -----------------------------------------------------------------------------------------------------------
   
    @GetMapping(value="/wishListForm")
    public String myWishList() {
       return "member/memberWishList";
    }

   @GetMapping(value="/wishList", produces="application/json; charset=UTF-8")
   @ResponseBody
   public String wishListGets(String cPage, String mNo) {
      int memberNo = Integer.parseInt(mNo);
      int currentPage = Integer.parseInt(cPage);
      int listCount = spaceService.wishListCount(memberNo);
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
 
      ArrayList<Space> sList = spaceService.wishListGets(memberNo, pi);

      Map<String, Object> data = new HashMap<String, Object>();
      data.put("pi", pi);
      data.put("sList", sList);
      return new Gson().toJson(data);
   }
   
   @GetMapping(value="/wish", produces="application/json; charset=UTF-8")
   @ResponseBody
   public String wishYNGet(String mNo, String sNo) {
      int memberNo = Integer.parseInt(mNo);
      int spaceNo = Integer.parseInt(sNo);
      Map<String, Integer> data = new HashMap<String, Integer>();
      data.put("spaceNo", spaceNo);
      data.put("memberNo", memberNo);
      
      int wishYN = spaceService.wishListGet(data);
      int wishCount = spaceService.wishCount(spaceNo);
      
    
      Map<String, Integer> data2 = new HashMap<>();
      data2.put("wishYN", wishYN);
      // 1이라면 찜한 목록이 존재, 0이라면 찜하지 않았음
      data2.put("wishCount", wishCount);
      
      return new Gson().toJson(data2);
   
   }
   
   @DeleteMapping(value="/wishList", produces="application/json; charset=utf-8")
   @ResponseBody
   public String wishListDelete(@RequestBody Map<String, Object> body) {
      
      Map<String, Integer> data = new HashMap<String, Integer>();
      
      data.put("spaceNo", (Integer) body.get("spaceNo"));
      data.put("memberNo", (Integer) body.get("memberNo"));
      
         int result = spaceService.wishListDelete(data);
         return ( result>0 ) ?  new Gson().toJson("NNNNY") : new Gson().toJson("NNNNN");
   }
   
   @PostMapping(value="/wishList", produces="application/json; charset=utf-8")
   @ResponseBody
   public String wishListPost(@RequestBody Map<String, Object> body) {
      
      Map<String, Integer> data = new HashMap<String, Integer>();
      
      data.put("spaceNo", (Integer) body.get("spaceNo"));
      data.put("memberNo", (Integer) body.get("memberNo"));
      
      int result = spaceService.wishListPost(data);
      return ( result>0 ) ?  new Gson().toJson("NNNNY") : new Gson().toJson("NNNNN");
      
   }
   
   @GetMapping(value="/review", produces="application/json; cherset=utf-8")
   @ResponseBody
   public String reviewGets(int sno, int cpage) {

	   int spaceNo = sno;

	   int listCount = spaceService.reviewCount(spaceNo);

	   PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 5);

	   ArrayList<SpaceReview> reList = spaceService.reviewGets(spaceNo, pi);
	   
	   Map<String, Object> resMap = new HashMap<String, Object>();

	   resMap.put("reList", reList);
	   resMap.put("pi", pi);

	   return new Gson().toJson(resMap);
   }
    
   //호스트 공간 조회
   @RequestMapping("hostSpaceList.sp")
   public String hostSpaceList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
		   					   Member m, HttpSession session) {
	   int memberNo = ((Member) session.getAttribute("loginUser")).getMemberNo();
	   int listCount = spaceService.selectHostListCount(memberNo);
	   int pageLimit = 10;
	   int boardLimit = 2;

	   PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	   ArrayList<Space> sList = spaceService.hostSpaceList(memberNo, pi);
	   model.addAttribute("sList", sList).addAttribute("pi", pi);
	   return "space/hostSpaceList";
   }
}
