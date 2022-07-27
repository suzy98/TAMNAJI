package com.kh.tamnaji.space.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tamnaji.common.model.vo.PageInfo;
import com.kh.tamnaji.room.model.vo.RoomVO;
import com.kh.tamnaji.space.model.vo.FacilitySpace;
import com.kh.tamnaji.space.model.vo.Space;
import com.kh.tamnaji.space.model.vo.SpaceAttachment;
import com.kh.tamnaji.space.model.vo.SpaceCategory;
import com.kh.tamnaji.space.model.vo.SpaceFacility;
import com.kh.tamnaji.space.model.vo.SpaceReview;

@Repository
public class SpaceDao {

	public ArrayList<Space> selectMbtiList(SqlSessionTemplate sqlSession, String mbti) {
		ArrayList<Space> list = (ArrayList)sqlSession.selectList("spaceMapper.selectMbtiList", mbti);
		// System.out.println("spaceDao list: " + list);
		// System.out.println("spaceDao mbti: " + mbti);
		return list;
	}

    //카테고리 조회
    public ArrayList<SpaceCategory> adminCategory(SqlSessionTemplate sqlSession, SpaceCategory sc) {
        return (ArrayList) sqlSession.selectList("spaceMapper.adminCategory", sc);
    }
    
    //카테고리 생성
    public int adminCategoryCreate(SqlSessionTemplate sqlSession, SpaceCategory sc) {
        return sqlSession.insert("spaceMapper.adminCategoryCreate", sc);
    }

    //카테고리 삭제
    public int adminCategoryDelete(SqlSessionTemplate sqlSession, int spType) {
        return sqlSession.delete("spaceMapper.adminCategoryDelete", spType);
    }

    //카테고리 수정
    public int adminCategoryUpdate(SqlSessionTemplate sqlSession, SpaceCategory sc) {
        return sqlSession.update("spaceMapper.adminCategoryUpdate", sc);
    }

    //편의시설 조회
    public ArrayList<SpaceFacility> adminFacility(SqlSessionTemplate sqlSession, SpaceFacility sf) {
        return (ArrayList)sqlSession.selectList("spaceMapper.adminFacility", sf);
    }

    //편의시설 생성
    public int adminFacilityCreate(SqlSessionTemplate sqlSession, SpaceFacility sf) {
        return sqlSession.insert("spaceMapper.adminFacilityCreate", sf);
    }

    //편의시설 삭제
    public int adminFacilityDelete(SqlSessionTemplate sqlSession, int sfNo) {
        return sqlSession.delete("spaceMapper.adminFacilityDelete", sfNo);
    }

    //편의시설 수정
    public int adminFacilityUpdate(SqlSessionTemplate sqlSession, SpaceFacility sf) {
        return sqlSession.update("spaceMapper.adminFacilityUpdate", sf);
    }

