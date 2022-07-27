package com.kh.tamnaji.space.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.room.model.vo.RoomVO;
import com.kh.tamnaji.space.model.dao.SpaceDao;
import com.kh.tamnaji.space.model.vo.FacilitySpace;
import com.kh.tamnaji.space.model.vo.Space;
import com.kh.tamnaji.space.model.vo.SpaceAttachment;
import com.kh.tamnaji.space.model.vo.SpaceCategory;
import com.kh.tamnaji.space.model.vo.SpaceFacility;
import com.kh.tamnaji.space.model.vo.SpaceReview;

@Service
public class SpaceServiceImpl implements SpaceService{

	@Autowired
	private SpaceDao spaceDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Space> selectMbtiList(String mbti) {
		
		ArrayList<Space> list = spaceDao.selectMbtiList(sqlSession, mbti);
		// System.out.println("SpaceService list: " + list);
		// System.out.println("SpaceService mbti: " + mbti);
		return list;	
	}
    //카테고리 조회
    @Override
    public ArrayList<SpaceCategory> adminCategory(SpaceCategory sc) {
        return spaceDao.adminCategory(sqlSession, sc);
    }

    //카테고리 생성
    @Override
    public int adminCategoryCreate(SpaceCategory sc) {
        return spaceDao.adminCategoryCreate(sqlSession, sc);
    }

    //카테고리 삭제
    @Override
    public int adminCategoryDelete(int spType) {
        return spaceDao.adminCategoryDelete(sqlSession, spType);
    }

    //카테고리 수정
    @Override
    public int adminCategoryUpdate(SpaceCategory sc) {
        return spaceDao.adminCategoryUpdate(sqlSession, sc);
    }

    //편의시설 조회
    @Override
    public ArrayList<SpaceFacility> adminFacility(SpaceFacility sf) {
        return spaceDao.adminFacility(sqlSession, sf);
    }

    //편의시설 생성
    @Override
    public int adminFacilityCreate(SpaceFacility sf) {
        return spaceDao.adminFacilityCreate(sqlSession, sf);
    }

    //편의시설 삭제
    @Override
    public int adminFacilityDelete(int sfNo) {
        return spaceDao.adminFacilityDelete(sqlSession, sfNo);
    }

    //편의시설 수정
    @Override
    public int adminFacilityUpdate(SpaceFacility sf) {
        return spaceDao.adminFacilityUpdate(sqlSession, sf);
    }

    //스페이스 관리 조회
    @Override
    public ArrayList<Space> adminSpaceSelect(PageInfo pi) {
        return spaceDao.adminSpaceSelect(sqlSession, pi);
    }

    //스페이스 총 갯수
    @Override
    public int selectListCount() {
        return spaceDao.selectListCount(sqlSession);
    }

    //스페이스 관리자 검색
    @Override
    public ArrayList<Space> adminSpaceSearch(HashMap<String, String> map) {
        return spaceDao.adminSpaceSearch(sqlSession, map);
    }

    //스페이스 전체 조회
    @Override
    public ArrayList<Space> selectSpaceList(PageInfo pi, HashMap<String, Object> map) {
        return spaceDao.selectSpaceList(sqlSession, pi, map);
    }

    @Override
    public int selectListCount(HashMap<String, Object> map) {
        return spaceDao.selectListCount(sqlSession, map);
    }
    
    // 공간 조회수 증가 (update)
	@Override
	public int increaseCount(int sno) {
        return spaceDao.increaseCount(sqlSession, sno);
    }
    //스페이스 카테고리 조회
    @Override
    public ArrayList<SpaceCategory> adminCategory() {
        return spaceDao.adminCategory(sqlSession);
    }

    //스페이스 카테고리 편의시설 조회
    @Override
    public ArrayList<SpaceFacility> adminFacility(int category) {
        return spaceDao.adminFacility(sqlSession, category);
    }

    //스페이스 등록
    @Override
    public int spaceInsert(HashMap<String, Object> map) {
        return spaceDao.spaceInsert(sqlSession, map);
    }
	// 공간 상세 조회 (select)
	@Override
	public Space selectSpace(int sno) {

		return spaceDao.selectSpace(sqlSession, sno);
	}
	
