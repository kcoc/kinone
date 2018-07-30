package com.project.kinone.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.kinone.dao.AdminDAOImpl;
import com.project.kinone.dao.MatchDAOImpl;
import com.project.kinone.model.Match;
import com.project.kinone.util.McodeMaker;
import com.project.kinone.util.StringToTimestamp;


@Service
public class AdminServiceImpl {

	@Autowired
	private AdminDAOImpl adminDao;

	@Autowired
	private MatchDAOImpl matchDao;
	
	// 등록된 모든 리그
	public List<String> getAllLeague() {
		return adminDao.getAllLeague();
	}
	
	// 가장 높은 리그
	public String getTopLeague() {
		return adminDao.getTopLeague();
	}
	
	// 등록된 모든 시즌
	public List<String> getAllSeason() {
		return adminDao.getAllSeason();
	}
	
	// 가장 최근 시즌
	public String getTopSeason() {
		return adminDao.getTopSeason();
	}
	
	// 매치 등록 폼 페이지에서 입력한 구단을 체크하는 메소드
	public boolean checkClub(List<String> data) {
		// 넘긴 모든 데이터가 들어있는 list의 크기
		int size = data.size();
		
		// 들어온 데이터의 값을 중복 값을 제거한 뒤에 넣을 resultList에 저장
		List<String> resultList = new ArrayList<String>();
        for (int i = 0; i < size; i++) {
            if (!resultList.contains(data.get(i))) {
                resultList.add(data.get(i));
            }
        }
        
        // 중복값이 없는 클럽을 db에서 검색해 본 뒤 그 값과 검색한 list의 크기와 같으면 true, 그렇지 않으면 false를 리턴
        int result = adminDao.checkClub(resultList);
        int listsize = resultList.size();
        System.out.println("원래 list size:"+size+" / 중복제거된 list size:"+listsize+" / 찾아온 결과값:"+result);
        
        if(listsize == result) {
        	return true;
        }else {
        	return false;
        }
    }
	
	// 어드민 페이지에서 매치 정보를 입력
	public int insertMatch(HashMap<String, String> params) {
		
		// 폼에서 넘긴 값을 받아 배열로 나눔
		String lcode = params.get("lcode");
		String mdatelist = params.get("mdatelist");
		String mroundlist = params.get("mroundlist");
		String homelist = params.get("homelist");
		String awaylist = params.get("awaylist");
		
		String[] mdatearr = mdatelist.trim().split("\n");
		String[] mroundarr = mroundlist.trim().split("\n");
		String[] homearr = homelist.trim().split("\n");
		String[] awayarr = awaylist.trim().split("\n");
		
		// 배열에서 하나씩 빼면서 매치 객체로 바꿔 리스트에 저장
		List<Match> matchList = new ArrayList<Match>();
		for(int i=0; i<mdatearr.length; i++) {
			Match match = new Match();
			
			String time = mdatearr[i].trim();
		//	System.out.println("time : "+time);
			
			String mcode = McodeMaker.convert(lcode, homearr[i], awayarr[i], time);
			
			match.setLcode(lcode.trim());
			match.setMcode(mcode.trim());
			
			Timestamp mdate = StringToTimestamp.convert(time);
		//	System.out.println("mdate : "+mdate);
			
			match.setMdate(mdate);
			match.setMround(mroundarr[i].trim());
			match.setCcode_home(homearr[i].trim());
			match.setCcode_away(awayarr[i].trim());
			
		//	System.out.println(match.toString());
			
			matchList.add(match);
		}		
		return adminDao.insertMatch(matchList);
	}
	
	// 등록된 매치 리스트 가져오는 메소드
	public List<Match> getMatchList(HashMap<String, String> params) {
		// 검색을 한 리스트인지 아닌 가에 따라 불러올 리스트 구분
		List<String> keylist = new ArrayList<String>(params.keySet());
		System.out.println("검색어 몇개야? "+ keylist.size());
		
		List<Match> matchList = new ArrayList<Match>();
		if(keylist.size() < 1) {
			System.out.println("초기 리스트!");
			matchList = adminDao.allMatchList();
		}else {
			System.out.println("검색 리스트!");
			matchList = adminDao.searchMatchList(params);
		}
		return matchList;
	}

	// 매치 날짜 변경 시 변경될 날짜로 인해 변경되는 mcode를 가진 데이터가 있는지 확인하는 메소드
	public int mcodeDuplCheck(HashMap<String, String> params) {
		String mcode = params.get("mcode");
		String cdate = params.get("cdate");
		System.out.println("mcode:"+mcode); // 변경하고자 하는 매치 코드
		System.out.println("cdate:"+cdate); // 변경 될 날짜
		String cmcode = McodeMaker.convert(mcode, cdate);
		System.out.println("변경되는 mcode:"+ cmcode);
		
		params.put("mcode", cmcode);
		List<Match> matchList = adminDao.searchMatchList(params);
		int count = matchList.size();
		return count;
	}
	
	// 등록된 매치 리스트 페이지에서 매치 날짜를 변경하는 메소드
	public int changeMdate(String mcode, String cdate) {
		HashMap map = new HashMap();
		
		String cmcode = McodeMaker.convert(mcode, cdate);
		System.out.println("변경되는 mcode:"+ cmcode);
		
		Timestamp mdate = StringToTimestamp.convert(cdate);
		map.put("mcode", mcode);
		map.put("mdate", mdate);
		map.put("cmcode", cmcode);
		
		return adminDao.changeMdate(map);
	}

	

	

	
	
}
