<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style>
	
	 <!-- Demo styles -->
  <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    
    
    /* 혜린 수정 swiper css */
    .swiperCon{width:20%; height:20%;}
    
    /* 게시판 css */
     html, body { height:100%;}

    h1{text-align:center;}
    .btnList{width:100%; text-align:right;}
    .groupBtn{border:none; font-weight: 600; background:none;}
    .BoardBtn{color:#2860E1; font-size: 21px;}

    .join-form-area{float: right;display: flex;justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
    .groupJoin{width:900px;}

    /* 구글 아이콘 */
    .material-icons{padding-top:12px; padding-left: 10px; text-shadow: 1.5px 1.5px 1.5px gray; }
   
    /* 공지 */
    .noticeText{float: right;margin:auto; width: 81%; background:#c2c2c2; border-radius: 0 0 5px 5px;  }
    .noticeTb{margin-left:20px;}
    .noticeTitle{padding-top:20px; padding-left:5px;font-weight: 600; font-size: 20px;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeWriter{padding-left:5px; font-size:12px; font-weight: 600;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeDate{padding-left:5px; font-size:12px; font-weight: 600;  text-shadow: 1.5px 1.5px 1.5px gray; }
    .noticeContent{padding-top:5px; padding-left:15px; padding-bottom: 20px; font-size:14px;  text-shadow: 1.5px 1.5px 1.5px gray; }

    /* 공지게시판 */
    .groupNotice{width:100%; height:400px;overflow:scroll; overflow-x:hidden;}
    .noticeBoardTb{width:100%; margin-bottom:5px; background:white;border:0.5px solid lightgray; border-radius:10px;}
    .noticeBoardTitle{padding-top:20px; padding-left:5px;font-weight: 600; font-size: 20px;}
    .noticeBoardWriter{padding-left:5px; font-size:12px; font-weight: 600;}
    .noticeBoardDate{padding-left:5px; font-size:12px; font-weight: 600;}
    .noticeBoardContent{margin-top:10px; padding-top:5px;padding-left:15px; width:1000px; height:70px; overflow:scroll; overflow-x:hidden; font-size:13px; background: #F3F3F3; border-radius: 5px; margin-bottom: 7px;}
  	
  	.swiperTd{width:1000px; height:100px;}
  	.swiper-container{margin: 0 150px !important; width:30%; height:100px;}
  	.swiperImg{width:100px; height:100px;}
  	
  	
  	.reply{ padding-bottom:10px; padding-left:10px; display:inline-block; }
  	.emptyHeart{cursor:pointer;}
  	.heart{cursor:pointer;}
  	
  	
  	.swiper-wrapper{width:1700px !important; }
  </style>
  
  <link rel="stylesheet" href="resources/css/swiper-bundle.css">
    <link rel="stylesheet" href="resources/css/swiper-bundle.min.css">
    <script src="resources/js/swiper-bundle.js"></script>
    <script src="resources/js/swiper-bundle.min.js"></script>
      
</head>

<body>

	<jsp:include page="../common/header.jsp"/>
	
	<jsp:include page="../common/sidenaviGroup.jsp"/>

	<!-- 공지사항 -->

	<div class="noticeText">
        <table class="noticeTb">
          <tr><td><span class="material-icons">campaign</span></td><td><div class="noticeTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
          <tr><td></td><td><div class="noticeWriter">김혜린</div></td></tr>
          <tr><td></td><td><div class="noticeDate">2020-06-12 오후 06:00</div></td></tr>
          <tr><td></td><td><div class="noticeContent">파이널 프로젝트는 8월 27일에 종료됩니다.</div></td></tr>
        </table>
      </div>
      
      <div class="join-form-area">
  
        <h1>Group Diary</h1>
        <div class="btnList">
            <button class="groupBtn noticeBtn">Notice</button>
            <button class="groupBtn BoardBtn">Board</button>
            <button class="groupBtn PhotoBtn">Photo</button>
            <button class="groupBtn VideoBtn">Video</button>
    	</div>
        <br>
		 <div class="groupNotice">
              <table class="noticeBoardTb">
                <tr><td><span class="material-icons">perm_identity</span></td><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td></td><td><div class="noticeBoardWriter">김혜린</div></td></tr>
                <tr><td></td><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td></td><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              	<tr>
              		<td></td>
              		<td class="swiperTd">
              			 <!-- Swiper -->
						  <div class="swiper-container swiperCon">
						    <div class="swiper-wrapper">
				  	    		<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						    <!-- Add Arrows -->
						    <div class="swiper-button-next"></div>
						    <div class="swiper-button-prev"></div>
						  </div>
						 <!-- Swiper end -->
              		</td>
              	</tr>
              	<tr>
              		<td colspan="2">
              			<div class="reply likeBox"><span class="material-icons emptyHeart">favorite_border</span><span class="reply">3</span></div>
              			<div class="reply replyBox"><span class="material-icons">sms</span>&nbsp;<span class="reply">3</span></div>
           			</td>
              	</tr>
              </table>
              
              
               <table class="noticeBoardTb">
                <tr><td><span class="material-icons">perm_identity</span></td><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td></td><td><div class="noticeBoardWriter">김혜린</div></td></tr>
                <tr><td></td><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td></td><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              	<tr>
              		<td></td>
              		<td class="swiperTd">
              			 <!-- Swiper -->
						  <div class="swiper-container swiperCon">
						    <div class="swiper-wrapper">
				  	    		<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						    <!-- Add Arrows -->
						    <div class="swiper-button-next"></div>
						    <div class="swiper-button-prev"></div>
						  </div>
						 <!-- Swiper end -->
              		</td>
              	</tr>
              	<tr>
              		<td colspan="2">
              			<div class="reply likeBox"><span class="material-icons emptyHeart">favorite_border</span><span class="reply">3</span></div>
              			<div class="reply replyBox"><span class="material-icons">sms</span>&nbsp;<span class="reply">3</span></div>
           			</td>
              	</tr>
              </table>
               <table class="noticeBoardTb">
                <tr><td><span class="material-icons">perm_identity</span></td><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td></td><td><div class="noticeBoardWriter">김혜린</div></td></tr>
                <tr><td></td><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td></td><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              	<tr>
              		<td></td>
              		<td class="swiperTd">
              			 <!-- Swiper -->
						  <div class="swiper-container swiperCon">
						    <div class="swiper-wrapper">
				  	    		<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						    <!-- Add Arrows -->
						    <div class="swiper-button-next"></div>
						    <div class="swiper-button-prev"></div>
						  </div>
						 <!-- Swiper end -->
              		</td>
              	</tr>
              	<tr>
              		<td colspan="2">
              			<div class="reply likeBox"><span class="material-icons emptyHeart">favorite_border</span><span class="reply">3</span></div>
              			<div class="reply replyBox"><span class="material-icons">sms</span>&nbsp;<span class="reply">3</span></div>
           			</td>
              	</tr>
              </table>
               <table class="noticeBoardTb">
                <tr><td><span class="material-icons">perm_identity</span></td><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td></td><td><div class="noticeBoardWriter">김혜린</div></td></tr>
                <tr><td></td><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td></td><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              	<tr>
              		<td></td>
              		<td class="swiperTd">
              			 <!-- Swiper -->
						  <div class="swiper-container swiperCon">
						    <div class="swiper-wrapper">
				  	    		<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						    <!-- Add Arrows -->
						    <div class="swiper-button-next"></div>
						    <div class="swiper-button-prev"></div>
						  </div>
						 <!-- Swiper end -->
              		</td>
              	</tr>
              	<tr>
              		<td colspan="2">
              			<div class="reply likeBox"><span class="material-icons emptyHeart">favorite_border</span><span class="reply">3</span></div>
              			<div class="reply replyBox"><span class="material-icons">sms</span>&nbsp;<span class="reply">3</span></div>
           			</td>
              	</tr>
              </table>
               <table class="noticeBoardTb">
                <tr><td><span class="material-icons">perm_identity</span></td><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td></td><td><div class="noticeBoardWriter">김혜린</div></td></tr>
                <tr><td></td><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td></td><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              	<tr>
              		<td></td>
              		<td class="swiperTd">
              			 <!-- Swiper -->
						  <div class="swiper-container swiperCon">
						    <div class="swiper-wrapper">
				  	    		<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						    <!-- Add Arrows -->
						    <div class="swiper-button-next"></div>
						    <div class="swiper-button-prev"></div>
						  </div>
						 <!-- Swiper end -->
              		</td>
              	</tr>
              	<tr>
              		<td colspan="2">
              			<div class="reply likeBox"><span class="material-icons emptyHeart">favorite_border</span><span class="reply">3</span></div>
              			<div class="reply replyBox"><span class="material-icons">sms</span>&nbsp;<span class="reply">3</span></div>
           			</td>
              	</tr>
              </table>
               <table class="noticeBoardTb">
                <tr><td><span class="material-icons">perm_identity</span></td><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td></td><td><div class="noticeBoardWriter">김혜린</div></td></tr>
                <tr><td></td><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td></td><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              	<tr>
              		<td></td>
              		<td class="swiperTd">
              			 <!-- Swiper -->
						  <div class="swiper-container swiperCon">
						    <div class="swiper-wrapper">
				  	    		<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						    <!-- Add Arrows -->
						    <div class="swiper-button-next"></div>
						    <div class="swiper-button-prev"></div>
						  </div>
						 <!-- Swiper end -->
              		</td>
              	</tr>
              	<tr>
              		<td colspan="2">
              			<div class="reply likeBox"><span class="material-icons emptyHeart">favorite_border</span><span class="reply">3</span></div>
              			<div class="reply replyBox"><span class="material-icons">sms</span>&nbsp;<span class="reply">3</span></div>
           			</td>
              	</tr>
              </table>
               <table class="noticeBoardTb">
                <tr><td><span class="material-icons">perm_identity</span></td><td><div class="noticeBoardTitle">깡삽이네조 파이널 프로젝트</div></td></tr>
                <tr><td></td><td><div class="noticeBoardWriter">김혜린</div></td></tr>
                <tr><td></td><td><div class="noticeBoardDate">2020-06-12 오후 06:00</div></td></tr>
                <tr><td></td><td><div class="noticeBoardContent">파이널 프로젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다젝트는 8월 27일에 종료됩니다.</div></td></tr>
              	<tr>
              		<td></td>
              		<td class="swiperTd">
              			 <!-- Swiper -->
						  <div class="swiper-container swiperCon">
						    <div class="swiper-wrapper">
				  	    		<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
				       			<div class="swiper-slide"><img class="swiperImg" src="resources/images/히지.png"></div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						    <!-- Add Arrows -->
						    <div class="swiper-button-next"></div>
						    <div class="swiper-button-prev"></div>
						  </div>
						 <!-- Swiper end -->
              		</td>
              	</tr>
              	<tr>
              		<td colspan="2">
              			<div class="reply likeBox"><span class="material-icons emptyHeart">favorite_border</span><span class="reply">3</span></div>
              			<div class="reply replyBox"><span class="material-icons">sms</span>&nbsp;<span class="reply">3</span></div>
           			</td>
              	</tr>
              </table>
            
          </div>
	
	  </div>

	  <!-- Initialize Swiper -->
	  <script>
	    var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 3,
	      spaceBetween: 30,
	      slidesPerGroup: 3,
	      loop: true,
	      loopFillGroupWithBlank: true,
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	    });
	  </script>
	  
	  <!-- 하트 누르기 -->
	  <script>

	  	 $("span.emptyHeart").click(function(){
	  		$(this).html($(this).html() == 'favorite_border' ? 'favorite' : 'favorite_border');
	  	}) 
  	</script>
	  
	  <jsp:include page="../common/footer.jsp"/>	
</body>

</html>