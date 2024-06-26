<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/admin/header.css">
<div class="admin_wrap">
<div class="wrapper">
    <header class="top_gnb_area">
    <input type="hidden" name="userId" value="${member.userId }">
    <input type="hidden" name="ugrade" value="${member.ugrade}">
    	<ul class="list">
			<li><a href="/main"><img src="/resources/icon/logo_m.png" class="title_icon"></a></li>
			<li><a href="/member/logout.do">로그아웃</a></li>
		</ul>
    </header>
    <br><br><br>
    
	<nav class="nav_wrap">
		<div class="admin_move"><a href="/admin/movieInsert">영화등록</a></div>
        <div class="admin_move"><a href="/admin/movieList">영화관리</a></div>
        <div class="admin_move"><a href="/admin/subscribe">구독관리</a></div>
        <div class="admin_move"><a href="/admin/purchase">구매/대여관리</a></div>
        <div class="admin_move"><a href="/admin/qna">문의게시판</a></div>
        <div class="admin_move"><a href="#">추후추가</a></div>
	</nav>