    //스페이스 관리 조회
    public ArrayList<Space> adminSpaceSelect(SqlSessionTemplate sqlSession, PageInfo pi) {
        int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);
        return (ArrayList)sqlSession.selectList("spaceMapper.adminSpaceSelect", pi, rowBounds);
    }

    //스페이스 총 갯수
    public int selectListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("spaceMapper.selectListCount");
    }

    //스페이스 관리자 검색
    public ArrayList<Space> adminSpaceSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
        return (ArrayList) sqlSession.selectList("spaceMapper.adminSpaceSearch", map);
    }

    //스페이스 전체 조회
    public ArrayList<Space> selectSpaceList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
        int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);
        return (ArrayList) sqlSession.selectList("spaceMapper.selectSpaceList", map, rowBounds);
    }

    public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
        return sqlSession.selectOne("spaceMapper.selectCount",map);
    }

    //스페이스 카테고리 조회
    public ArrayList<SpaceCategory> adminCategory(SqlSessionTemplate sqlSession) {
        return (ArrayList)sqlSession.selectList("spaceMapper.adminCategory");
    }

    //스페이스 카테고리 편의시설 조회
    public ArrayList<SpaceFacility> adminFacility(SqlSessionTemplate sqlSession, int category) {
        return (ArrayList)sqlSession.selectList("spaceMapper.spaceFacility", category);
    }

    //스페이스 등록
    public int spaceInsert(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
        return sqlSession.insert("spaceMapper.spaceInsert", map);
    }

    // 공간 조회수 증가 (update)
	public int increaseCount(SqlSessionTemplate sqlSession, int sno) {
		
		return sqlSession.update("spaceMapper.increaseCount", sno);
	}

	public ArrayList<SpaceAttachment> selectAttachmentList(SqlSessionTemplate sqlSession, int spaceNo) {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectAttachmentList", spaceNo);
	}
  
  // selectFacilityList 파라미터 int !!!!!!!!!!!!!!!!
	public ArrayList<SpaceFacility> selectFacilityList(SqlSessionTemplate sqlSession, int spaceNo) {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectFacilityList2", spaceNo);
	}
	// 공간 카테고리 조회 (select)
	public ArrayList<SpaceCategory> selectCategory(SqlSessionTemplate sqlSession, SpaceCategory sc) {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectRoom", sc);
	}
	// 공간 첨부파일 조회 (select)
	public ArrayList<SpaceAttachment> selectAttachment(SqlSessionTemplate sqlSession, int sno) {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectAttachment", sno);
	}

	public int wishListDelete(SqlSessionTemplate sqlSession,Map<String, Integer> data) {
		return sqlSession.delete("spaceMapper.wishListDelete", data);
	}
    
    // 예약하기 버튼 클릭 시 띄워줄 스페이스 정보 조회
	public Space spaceGet(SqlSessionTemplate sqlSession, Map<String, String> body) {
		System.out.println("body : " + body);
		return sqlSession.selectOne("spaceMapper.spaceGet", body);
	}

	public int wishListGet(SqlSessionTemplate sqlSession, Map<String, Integer> data) {
		return sqlSession.selectOne("spaceMapper.wishListGet", data);
	}

	public int wishListCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("spaceMapper.wishListCount", memberNo);
	}
	
	public ArrayList<Space> wishListGets(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("spaceMapper.wishListGets", memberNo, rowBounds);

	}

    //스페이스 첨부파일 등록
    public int spaceAttachmentInsert(SqlSessionTemplate sqlSession, SpaceAttachment sa) {
        return sqlSession.insert("spaceMapper.spaceAttachmentInsert", sa);
    }

    //스페이스 편의시설 등록
    public int spaceFacilityInsert(SqlSessionTemplate sqlSession, Integer spNo) {
        return sqlSession.insert("spaceMapper.spaceFacilityInsert", spNo);
    }

    //스페이스 유형별 카테고리 조회
    public ArrayList<SpaceCategory> selectCategoryList(SqlSessionTemplate sqlSession, String categoryName) {
        return (ArrayList)sqlSession.selectList("spaceMapper.selectCategoryList", categoryName);
    }

	public int wishListPost(SqlSessionTemplate sqlSession, Map<String, Integer> data) {
		return sqlSession.insert("spaceMapper.wishListPost", data);
	}

	public int reviewCount(SqlSessionTemplate sqlSession, int spaceNo) {
		return sqlSession.selectOne("spaceMapper.reviewCount", spaceNo);
	}

	public ArrayList<SpaceReview> reviewGets(SqlSessionTemplate sqlSession, int spaceNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("spaceMapper.reviewGets", spaceNo, rowBounds);
	}



    public ArrayList<SpaceFacility> spaceFacilityList(SqlSessionTemplate sqlSession, int spType) {
        return (ArrayList) sqlSession.selectList("spaceMapper.spaceFacilityList", spType);
    }

    public Space selectSpace(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("spaceMapper.selectSpaceOne");
    }
  
  
  // 공간 상세 조회 (select)
	public Space selectSpace(SqlSessionTemplate sqlSession, int spaceNo) {
		
		return sqlSession.selectOne("spaceMapper.selectSpace", spaceNo);
	}



    public ArrayList<SpaceFacility> selectFacilityList(SqlSessionTemplate sqlSession, String categoryName) {
        return (ArrayList) sqlSession.selectList("spaceMapper.selectFacilityList", categoryName);
    }

    //호스트 공간 조회
    public ArrayList<Space> hostSpaceList(SqlSessionTemplate sqlSession, int memberNo, PageInfo pi) {
        int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);
        return (ArrayList)sqlSession.selectList("spaceMapper.hostSpaceList",memberNo, rowBounds);
    }
    //호스트 공간 조회 개수
    public int selectHostListCount(SqlSessionTemplate sqlSession, int memberNo) {
        return sqlSession.selectOne("spaceMapper.selectHostListCount", memberNo);
    }

	public int wishCount(SqlSessionTemplate sqlSession, int spaceNo) {
		if(sqlSession.selectOne("spaceMapper.wishCount", spaceNo) != null) {
			return sqlSession.selectOne("spaceMapper.wishCount", spaceNo);
		} else {
			return 0;			
		}
	}
    //호스트 공간 수정 폼
    public Space spaceUpdateForm(SqlSessionTemplate sqlSession, int sno) {
        return sqlSession.selectOne("spaceMapper.spaceUpdateForm", sno);
    }
    //호스트 공간 수정
    public int spaceUpdate(SqlSessionTemplate sqlSession, Space space) {
        return sqlSession.update("spaceMapper.spaceUpdate", space);
    }
    //호스트 공간 첨부파일 수정
    public int spaceAttacmentUpdate(SqlSessionTemplate sqlSession, SpaceAttachment sa) {
        return sqlSession.update("spaceMapper.spaceAttacmentUpdate", sa);
    }
    //호스트 공간 편의시설 수정
    public int spaceFacilityUpdate(SqlSessionTemplate sqlSession, FacilitySpace fs) {
        return sqlSession.insert("spaceMapper.spaceFacilityUpdate", fs);
    }
    public int spaceFacilityDelete(SqlSessionTemplate sqlSession, Space space) {
        return sqlSession.delete("spaceMapper.spaceFacilityDelete", space);
    }

	public int searchListCount(SqlSessionTemplate sqlSession, Map<String, Object> body) {
		return sqlSession.selectOne("spaceMapper.searchListCount", body);
	}
	public ArrayList<Space> searchSpaceList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, Object> body) {
		int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);
        return (ArrayList)sqlSession.selectList("spaceMapper.searchSpaceList", body, rowBounds);
	}
}
