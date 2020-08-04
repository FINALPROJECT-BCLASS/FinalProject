<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Habit Tracker</title>
<!-- CSS -->
<link rel="stylesheet" href="resources/css/flickity/flickity.css">
<!-- JavaScript -->
<script src="resources/js/flickity/flickity.pkgd.min.js"></script>
<link rel="stylesheet" type="text/css" href="path/to/chartjs/dist/Chart.min.css">
<link href='resources/css/simpleCalendar/simple-calendar.css' rel='stylesheet' />

<style>

        body {
            font-size: 14px;
            color: #484848;
            margin: 0;
            padding: 0;
        }

        .right-area {
        	display: flex;
            flex-direction: column;
            justify-content: center;
            float: right;
            width: 81%;
            background-color: #f7f7f7;
            color: #484848;
            text-align: center;
            padding: 50px;
        }

        .pSubject {
            font-size: 30px;
            font-weight: 600;
            padding: 30px;
            padding-top: 0;
            color: #484848;
            display: inline-block;
        }

        .group-img {
            width: 30px;
            height: 30px;
        }
        
        .clicked {
        	box-shadow: 0 0 0 3px #c4c4c4;
        }


        /* content */

        .content {
        	margin: 0 auto;
            width: 100%;
            border-radius: 10px;
            background: white;
            margin-top: 30px;
            padding: 30px;
            display: block;
        }
        
       	.cSubject {
	    	font-size: 25px;
	    	font-weight: 600;
	    	padding: 20px;
	    }
	    
        
        .content-section1,
        .content-section2 {
        	width: 100%;
		    height: 262px;
		    background: #f3f3f3;
		    border-radius: 10px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
	        flex-direction: row;
        }
        
	    .content-section1 {
	    	height: 430px;
	    }
        .content-section2 {
        	justify-content: start;
        }
        
        .content-section1-left,
        .content-section2-left {
			width: 50%;
		    height: 262px;
		    background: #f3f3f3;
		    border-radius: 10px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
	        flex-direction: column;
		}
		
		.content-section2-left {
			padding-right: 20px;
			width: 46%;
		}
		
		.conetent-section1-left {
			width: 50%;
		    padding-left: 70px;
		    height: 100%;
		    flex-direction: column;
		}
		
		.content-section1-right,
		.content-section2-right {
			width: 50%;
		    height: 262px;
		    float: right;
		    border-radius: 10px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
	        flex-direction: column;
		}
		
		.content-section2-right {
			width: 56%;
		}
		
		.section1-item-area,
		.section2-item-area {
			width: 85%;
		    display: flex;
    		justify-content: center;
		}
		
		.section1-item,
		.section2-item {
			width: 46%;
		    background: white;
		    border-radius: 10px;
		    padding: 15px;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		    margin-top: 10px;
		}
		
		.section2-item {
			background: #F3F3F3;
		    text-align: left;
		    width: 100%;
		    height: 100%;
		    overflow: hidden;
		    overflow-y: scroll;
		    align-items: baseline;
		    justify-content:start;
		    
		}
		
		.section2-item::-webkit-scrollbar {
  		  	display: none; 
		}
		
		.add {
			position:relative;
		}
		
		.add::after {
			display: flex;
			position: absolute;
		    content: "+";
		    width: 100%;
		    height: 100%;
		    background: #0000007a;
		    color: white;
		    border-radius: 10px;
		    justify-content: center;
		    align-items: flex-end;
		    font-size: 80px;
		    font-weight: 200;
		    opacity: 0;
		    
		}
		
		.add:hover::after {
			cursor: pointer;
			opacity: 1;
			transition-duration: 0.5s;
			
		}
		
		.section1-item > span:nth-child(1) {
			font-weight: 600;
			font-size: 20px;
		}
		
		.section1-item > span:nth-child(2) {
			font-size: 29px;
		    font-weight: 700;
		    color: #6b98ff;
		    margin-top: -5px;
		}
		
		.section1-item > span:nth-child(3) {
		    font-weight: 600;
		    color: gray;
	        margin-top: -8px;
		}

        textarea {
            border: 0px;
            resize: none !important;
            cursor: initial;
        }

        textarea:focus {
            outline: none;
        }
        
        /* color */
        .sky {
            background-color: #6B98FF !important;
        }

        .pink {
            background-color: #FFA3E5 !important;
        }

        .light-purple {
            background-color: #C9A8FF !important;
        }

        .green {
            background-color: #50c6b0 !important;
        }

        /* button */

        .button-area {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
            width: 100%;
	    }
	
        .button-area > button {
            border: none;
            height: 40px;
            margin: 0 5px;
            background: none;
            font-size: 23px;
            font-weight: 700;
            color: #484848;
        }
        
        .item-subject {
        	font-size: 23px;
		    font-weight: 600;
		    width: 81%;
		    height: 42px;
		    text-align: left;
        }
        
        .sub {
        	display: flex;
        	width: 100%;
		    margin-top: 30px;
		    margin-bottom: -10px;
        }
        
        /* external css: flickity.css */

		* { box-sizing: border-box; }
		
		
		.carousel-cell {
		  	
			width: 280px;
			margin-top: 5px;
			height: 100px !important;
			margin-right: 10px;
			background: #e9ecef;
			border-radius: 8px !important;
			counter-increment: carousel-cell;
			cursor: pointer;
		}
		
		.flickity-page-dots {
			display: none;
		}
		
		.flickity-viewport {
			height: 110px !important;
		}


		.bar-info {
			width: 100%;
		    height: 100%;
		    padding: 18px;
		    position: absolute;
		    display: flex;
		    align-items: flex-start;
		    justify-content: center;
		    flex-direction: column;
		}
	 
		.bar-info > div:nth-child(1) {
			color: #484848;
			font-weight: 600;
			font-size: 20px;
			height: 20px;
		}
		
		.progress > div:nth-child(3) {
			position: absolute;
		    right: 0;
		    width: 50px;
		    height: 50px;
		    background: white;
		    border-radius: 50%;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    color: gray;
		    font-size: 17px;
		    font-weight: 700;
		    margin: 25px 20px;
		}
	    
	    .progress-d {
	    	height: 35px !important;
		    width: 82%;
		    border-radius: 50px !important;
	        margin: 0;
	    }
	    
	    /*habit record*/
	    
	    .habit-record {
	    	width: 100%;
    		text-align: left;
	    }
	    
	    .habit-record tr td:nth-child(1) {
    	    height: 30px;
    	    width: 30px;
		    display: flex;
		    text-align: center;
		    align-items: center;
		    justify-content: center;
	    }
	    
	    .habit-record tr td:nth-child(2) {
    	    height: 30px;
    	    width: 100px;
	    }
	    
	    .habit-record tr td:nth-child(3) {
    	    color: #2860E1;
    	    font-weight: 600;
   	        height: 30px;
   	        width:100px;
	    }
	    
	    .habit-record tr td:nth-child(4) {
    	    width: 300px;
   	        height: 30px;
	    }
	    
	    .t-sub {
    	    font-size: 20px;
    		font-weight: 700;
	    }
	    
	    /* checked select */

        input[type="checkbox"] {
            display: none;
        }

        input[type="checkbox"]:checked + label{
       		background-color: #2860E1;
        
        }
        
        label {
        	margin: 0 !important;
        	width: 15px;
        	height: 15px;
        	border-radius: 50%;
        	background: white;
        }
        
        /*모달*/
        
        .close {
        	position: absolute;
		    z-index: 1;
		    right: 10px;
		    top: 10px;
		    width: 30px;
		    height: 30px;
        }
        
        .modal-content {
       	    border-radius: 0.7rem !important;
        }
        
        .modal-body {
       	    padding: 16px !important;
        }
        
        .modal-dialog {
        	margin-top: 100px !important;
        	max-width: 415px !important;
        }
        
        .modal-t {
       	    margin: 15px;
    		text-align: left;
        }
        
        .modal-t > div:nth-child(1) {
       	    font-size: 21px;
    		font-weight: 600;
        }
        
        .count-area {
		    height: 100px;
		    border-radius: 10px;
	        margin: 15px;
		    display: flex;
		    align-items: center;
        }
        
        .count-area > span:nth-child(1) {
       	    width: 81px;
		    float: left;
		    font-size: 30px;
		    margin-top: -7px;
		    
        }
        
        .count-area > span:nth-child(3) {
        	font-size: 30px;
        }
        
        .count {
        	text-align: right;
		    background: none;
		    border: none;
		    font-size: 50px;
		    width: 200px;
		    padding: 10px;
        }
        
        .memo-area, .comment-area, .record-area {
        	margin: 15px;
   			text-align: left;		
        }
        
        .memo-area > div:nth-child(1) {
      	    font-size: 21px;
    		font-weight: 600;
    		margin-bottom: 10px;
        }
        
        .memo-area > input {
        	background: #f3f3f3;
		    font-size: 17px;
    		color: #484848;
		    height: 60px;
		    width: 100%;
		    border-radius: 10px;
		    display: flex;
		    align-items: flex-start;
		    border: 0;
		    padding: 15px;
        }
        
        .comment-area > textarea {
        	background: #f3f3f3;
		    font-size: 17px;
		    color: #484848;
		    height: 190px;
		    width: 100%;
		    border-radius: 10px;
		    display: flex;
		    align-items: flex-start;
		    border: 15px solid #f3f3f3;
		    
        }
        
        .comment-area > textarea::-webkit-scrollbar {
  		  	display: none; 
		}
		
		
        
        /* 작은 버튼 */
        
        .small-button-area {
	        display: flex;
		    justify-content: flex-end;
		    width: 100%;
		    font-size: 10px;
        }
        
        .small-button-area > button {
        	border: none;
		    height: 40px;
		    margin: 0 5px;
		    background: none;
		    font-size: 18px;
		    font-weight: 700;
		    color: #484848;
		    
        }
        
        input[type="hidden"] {
            display: none;
        }
        
        .slide-btn {
        	margin-bottom : 10px;
        }
        
        .slide-btn > button {
       	    border: none;
		    height: 40px;
		    width: 40px;
		    background: white;
		    border-radius: 50%;
		    margin-left: 9px;
        }
        
        .show {
        	display: flex;
        }
        
        .hide {
        	display: none;
        }
        
        #record-time {
       	    display: inline-block;
		    width: 120px;
		    height: 40px;
		    font-size: 17px;
		    padding: 10px;
		    font-weight: 600;
        }
        
        #htr_now_m {
        	border: none;
		    border-radius: 10px;
		    background: #f3f3f3;
		    height: 50px;
		    width: 80px;
		    padding: 10px;
        }
        
        #htr_con_m {
        	border: none;
		    border-radius: 10px;
		    background: #f3f3f3;
		    height: 50px;
		    width: 100%;
		    margin-top: 10px;
		    padding: 10px;
        }
        
        #htr_unit_m {
        	display: inline-block;
    		font-weight: 700;
    		font-size: 17px;
        }
        
        .smallA {
        	font-size: 14px;
		    display: inherit;
		    margin-top: -5px;
		    color: gray !important;
        }
        
        

		
    </style>
    </head>

    <body>
    	<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDaily.jsp"/>
        <div class="right-area">
            <span class="pSubject">Habit Tracker</span>
            
            <div class="small-button-area slide-btn">
       			<button type="button" onclick="cycleBtn();">D</button>
       			<button type="button" onclick="cycleBtn();">W</button>
                <button type="button" onclick="cycleBtn();">M</button>
			</div>
            <!-- 슬라이드 -->
            <div class="carousel" data-flickity='{ "draggable": true }'>
				<c:forEach var="h" items="${hlist }">
					<!-- 퍼센트 연산처리 -->
					<fmt:parseNumber var="percent" value="${(h.ht_now/h.ht_goal)*100+(1-(((h.ht_now/h.ht_goal)*100)%1))%1}" integerOnly="true" />
					<!-- 슬라이드 아이템 -->
		        	<input id="htNum" type="hidden" value="${h.ht_no }"> <!-- 습관 번호 -->
					<div class="progress carousel-cell habitItem ${h.ht_cycle }">
				  		<div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:${percent }%; background-color:${h.ht_color};"></div>
			    		<div class="bar-info">
							<div class="ht_title">${h.ht_title }</div>
							<div>
								<c:set var="now" value="${h.ht_now }"/>
								<c:if test="${empty now}">
									<a class="ht_now">0</a>
								</c:if>
								<c:if test="${!empty now}">
									<a class="ht_now">${h.ht_now }</a>
								</c:if>
								/ <a class="ht_goal">${h.ht_goal }</a>
								<a class="ht_unit">${h.ht_unit }</a>
							</div> <!-- now는 기록 메모 테이블의 현재값 컬럼을 더한 값 -->
						</div>
						<div class="percent">${percent }%</div>
					</div>
				</c:forEach>
			</div>
		
       
            
            <!-- Button Start-->
            <div class="button-area">
                <button onclick="location.href='addHabitView.do'">Add</button>
                <button>Delete</button>
                <button>Edit</button>
            </div>

    		<!-- 내용 -->
            <div id="content" class="content">
            	<input type="hidden" id="ht_no">
            	<div class="cSubject" id="habitTitle">Drink Water</div>
            	<div class="content-section1">
            		<canvas id="myChart"></canvas>
	            </div>
            </div>
			      
            <!-- Button Start-->
            <div class="button-area">
                <button class="blue" >Graph >></button>
            </div>
            <!-- Button End-->
        </div>
		
		<!-- Calendar -->
		<!-- <script type="text/javascript"  src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
        crossorigin="anonymous"></script> -->
		
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<script>
		
		var data = [];
		var target=$('.habitItem');
		
		
		
	    target.on("click", function(){
	    	$(this).addClass("clicked");
	    	
	    	$.ajax({
	    		
	    		url: "",
	   			type: "post",
				data: {},
				dataType:"json",
				success:function(caldata){
					
				},
				error:function(request, status, errorData){
                      alert("error code: " + request.status + "\n"
                                +"message: " + request.responseText
                                +"error: " + errorData);
                } 
	    		
	    	});
	    	
	    	
	    	target.not($(this)).removeClass("clicked");
	    });
	    
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'bar',

		    // The data for our dataset
		    data: {
		        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'september', 'actober', 'rebember', ''],
		        datasets: [{
		            label: 'Drink water',
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)',
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1,
		            data: [50, 100, 500, 200, 500, 300, 1500]
		        }]
		    },

		    // Configuration options go here
		    options: {}
		});
		</script>
        <jsp:include page="../common/footer.jsp"/>
    </body>
</html> 