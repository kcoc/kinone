<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="url" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>K in One</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
	integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
body {
	font-family: "Nanum Gothic";
}

a, a:hover {
	text-decoration: none;
}

.wrapper {
	box-sizing: border-box;
	height: auto;
}

.scroll {
	position: absolute !important;
	top: 0;
	z-index: 9999;
	left: 0;
}

.scroll>a.gotop {
	position: fixed;
	bottom: 20px;
	right: 20px;
	color: orange;
}

.tab-content, .rank-detail {
	overflow: hidden;
}

.wrap_page {
	width: 60%;
}

.page_header {
	/* border: 1px solid yellow; */
	background-color: #131339;
}

.navbar-dark .navbar-nav .nav-link {
	color: white;
}

.wrap_content {
	/* border: 1px solid blue; */
	width: 100%;
	height: auto;
	padding: 5px;
	margin-top: 5px;
	margin-bottom: 5px;
	float: left;
	box-sizing: border-box;
}

.match-slide {
	/* border: 1px solid red; */
	margin-top: 48px;
	width: 100%;
	height: auto;
	box-sizing: border-box;
	padding-top: 50px;
	padding-bottom: 50px;
	background-image: url('/kinone/resources/images/main.jpg');
}

.match-slide>.container {
	max-width: 60%;
	position: relative;
}

a#totalmatch {
	color: white;
	font-weight: bold;
	position: absolute;
    top: 10px;
    left: 15px;
}

.match-slide-content {
	background-color: white;
	width: 100%;
	clear: both;
}

.match-slide-tabs {
	float: right;
}

.match-slide-tabs>li {
	border-radius: 4px;
	background-color: #131339;
	/* opacity: 0.3; */
}

.match-slide-tabs>li>a {
	background: lightgray;
	color: gray;
}
/* active tab color */
.match-slide-tabs>li.active>a, .match-slide-tabs>li.active>a:hover,
	.match-slide-tabs>li.active>a:focus {
	color: black;
	background-color: #666;
	border: 1px solid #888888;
}
/* hover tab color */
.match-slide-tabs>li>a:hover {
	background-color: #f1f1f1;
}

.wrap_content>.wrap_remain {
	width: 100%;
	margin-top: 10px;
	/* border: 1px solid yellow; */
	box-sizing: border-box;
	float: left;
}

.wrap_content>.wrap_remain>div {
	margin: 5px;
}

.wrap_remain>.remain_left {
	width: 30%;
	height: auto;
	/* border: 1px solid black; */
	float: left;
	box-sizing: border-box;
}

.wrap_remain>.remain_left>.left-top {
	height: 50px;
	width: 100%;
	background-color: #131339;
	color: white;
	font-size: 16pt;
	display: table;
}

.left-top>span {
	display: table-cell;
	vertical-align: middle;
}

.nav-rank {
	border-left: 1px solid #888888;
	border-right: 1px solid #888888;
}

