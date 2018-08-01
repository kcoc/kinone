package com.project.kinone.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kinone.model.Club;
import com.project.kinone.model.Match;

@Repository
public class AdminDAOImpl implements AdminDAOInter {

	@Autowired
	private SqlSessionTemplate session;

//////////////////////////////////////////////한 동 준 /////////////////////////////////////////////////////////

	// 등록된 모든 리그 리스트 가져옴
	public List<String> getAllLeague() {
		return session.selectList("adminmapper.allLeague");
	}

	// 가장 높은 리그
	public String getTopLeague() {
		return session.selectOne("adminmapper.topLeague");
	}

	// 등록된 모든 시즌 리스트 가져옴
	public List<String> getAllSeason() {
		return session.selectList("adminmapper.allSeason");
	}

	// 가장 최근의 시즌
	public String getTopSeason() {
		return session.selectOne("adminmapper.topSeason");
	}

	// 넘겨진 구단 코드 리스트를 등록된 구단 목록에서 검색하여 그 갯수 가져옴
	public int checkClub(List<String> list) {
		return session.selectOne("adminmapper.checkClub", list);
	}

	// 다수의 매치 리스트를 db에 입력(match, match_detail 두 테이블 모두에)
	public int insertMatch(List<Match> matchList) {
		// System.out.println("입력하는 매치일정 갯수 : " + matchList.size());
		int result = session.insert("adminmapper.insertMatch", matchList) / 2;
		return result;
	}

	// 모든 매치 리스트
	public List<Match> allMatchList() {
		return session.selectList("adminmapper.allMatchList");
	}

	// 매치 검색(키워드는 HashMap에 저장)
	public List<Match> searchMatchList(HashMap<String, String> keyword) {
		return session.selectList("adminmapper.searchMatchList", keyword);

	}

	// 변경하는 mcode를 가진 매치가 있는지 확인 (모든 조건이 같을 경우 1, 날짜까지 같고 시간이 다를 경우 0, 없을 경우 -1)
	public int mcodeDuplCheck(HashMap params) {
		return session.selectOne("adminmapper.mcodeDuplCheck", params);
	}

	// 매치 날짜 변경 시에 원래 데이터 정보를 새롭게 만든 코드의 데이터로 저장
	public int changeMdate(HashMap map) {
		return session.update("adminmapper.changeMdate", map);
	}

	// 매치 정보를 삭제
	public int deleteMatch(String mcode) {
		return session.delete("adminmapper.deleteMatch", mcode);
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////김 동 환 /////////////////////////////////////////////////////////

	public List<Club> getClubList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("clubmapper.clubList");
	}

	public void insertClub(Club mngClub) throws Exception {
		// TODO Auto-generated method stub
		session.insert("adminmapper.mngInsertClub", mngClub);
	}

	public void insertStadium(Club mngClub) throws Exception {
		// TODO Auto-generated method stub

		session.insert("adminmapper.mngInsertStadium", mngClub);
	}

	public Club getClubCont(String cname) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("adminmapper.mngClubCont", cname);
	}

	public void deleteClub(String cname) throws Exception {
		// TODO Auto-generated method stub
		session.update("adminmapper.mngDeleteClub", cname);
	}

	public Club getClubDetail(String ccode) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("adminmapper.mngClubDetail", ccode);
	}

	public void updateClub(Club mngClub) throws Exception {
		// TODO Auto-generated method stub
		session.update("adminmapper.mngUpdateClub", mngClub);
	}

	public void updateStadium(Club mngClub) throws Exception {
		// TODO Auto-generated method stub
		session.update("adminmapper.mngUpdateStadium", mngClub);
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