	@Override
	public int wishListDelete(Map<String, Integer> data) {
		return spaceDao.wishListDelete(sqlSession, data);
	}

	@Override
	public int wishListPost(Map<String, Integer> data) {
		return spaceDao.wishListPost(sqlSession, data);
	}
	
    // 예약하기 버튼 클릭 시 띄워줄 스페이스 정보 조회
	@Override
	public Space spaceGet(Map<String, String> body) {
		return spaceDao.spaceGet(sqlSession, body);
	}

	// 찜하기 목록에 들어있는지 확인
	@Override
	public int wishListGet(Map<String, Integer> data) {
		return spaceDao.wishListGet(sqlSession, data);
	}

	@Override
	public int wishListCount(int memberNo) {
		return spaceDao.wishListCount(sqlSession, memberNo);
	}
	
    @Override
    public ArrayList<Space> wishListGets(int memberNo, PageInfo pi) {
        return spaceDao.wishListGets(sqlSession, memberNo, pi);
    }

    //스페이스 첨부파일 등록
    @Override
    public int spaceAttacmentInsert(SpaceAttachment sa) {
        return spaceDao.spaceAttachmentInsert(sqlSession,sa);
    }

    //스페이스 편의시설 등록
    @Override
    public int spaceFacilityInsert(Integer spNo) {
        return spaceDao.spaceFacilityInsert(sqlSession, spNo);
    }

    //스페이스 유형별 카테고리 조회
    @Override
    public ArrayList<SpaceCategory> selectCategoryList(String categoryName) {
        return spaceDao.selectCategoryList(sqlSession, categoryName);
    }
	@Override
	public int reviewCount(int spaceNo) {
		return spaceDao.reviewCount(sqlSession, spaceNo);
	}
	@Override
	public ArrayList<SpaceReview> reviewGets(int spaceNo, PageInfo pi) {
		return spaceDao.reviewGets(sqlSession, spaceNo, pi);
	}

	public ArrayList<SpaceAttachment> selectAttachmentList(int sno) {
		return spaceDao.selectAttachmentList(sqlSession, sno);
	}
	@Override
	public ArrayList<SpaceFacility> selectFacilityList(int sno) {
		return spaceDao.selectFacilityList(sqlSession, sno);
	}
	@Override
	public ArrayList<SpaceFacility> spaceFacilityList(int spType) {
		return spaceDao.spaceFacilityList(sqlSession, spType);
	}
	@Override
	public Space selectSpace() {
		return spaceDao.selectSpace(sqlSession);
	}
	@Override
	public ArrayList<SpaceFacility> selectFacilityList(String categoryName) {
		return spaceDao.selectFacilityList(sqlSession,categoryName);
	}
	@Override
	public int wishCount(int spaceNo) {
		return spaceDao.wishCount(sqlSession ,spaceNo);
	}

    //호스트 공간 조회
    @Override
    public ArrayList<Space> hostSpaceList(int memberNo, PageInfo pi) {
        return spaceDao.hostSpaceList(sqlSession, memberNo, pi);
    }
    //호스트 공간 조회 개수
    @Override
    public int selectHostListCount(int memberNo) {
        return spaceDao.selectHostListCount(sqlSession, memberNo);
    }
    //호스트 공간 수정 폼
    @Override
    public Space spaceUpdateForm(int sno) {
        return spaceDao.spaceUpdateForm(sqlSession, sno);
    }
    //호스트 공간 수정
    @Override
    public int spaceUpdate(Space space) {
        return spaceDao.spaceUpdate(sqlSession, space);
    }
    //호스트 공간 첨부파일 수정
    @Override
    public int spaceAttacmentUpdate(SpaceAttachment sa) {
        return spaceDao.spaceAttacmentUpdate(sqlSession, sa);
    }
	@Override
	public int searchListCount(Map<String, Object> body) {
		return spaceDao.searchListCount(sqlSession, body);
	}
	@Override
	public ArrayList<Space> searchSpaceList(PageInfo pi, Map<String, Object> body) {
		return spaceDao.searchSpaceList(sqlSession, pi, body);
	}
	
}
