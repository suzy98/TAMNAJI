package com.kh.tamnaji.space.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.room.model.vo.RoomVO;
import com.kh.tamnaji.space.model.vo.Space;
import com.kh.tamnaji.space.model.vo.SpaceAttachment;
import com.kh.tamnaji.space.model.vo.SpaceCategory;
import com.kh.tamnaji.space.model.vo.SpaceFacility;
import com.kh.tamnaji.space.model.vo.SpaceReview;

public interface SpaceService {

    ArrayList<Space> selectMbtiList(String mbti);

    //카테고리 조회
    ArrayList<SpaceCategory> adminCategory(SpaceCategory sc);

    //카테고리 생성
    int adminCategoryCreate(SpaceCategory sc);

    //카테고리 삭제
    int adminCategoryDelete(int spType);

    //카테고리 수정
    int adminCategoryUpdate(SpaceCategory sc);

    //편의시설 조회
    ArrayList<SpaceFacility> adminFacility(SpaceFacility sf);

    //편의시설 생성
    int adminFacilityCreate(SpaceFacility sf);

    //편의시설 삭제
    int adminFacilityDelete(int sfNo);

    //편의시설 수정
    int adminFacilityUpdate(SpaceFacility sf);

    //스페이스 관리 조회
    ArrayList<Space> adminSpaceSelect(PageInfo pi);

    // 스페이스 총 갯수 조회
    int selectListCount();

    //스페이스 관리자 검색
    ArrayList<Space> adminSpaceSearch(HashMap<String, String> map);

    //스페이스 전체 조회
    ArrayList<Space> selectSpaceList(PageInfo pi, HashMap<String, Object> map);

    int selectListCount(HashMap<String, Object> map);
    
	// 공간 조회수 증가 (update)
	int increaseCount(int sno);
	
	Space selectSpace(int sno); // 공간 상세정보조회
	ArrayList<SpaceAttachment> selectAttachmentList(int sno); // 공간 첨부파일 조회
	ArrayList<SpaceFacility> selectFacilityList(int sno); // 공간 편의시설 조회

	// 내가 찜한 목록 페이지 띄우기
	ArrayList<Space> wishListGets(int memberNo, PageInfo pi);

	int wishListDelete(Map<String, Integer> data);

	int wishListPost(Map<String, Integer> data);

    //스페이스 카테고리 조회
    ArrayList<SpaceCategory> adminCategory();
	
	// 예약하기로 넘어갈 때, 공간정보에 대한 내용을 띄워줄 메소드
	Space spaceGet(Map<String, String> body);

	// 찜하기 목록에 들어가있는지 확인하는 용도
	int wishListGet(Map<String, Integer> data);

	// 찜하기 목록 페이지 갯수
	int wishListCount(int memberNo);

    //스페이스 카테고리 편의시설 조회
    ArrayList<SpaceFacility> adminFacility(int category);

    //스페이스 등록
    int spaceInsert(HashMap<String, Object> map);

    //스페이스 첨부파일 등록
    int spaceAttacmentInsert(SpaceAttachment sa);

    //스페이스 편의시설 등록
    int spaceFacilityInsert(Integer spNo);

    //스페이스 유형별 카테고리 조회
    ArrayList<SpaceCategory> selectCategoryList(String categoryName);

	int reviewCount(int spaceNo);

	ArrayList<SpaceReview> reviewGets(int spaceNo, PageInfo pi);

    //스페이스 카테고리별 편의시설 조회
    ArrayList<SpaceFacility> spaceFacilityList(int spType);

    Space selectSpace();

    ArrayList<SpaceFacility> selectFacilityList(String categoryName);
    
    // 공간 한 개의 찜하기 갯수
	int wishCount(int spaceNo);

    //호스트 공간 조회
    ArrayList<Space> hostSpaceList(int memberNo, PageInfo pi);
    //호스트 공간 조회 개수
    int selectHostListCount(int memberNo);
    //호스트 공간 수정 폼
    Space spaceUpdateForm(int sno);
    //호스트 공간 수정
    int spaceUpdate(Space space);
    //호스트 공간 첨부파일 수정
    int spaceAttacmentUpdate(SpaceAttachment sa);

	int searchListCount(Map<String, Object> body);

	ArrayList<Space> searchSpaceList(PageInfo pi, Map<String, Object> body);
}