.nav-rank .nav-link {
	border-radius: 0;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link
    .nav-rank>li.active>a {
	background-color: white;
	color: black;
}

.nav-rank>li>a {
	background: lightgray;
	color: gray;
}

.nav-rank>li>a:hover {
	background: #f1f1f1;
}

.rank-table {
	font-size: 10pt;
	width: 100%;
	border: 1px solid #888888;
	/* max-width: 100%; */
}

.rank-table th, .rank-table td {
	vertical-align: middle;
	text-align: center;
}

.rank-table td>img {
	height: 31px;
}

.right-menu {
	padding: 10px;
}

.wrap_content>.wrap_remain>.remain_right {
	width: 65%;
	height: auto;
	/* border: 1px solid black; */
	float: left;
	display: block;
	box-sizing: border-box;
}

.remain_right>.recent-news {
	/* border: 1px solid black; */
	width: 100%;
	height: auto;
	box-sizing: border-box;
}

.news-top {
	display: table;
	width: 100%;
}

.top>a {
	float: right;
	color: gray;
	font-size: 9pt;
	display: table-cell;
	margin-top: 5px;
}

.recent-news>.news-content {
	width: 100%;
	margin-top: 20px;
	box-sizing: border-box;
	line-height: 80px;
	max-height: 430px;
}

.news-content>.news {
	/* border: 1px solid red; */
	width: 50%;
	height: 200px;
	margin: 0 -5px 0 -5px;
	display: inline-block;
	box-sizing: border-box;
}

.news-content>.news>.news-image {
	/* border: 1px solid blue; */
	width: 95%;
	height: 75%;
	display: block;
	overflow: hidden;
}

.news-image>a>img {
	width: 100%;
	height: 100%;
	transition: all 0.3s ease-in-out;
}

.news-image>a>img:hover {
	transform: scale(1.1);
}

.recent-news .news-title {
	/* border: 1px solid green; */
	font-size: 12pt;
	width: 88%;
	height: 20%;
	margin-top: 10px;
	margin-bottom: 5px;
	box-sizing: border-box;
	/* 여기서부터 타이틀 텍스트 속성 */
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	word-break: break-all;
	line-height: normal;
}

.news-title>a {
	color: #3e3e3e;
}

.remain_right>.team-emblem {
	/* border: 1px solid black; */
	height: 20%;
	box-sizing: border-box;
}

.team-emblem>.emblem {
	width: 100%;
	box-sizing: border-box;
}

.team-emblem>.emblem>a>img {
	box-sizing: border-box;
	/* border: 1px solid black; */
	width: 10%;
	margin: 0 -6px 5px -6px;
	padding: 2px;
	display: inline-block;
}

.remain_right>.player-rank {
	/* border: 1px solid black; */
	height: auto;
	box-sizing: border-box;
}

.player-rank>.rank_wrap {
	/* border: 1px solid yellow; */
	min-height: 380px;
}

.player-rank>.rank_wrap>.rank-top {
	/* border: 1px solid red; */
	
}

.player-rank>.rank_wrap>hr {
	margin-bottom: 0;
	border-top: 3px solid rgba(0, 0, 0, .1);
}

.player-rank>.rank_wrap>.rank-content {
	border: 1px solid lightgray;
	width: 100%;
	height: auto;
	box-sizing: border-box;
}

.rank-content>.goal-rank, .rank-content>.assist-rank {
	width: 50%;
	height: auto;
	float: left;
	/* border: 1px solid blue; */
}

.goal-rank>ul, .assist-rank>ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.rank-list>.rank-subject {
	/* border: 1px solid orange; */
	border: 1px solid lightgray;
	font-size: 10pt;
	font-weight: bold;
	background: #f1f1f1;
	width: 100%;
	height: 35px;
	line-height: 35px;
}

.rank-list>.rank-detail {
	/* border: 1px solid red; */
	height: 140px;
	box-sizing: border-box;
	padding-top: 10px;
	padding-bottom: 10px;
	border: 1px solid lightgray;
}

.rank-list>.rank-detail>div {
	/* border: 1px solid orange; */
	height: 100%;
	float: left;
}

.rank-list>.rank-detail>.rank {
	width: 15%;
}

.rank-list>.rank-detail>.pimage {
	width: 30%;
}

.rank-list>.rank-detail>.pimage>img {
	width: 100%;
	height: 100%;
	border: 1px solid #f1f1f1;
}

.rank-list>.rank-detail>.pinfo {
	width: 55%;
	padding: 10px;
}

.rank-detail>.pinfo>* {
	display: block;
}

.rank-detail>.pinfo>.player>strong {
	font-size: 17pt;
}

.rank-detail>.pinfo>.player>span {
	font-size: 13pt;
}

.rank-detail>.pinfo>.club {
	font-size: 10pt;
}

.rank-detail>.pinfo>.stats {
	color: red;
	font-weight: bold;
	font-size: 25pt;
	height: 52pt;
	padding-top: 10px;
}

.wrap_footer {
	/* border: 1px solid green; */
	box-sizing: border-box;
	clear: both;
}

.logo-wrapper {
	float: left;
}

.nav-menu, .nav-logo {
	float: left;
}

.nav-menu>li {
	margin-left: 1.5em;
	margin-right: 1.5em;
}

.subject {
	font-weight: bold;
	font-size: 14pt;
	color: black;
}

.navbar-custom {
	background-color: #131339;
}

.nav-wrapper {
	width: 100%;
}

.nav-container {
	width: 60%;
}

.member-text {
	font-size: 0.8em;
}

.nav-rank {
	width: 100%;
}

.wrap_footer {
	min-height: 200px;
	background: #131339;
}

.more {
	text-decoration: none;
	color: #3e3e3e;
}

.more:hover {
	text-decoration: none;
	color: #99ff66;
}

.match-container {
	/* border: 1px solid red; */
	width: auto;
	box-sizing: border-box;
}

.match-date, .match-date>.each-date {
	border-style: solid;
	border-color: lightgray;
	box-sizing: border-box;
}

.match-date {
	border-width: 1px 0 0 1px;
}

.match-date>.each-date {
	border-width: 0 1px 1px 0;
	overflow: hidden;
	width: calc(100%/ 7);
}

.each-date>a {
	font-size: 10pt;
	font-weight: bold;
	color: black;
}

.each-date>a.active {
	background-color: #3399ff;
	color: white;
}

.match-detail {
	height: 200px;
	background-color: #fff2f2;
}

.each-match {
	/* border: 1px solid blue; */
	padding: 20px 0 20px 0;
	font-size: 0px;
	width: 100%;
	height: 100%;
}

.each-match>div {
	display: inline-block;
}

.match-arrow {
	width: 5%;
	height: 100%;
	position: relative;
	bottom: 70px;
	font-size: 20pt;
}

.match-arrow> a {
	color: black;
}

.match-arrow > span {
	color: lightgray;
	
}

.match {
	width: calc(90%/ 3);
	padding: 0 20px 0 20px;
	height: 100%;
}

.match-center {
	border-right: 1px solid lightgray;
	border-left: 1px solid lightgray;
}

.match-table {
	width: 100%;
	height: 100%;
	/* border-collapse: collapse; */
	font-size: 10pt;
	table-layout: fixed;
}

.match-table>* {
	vertical-align: middle;
	text-align: center;
}

.match-top {
	/* height: 80%; */
	
}

.match-team>img {
	width: 90px;
	height: 90px;
}

.match-score {
	font-size: 25pt;
	font-weight: bold;
	vertical-align: bottom;
	width: 30%;
}

.match-score>span {
	color: lightgray;
}

.match-status {
	height: 30%;
	font-size: 8pt;
}

.status, .lineup, .resmatch {
	border: 1px solid lightgray;
	padding: 5px 10px 5px 10px;
}

.status, .status:hover {
	border-radius: 40%;
	background-color: #efefef;
	cursor: default;
	color: black;
}

.match-bottom {
	height: 20%;
}

.lineup, .lineup:hover, .resmatch, .resmatch:hover {
	background-color: white;
	color: black;
}
</style>

<script>
	 /* function setMatch_detail(lcode){
		
		var selectedDay = $("#selected"+lcode+"Day").val();
	//	var selectedlcode = $("#selectedlcode").val();
		var currentPage = $("#"+lcode+"CurrentPage").val();
		alert("day : "+selectedDay+" lcode : "+lcode+" currentPage : "+currentPage);
		
		$.ajax({
			dataType: "json",
			url: "/kinone/match/matchInDay.do?day="+selectedDay+"&lcode="+lcode+"&currentPage="+currentPage,
			type: "get",
			success: function(data){
				
				var matchArr = data;
				var matchDay = (matchArr[0].mdate).substring(0,10);
			//	alert(matchDay);
			
				for(var idx in matchArr){
					var matchObj = matchArr[idx];
					
					var divId = lcode + matchDay + ;
					alert(divId);
				}
				
			//	alert(parseInt(currentPage)+1); -> 이거는 화살표 눌렀을 때 계산해줘야한다.
			}
		});
	} */
	
	$(document).ready(function(){
	//	setMatch_detail('K1');
	//	setMatch_detail('K2');
	});	
</script>
</head>
<body>
	<div class="wrapper" align="center">
		<div class="scroll">
			<a class="gotop" href="#"> <i
				class="fa fa-arrow-alt-circle-up fa-2x"></i>
			</a>
		</div>
		<!-- 네비게이션바 메뉴 -->
		<div class="page_header">
			<nav
				class="navbar navbar-expand-sm navbar-dark navbar-custom fixed-top"
				id="navbar">
				<div class="nav-wrapper" align="center">
					<div class="nav-container">
						<a class="navbar-brand nav-logo" href="#">K In One</a>
						<ul class="navbar-nav nav-menu">
							<li class="nav-item"><a class="nav-link" href="#">경기일정/결과</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#">클럽정보</a></li>
							<li class="nav-item"><a class="nav-link" href="#">경기예매</a></li>
							<li class="nav-item"><a class="nav-link" href="#">리그순위</a></li>
						</ul>
						<div class="collapse navbar-collapse justify-content-end">
							<ul class="navbar-nav navbar-right">
								<li class="nav-item"><a class="nav-link member-text"
									href="#"><i class="fa fa-lock"></i> 로그인</a></li>
								<li class="nav-item"><a class="nav-link member-text"
									href="#">회원가입</a></li>
							</ul>
						</div>
					</div>
				</div>
			</nav>
		</div>
		<!-- 네비게이션바 메뉴 끝 -->

		<!-- 매치 일정 슬라이드 -->
		<div class="match-slide">
			<div class="container">
				<a id="totalmatch" href="#">전체 일정 보기 ></a>
				<ul class="nav nav-tabs match-slide-tabs">
					<li class="nav-item"><a
						class="nav-link active font-weight-bold" data-toggle="tab"
						href="#K1match">K리그 1 경기 일정</a></li>
					<li class="nav-item"><a class="nav-link font-weight-bold"
						data-toggle="tab" href="#K2match">K리그 2 경기 일정</a></li>
				</ul>
				<!-- 매치 일정정보 -->
				
				<div class="tab-content match-slide-content">
					<div id="K1match" class="tab-pane active">
						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡK리그1 일정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


						<div class="match-container" id="K1league" align="center">
							<!-- Nav tabs -->
							<ul class="nav match-date" role="tablist">
							<c:forEach var="matchday" items="${k1MatchDays}" varStatus="status">
								<li class="nav-item each-date">
								<a class="nav-link <c:if test="${status.count == 4}">active</c:if>"
									data-toggle="tab" href="#K1${matchday}"><fmt:formatDate value="${matchday}" pattern="M월  d일 (E)" /></a>
								</li>
							</c:forEach>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content match-detail" id="K1matchday">
								<c:forEach var="matchday" items="${k1MatchDays}" varStatus="s1">
									<fmt:formatDate var="key" value="${matchday}" pattern="yyyy-MM-dd"/>
									<c:set var="inDayMap" value="${k1MatchMapList[key]}" /> <!-- 이 맵의 key : currentPage, totalPage, start, end, list -->
									<c:set var="currentPage" value="${inDayMap['currentPage']}" />
									<c:set var="totalPage" value="${inDayMap['totalPage']}" />
									<c:set var="begin" value="${inDayMap['start']-1}" />
									<c:set var="end" value="${inDayMap['end']-1}" />
									
								<div id="K1${matchday}" class="tab-pane <c:if test="${s1.count == 4}">active</c:if> each-match">
									<div class="match-arrow">
										<c:choose>
										<c:when test="${currentPage != 1 and totalPage != 1}"><a href="">&lt;</a></c:when>
										<c:when test="${totalPage <= 1}"><span>&lt;</span></c:when>
										<c:otherwise><span>&lt;</span></c:otherwise>
										</c:choose>
									</div>
									<c:forEach var="amatch" items="${inDayMap['list']}" begin="${begin}" end="${end}" >
									<div class="match <c:if test="${s2.count == 2}">match-center</c:if>">
										<table class="match-table">
											<tr class="match-top">
												<td rowspan="2" class="match-team"><img src="${url}/resources/emblem/${amatch.ccode_home}.png" title="${amatch.cname_short_h}">
												</td>
												<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
												<td class="match-score">
												<c:if test="${amatch.mstatus == 0}"><span>vs</span></c:if><!-- 아직 하지 않은 경기 -->
												<c:if test="${amatch.mstatus == 1}">${amatch.homescore}:${amatch.awayscore}</c:if><!-- 끝난 경기 -->
												</td>
												<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
												<td rowspan="2" class="match-team"><img src="${url}/resources/emblem/${amatch.ccode_away}.png" title="${amatch.cname_short_a}">
												</td>
											</tr>
											<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
											<tr class="match-status">
												<td><a href="" class="status">
											<c:if test="${amatch.mstatus == 0}">${fn:substring(amatch.mdate,11,16)}</c:if><!-- 아직 하지 않은 경기 -->
											<c:if test="${amatch.mstatus == 1}">경기종료</c:if><!-- 끝난 경기 -->
												</a></td>
											</tr>
											<!-- ㅡㅡㅡㅡㅡㅡ경기 상태 끝ㅡㅡㅡㅡㅡㅡ -->
											<tr class="match-bottom">
												<td colspan="3"><a href="#" class="lineup">전력비교</a> <a href="#" class="resmatch">경기예매</a></td>
											</tr>
										</table>
									</div>
									</c:forEach>
									
									<c:if test="${fn:length(inDayMap['list']) < 3}">
										<c:set var="idx" value="${3- fn:length(inDayMap['list'])}"/>
										<c:if test="${idx == 1}">
											<div class="match">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
										</c:if>
										<c:if test="${idx == 2}">
											<div class="match match-center">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
											<div class="match">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
										</c:if>
									</c:if>
									
									<div class="match-arrow">
										<c:choose>
										<c:when test="${currentPage != totalPage and totalPage != 1}"><a href="">&gt;</a></c:when>
										<c:when test="${totalPage <= 1}"><span>&gt;</span></c:when>
										<c:otherwise><span>&gt;</span></c:otherwise>
										</c:choose>
									</div>
										
								</div>
								</c:forEach>
							</div>
						</div>
						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡK리그1 일정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					</div>
					<div id="K2match" class="tab-pane">
						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡK리그2 일정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

						<div class="match-container" id="K2league" align="center">
							<!-- Nav tabs -->
							<ul class="nav match-date" role="tablist">
							<c:forEach var="matchday" items="${k2MatchDays}" varStatus="status">
								<li class="nav-item each-date">
								<a class="nav-link <c:if test="${status.count == 4}">active</c:if>"
									data-toggle="tab" href="#K2${matchday}"><fmt:formatDate value="${matchday}" pattern="M월  d일 (E)" /></a>
								</li>
							</c:forEach>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content match-detail" id="K2matchday">
								<c:forEach var="matchday" items="${k2MatchDays}" varStatus="s1">
									<fmt:formatDate var="key" value="${matchday}" pattern="yyyy-MM-dd"/>
									<c:set var="inDayMap" value="${k2MatchMapList[key]}" /> <!-- 이 맵의 key : currentPage, totalPage, start, end, list -->
									<c:set var="currentPage" value="${inDayMap['currentPage']}" />
									<c:set var="totalPage" value="${inDayMap['totalPage']}" />
									<c:set var="start" value="${inDayMap['start']-1}" />
									<c:set var="end" value="${inDayMap['end']-1}" />
									
								<div id="K2${matchday}" class="tab-pane <c:if test="${s1.count == 4}">active</c:if> each-match">
									<div class="match-arrow">
										<c:choose>
										<c:when test="${currentPage != 1 and totalPage != 1}"><a href="">&lt;</a></c:when>
										<c:when test="${totalPage <= 1}"><span>&lt;</span></c:when>
										<c:otherwise><span>&lt;</span></c:otherwise>
										</c:choose>
									</div>
									
									<c:forEach var="amatch" items="${inDayMap['list']}" varStatus="s2">
									<div class="match <c:if test="${s2.count == 2}">match-center</c:if>">
										<table class="match-table">
											<tr class="match-top">
												<td rowspan="2" class="match-team"><img src="${url}/resources/emblem/${amatch.ccode_home}.png" title="${amatch.cname_short_h}">
												</td>
												<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
												<td class="match-score">
												<c:if test="${amatch.mstatus == 0}"><span>vs</span></c:if><!-- 아직 하지 않은 경기 -->
												<c:if test="${amatch.mstatus == 1}">${amatch.homescore}:${amatch.awayscore}</c:if><!-- 끝난 경기 -->
												</td>
												<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
												<td rowspan="2" class="match-team"><img src="${url}/resources/emblem/${amatch.ccode_away}.png" title="${amatch.cname_short_a}">
												</td>
											</tr>
											<!-- ㅡㅡㅡㅡㅡㅡ경기 상태ㅡㅡㅡㅡㅡㅡ -->
											<tr class="match-status">
												<td><a href="" class="status">
											<c:if test="${amatch.mstatus == 0}">${fn:substring(amatch.mdate,11,16)}</c:if><!-- 아직 하지 않은 경기 -->
											<c:if test="${amatch.mstatus == 1}">경기종료</c:if><!-- 끝난 경기 -->
												</a></td>
											</tr>
											<!-- ㅡㅡㅡㅡㅡㅡ경기 상태 끝ㅡㅡㅡㅡㅡㅡ -->
											<tr class="match-bottom">
												<td colspan="3"><a href="#" class="lineup">전력비교</a> <a href="#" class="resmatch">경기예매</a></td>
											</tr>
										</table>
									</div>
									</c:forEach>
									
									<c:if test="${fn:length(inDayMap['list']) < 3}">
										<c:set var="idx" value="${3- fn:length(inDayMap['list'])}"/>
										<c:if test="${idx == 1}">
											<div class="match">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
										</c:if>
										<c:if test="${idx == 2}">
											<div class="match match-center">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
											<div class="match">
												<table class="match-table">
													<tr>
														<td colspan="4" rowspan="4" style="color: lightgray;">
															<i class="fas fa-exclamation" style="font-size: 20pt;"></i><br/>
															<span style="font-size: 15pt;">경기가 없습니다.</span>
														</td>
													</tr>
												</table>
											</div>
										</c:if>
									</c:if>
									
									<div class="match-arrow">
										<c:choose>
										<c:when test="${currentPage != totalPage and totalPage != 1}"><a href="">&gt;</a></c:when>
										<c:when test="${totalPage <= 1}"><span>&gt;</span></c:when>
										<c:otherwise><span>&gt;</span></c:otherwise>
										</c:choose>
									</div>
										
								</div>
								</c:forEach>
							</div>
						</div>

						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡK리그2 일정ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					</div>
				</div>
			</div>
		</div>
		<!-- 매치 일정 슬라이드 끝 -->

		<!-- 페이지 내용 들어가는 부분 -->
		<div class="wrap_page">
			<div class="wrap_content" align="center">
				<div class="wrap_remain">
					<!-- 왼쪽 페이지 -->
					<div class="remain_left">
						<div class="left-top">
							<span>2018 K리그 순위</span>
						</div>
						<ul class="nav nav-pills nav-justified nav-rank">
							<li class="nav-item"><a
								class="nav-link active font-weight-bold" data-toggle="tab"
								href="#K1_rank">K리그 1</a></li>
							<li class="nav-item"><a class="nav-link font-weight-bold"
								data-toggle="tab" href="#K2_rank">K리그 2</a></li>
						</ul>
						<!-- 리그 순위 테이블 -->
						<div class="tab-content">
							<div id="K1_rank" class="tab-pane active">
								<table class="table rank-table">
									<thead>
										<tr>
											<th>순위</th>
											<th>클럽</th>
											<th>경기</th>
											<th>승점</th>
											<th>득점</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="k1clubseason" items="${k1ClubSeasonRankList}"
											varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><img src="${url}/resources/emblem/${k1clubseason.ccode}.png" title="${k1clubseason.cname_short}"/></td>
												<td>${k1clubseason.win + k1clubseason.draw + k1clubseason.lose}</td>
												<td>${k1clubseason.win * 3 + k1clubseason.draw}</td>
												<td>${k1clubseason.c_ggoal}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div id="K2_rank" class="tab-pane">
								<table class="table rank-table">
									<thead>
										<tr>
											<th>순위</th>
											<th>클럽</th>
											<th>경기</th>
											<th>승점</th>
											<th>득점</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="k2clubseason" items="${k2ClubSeasonRankList}"
											varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><img src="${url}/resources/emblem/${k2clubseason.ccode}.png" title="${k2clubseason.cname_short}"/></td>
												<td>${k2clubseason.win + k2clubseason.draw + k2clubseason.lose}</td>
												<td>${k2clubseason.win * 3 + k2clubseason.draw}</td>
												<td>${k2clubseason.c_ggoal}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 리그 순위 테이블 끝 -->
					</div>
					<!-- 왼쪽 페이지 끝 -->
					<!-- 오른쪽 페이지 -->
					<div class="remain_right">
						
						<!-- 뉴스 -->
						<div class="right-menu recent-news">
							<div class="top news-top" align="left">
								<span class="subject" id="news-subject">K리그 소식</span><a
									class="more" href="">더보기 &gt;</a>
							</div>
							<div class="news-content" align="center">
								<div class="news">
									<div class="news-image">
										<a href=""><img src="${url}/resources/news/samplenews.jpg" title="[전북] 전북, 국민연금공단과 MOU 체결"></a>
									</div>
									<div class="news-title" align="justify">
										<a href="" title="">[전북] 전북, 국민연금공단과 MOU 체결</a>
									</div>
								</div>
								<div class="news">
									<div class="news-image">
										<a href=""><img src="${url}/resources/news/samplenews.jpg" title="[부천] 분위기 반전 이룬 부천FC1995, 홈 승리 통해 상승세 이어간다"></a>
									</div>
									<div class="news-title" align="justify">
										<a href="" title="">[부천] 분위기 반전 이룬 부천FC1995, 홈 승리 통해 상승세
											이어간다</a>
									</div>
								</div>
								<div class="news">
									<div class="news-image">
										<a href=""><img src="${url}/resources/news/samplenews.jpg" title="ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"></a>
									</div>
									<div class="news-title" align="justify">
										<a href="" title="">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</a>
									</div>
								</div>
								<div class="news">
									<div class="news-image">
										<a href=""><img src="${url}/resources/news/samplenews.jpg" title="뉴스제목"></a>
									</div>
									<div class="news-title" align="justify">
										<a href="" title="">뉴스제목</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 뉴스 끝 -->
						<hr>
						<!-- 현 시즌 선수 기록 -->
						<div class="right-menu player-rank">
							<!-- 리그 1 -->
							<div class="rank_wrap">
								<div class="top rank-top" align="left">
									<span class="subject">2018 K리그 1 선수 기록</span><a class="more"
										href="">더보기 &gt;</a>
								</div>
								<hr>
								<div class="rank-content" align="center">
									<div class="goal-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 득점</div>
											</li>
											<c:forEach var="k1playerseason"
												items="${k1PlayerSeasonGRankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${status.count}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k1playerseason.position}${k1playerseason.pname}.png"
															title="${k1playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k1playerseason.pname}</strong><span>(${k1playerseason.position})</span>
														</div>
														<span class="club">${k1playerseason.cname_short}</span>
														<div class="stats">${k1playerseason.p_ggoal}<img
																src="${url}/resources/images/goals.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="assist-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 도움</div>
											</li>
											<c:forEach var="k1playerseason"
												items="${k1PlayerSeasonARankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${status.count}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k1playerseason.position}${k1playerseason.pname}.png"
															title="${k1playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k1playerseason.pname}</strong><span>(${k1playerseason.position})</span>
														</div>
														<span class="club">${k1playerseason.cname_short}</span>
														<div class="stats">${k1playerseason.p_assist}<img
																src="${url}/resources/images/assist.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<!-- 리그 1 끝 -->
							<!-- 리그 2 -->
							<div class="rank_wrap">
								<div class="top rank-top" align="left">
									<span class="subject">2018 K리그 2 선수 기록</span><a class="more"
										href="">더보기 &gt;</a>
								</div>
								<hr>
								<div class="rank-content" align="center">
									<div class="goal-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 득점</div>
											</li>
											<c:forEach var="k2playerseason"
												items="${k2PlayerSeasonGRankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${status.count}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k2playerseason.position}${k2playerseason.pname}.png"
															title="${k2playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k2playerseason.pname}</strong><span>(${k2playerseason.position})</span>
														</div>
														<span class="club">${k2playerseason.cname_short}</span>
														<div class="stats">${k2playerseason.p_ggoal}<img
																src="${url}/resources/images/goals.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="assist-rank">
										<ul class="rank-list">
											<li class="rank-subject">
												<div align="center">최다 도움</div>
											</li>
											<c:forEach var="k2playerseason"
												items="${k2PlayerSeasonARankList}" varStatus="status">
												<li class="rank-detail">
													<div class="rank font-weight-bold">
														<h3>${status.count}</h3>
													</div>
													<div class="pimage">
														<img
															src="${url}/resources/player/${k2playerseason.position}${k2playerseason.pname}.png"
															title="${k2playerseason.pname}">
													</div>
													<div class="pinfo" align="justify">
														<div class="player">
															<strong>${k2playerseason.pname}</strong><span>(${k2playerseason.position})</span>
														</div>
														<span class="club">${k2playerseason.cname_short}</span>
														<div class="stats">${k2playerseason.p_assist}<img
																src="${url}/resources/images/assist.png">
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<!-- 리그 2 끝 -->
						</div>
						<!-- 현 시즌 선수 기록 끝 -->
						
						<!-- 클럽 바로가기  -->
						<div class="right-menu team-emblem">
							<div class="top emblem-top" align="left">
								<span class="subject" id="emblem-subject">클럽 바로가기</span>
							</div>

							<div class="emblem" align="left">
								<hr>
								<c:forEach var="club" items="${clubList}">
									<a href="#"><img
										src="${url}/resources/emblem/${club.ccode}.png"
										title="${club.cname_short}"></a>
								</c:forEach>
							</div>
						</div>
						<!-- 클럽 바로가기  끝 -->
					</div>
				</div>
			</div>

		</div>
		<!-- 페이지 내용 들어가는 부분 끝 -->
		<!-- 푸터 -->
		<div class="wrap_footer"><br/><br/>
			<input type="button" value="어드민페이지!!" onClick="location.href='admin/main.do'"/>
		</div>
		<!-- 푸터 끝 -->
	</div>
</body>
</html>
