package com.project.kinone.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.kinone.model.Club;
import com.project.kinone.model.Club_season;
import com.project.kinone.model.Member;
import com.project.kinone.model.Player;
import com.project.kinone.service.AdminServiceImpl;
import com.project.kinone.service.ClubServiceImpl;
import com.project.kinone.service.MatchServiceImpl;
import com.project.kinone.service.MemberServiceImpl;
import com.project.kinone.service.PlayerServiceImpl;

@Controller
public class FrontController {

	@Autowired
	private ClubServiceImpl clubService;

	@Autowired
	private PlayerServiceImpl playerService;

	@Autowired
	private MatchServiceImpl matchService;

	@Autowired
	private AdminServiceImpl adminService;
	
	@Autowired
	private MemberServiceImpl memberService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model) {
		List<Club> clubList = clubService.getClubList();
		System.out.println(clubList.toString());
		String seasoncode = adminService.getTopSeason();

		List<Date> k1MatchDays = matchService.get7MatchDays("K1");
		System.out.println("K1 리그 매치 날짜 : " + k1MatchDays);
		HashMap<String, HashMap> k1MatchMapList = matchService.getAllMatchInDay(k1MatchDays, "K1");
		// System.out.println(matchListMap.toString());
		List<Date> k2MatchDays = matchService.get7MatchDays("K2");
		System.out.println("K2 리그 매치 날짜 : " + k2MatchDays);
		HashMap<String, HashMap> k2MatchMapList = matchService.getAllMatchInDay(k2MatchDays, "K2");

		// 리그 별 클럽 순위 리스트
		List<Club_season> k1ClubSeasonRankList = clubService.getClubSeasonRankList(seasoncode, "K1");
		List<Club_season> k2ClubSeasonRankList = clubService.getClubSeasonRankList(seasoncode, "K2");

		// 리그 별 선수 순위 리스트
		// 득점랭크
		List<Player> k1PlayerSeasonGRankList = playerService.getPlayerSeasonRankList(seasoncode, "K1", "g");
		List<Player> k2PlayerSeasonGRankList = playerService.getPlayerSeasonRankList(seasoncode, "K2", "g");
		// 도움랭크
		List<Player> k1PlayerSeasonARankList = playerService.getPlayerSeasonRankList(seasoncode, "K1", "a");
		List<Player> k2PlayerSeasonARankList = playerService.getPlayerSeasonRankList(seasoncode, "K2", "a");

		model.addAttribute("clubList", clubList);
		model.addAttribute("k1MatchDays", k1MatchDays);
		model.addAttribute("k1MatchMapList", k1MatchMapList);
		model.addAttribute("k2MatchDays", k2MatchDays);
		model.addAttribute("k2MatchMapList", k2MatchMapList);
		model.addAttribute("k1ClubSeasonRankList", k1ClubSeasonRankList);
		model.addAttribute("k2ClubSeasonRankList", k2ClubSeasonRankList);
		model.addAttribute("k1PlayerSeasonGRankList", k1PlayerSeasonGRankList);
		model.addAttribute("k2PlayerSeasonGRankList", k2PlayerSeasonGRankList);
		model.addAttribute("k1PlayerSeasonARankList", k1PlayerSeasonARankList);
		model.addAttribute("k2PlayerSeasonARankList", k2PlayerSeasonARankList);

		return "main";
	}

	// 로그인 페이지로 이동
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Model model) {

		// 이부분은 일단 고정해놓으세요 -------------------------------------------
		List<Date> k1MatchDays = matchService.get7MatchDays("K1");
		System.out.println("K1 리그 매치 날짜 : " + k1MatchDays);
		HashMap<String, HashMap> k1MatchMapList = matchService.getAllMatchInDay(k1MatchDays, "K1");
		List<Date> k2MatchDays = matchService.get7MatchDays("K2");
		System.out.println("K2 리그 매치 날짜 : " + k2MatchDays);
		HashMap<String, HashMap> k2MatchMapList = matchService.getAllMatchInDay(k2MatchDays, "K2");
		model.addAttribute("k1MatchDays", k1MatchDays);
		model.addAttribute("k1MatchMapList", k1MatchMapList);
		model.addAttribute("k2MatchDays", k2MatchDays);
		model.addAttribute("k2MatchMapList", k2MatchMapList);
		// 이부분은 일단 고정해놓으세요 -------------------------------------------

		return "login";
	}

	/////////////////// 김동환////////////////////

	// 회원 가입 폼으로 이동
	@RequestMapping(value = "/join_form.do")
	public String joinForm() {

		System.out.println("회원 가입");

		return "join";
	}

	// 회원 가입 처리
	@RequestMapping(value = "/join_ok.do", method = RequestMethod.POST)
	public String join(Member member) {

		System.out.println("회원 가입 DB에 등록");

		int result = memberService.insertJoin(member);
		if(result == 1 )
			System.out.println("DB에 등록 성공");
		return "redirect:/admin/club_view.do";

	}

	////////////////////////////////////////////
}
