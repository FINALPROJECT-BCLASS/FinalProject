<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <script type="text/javascript"></script>
    
    <link href='resources/css/main.css' rel='stylesheet' />
    <script src='resources/lib/main.js'></script>
    <script>
	    document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
	            eventSources: [{
	            	events: function(info,successCallback,failureCallback) {
	            		var events = [];
	            		
	            		$.ajax({
	            			url: 'accountList.do',
	            			dataType: 'json',
	            			success: function(data) {
	            				/* alert(data); */
	            				console.log(data);
	            				for(var i in data.accountList){
		    	   					events.push({title:data.accountList[i].eventTitle
		    	   								,date:data.accountList[i].date
		    	   								,color:data.accountList[i].color
		    	   								,id:data.accountList[i].gaNo})
		    	   				};
	            				
	            				successCallback(events);
	            			},
	            			error:function(request, status, errorData){
	                            alert("error code: " + request.status + "\n"
	                                  +"message: " + request.responseText
	                                  +"error: " + errorData);
	                        }   
	            		})
	            	}
	            }],
	            dateClick: function(info){
	            	var clickDate = info.dateStr;
	            	/* alert(clickDate); */
	            	
	            	location.href="insertAccountView.do?clickDate="+clickDate;
		    	 	/* $("#abDate").val(info.dateStr);
		    	 	
		    	 	$("#addModal").modal(); */
		      	},
		      	eventClick: function(info) {
	            	abDetailView(info.event.id);
	            }
	        });
	
	        calendar.render();
	        
	        var year = calendar.getDate().getFullYear();
	        var month = calendar.getDate().getMonth()+1;
			var formatMonth = "";
	        
			if(month < 10){
		        formatMonth = "0"+month;
		    } else {
		    	formatMonth = month;
		    }
			
			var calendarDate = year + "-" + formatMonth;
			
			sumView(calendarDate);
	        
	        $(".fc-prev-button").click(function(){
	        	month = month - 1;
	        	
	        	if(month < 1) {
	        		month = 12;
	        		year = year - 1;
	        	}
	        	
	        	if(month < 10) {
	        		formatMonth = "0"+month;
	        	} else {
	        		formatMonth = month;
	        	}
	        	
	        	calendarDate = year + "-" + formatMonth;
	        	$("#listDate").val(calendarDate);
	        	
	        	sumView(calendarDate);
	        })
	        
	        $(".fc-next-button").click(function(){
	        	month = month + 1;
	        	
	        	if(month > 12) {
	        		month = 1;
	        		year = year + 1;
	        	}
	        	
	        	if(month < 10) {
	        		formatMonth = "0"+month;
	        	} else {
	        		formatMonth = month;
	        	}
	        	
	        	calendarDate = year + "-" + formatMonth;
	        	$("#listDate").val(calendarDate);
	        	
	        	sumView(calendarDate);
	        })
	    });
    </script>
    
    <style>
        .col-md-6, .col-md-2 {
            position: inherit !important;
        }
		.modal-dialog{
		    max-width: 1000px !important;
		}
		
		
        .modal-content{
            width: 1000px !important;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
            margin-left: 300px;
            /* z-index: 0 !important; */
        }

        .fc-today-button{
            display: none !important;
        }
        
        .default-btn{
        	margin-left: 15px;
        }
        
        .fc-event-time{
        	display: none !important;
        }
        #total{
        	margin-left:100px;
        	width:90%;
        }
        
        .total{
        	display:inline-block;
        	
        	width:150px;
        }
        .totalBox, #groupWrite{
        	display:inline-block;
        	width:30%;
        }
        
        .proBox{color:}
        
         .join-form-area{padding-top:150px !important;position:relative; float: right;display: flex; justify-content: center; flex-direction: column; align-items: center; padding: 40px; width: 81%; background: #F3F3F3; }
         
         #calendar{margin:0 auto;}
         
         .itemBox{    margin-left: 200px; width:70%;}
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    

		<c:if test="${ groupTable.id eq gInfo.loginUserId}">
			<jsp:include page="../common/sidenaviGroupAdmin.jsp"/>
		</c:if>
		
		<c:if test="${ groupTable.id ne gInfo.loginUserId}">
			<jsp:include page="../common/sidenaviGroup.jsp"/>
		</c:if>
        
        <br><br>
           <!-- <div class="join-form-area"> -->
    
   <%--  <jsp:include page="../common/groupNoticeHeader.jsp"/> --%>
         <div class="itemBox" style="width:70%">
         <h1 align="center">Group Diary</h1>
        <h4 align="center">Account</h4><br>
        
         
   
                <table id="total">
                    <tr>
                    	<td>
                    		<div class="totalBox">Profit : <div class="total pro"> </div></div>
                    		<div class="totalBox">Expense : <div class="total exp"> </div></div>
                    		<div class="totalBox">Fee : <div class="total fee"> </div></div>
                    		<div id="groupWrite"  ><span class="material-icons writeBtn">create</span></div>
                    	</td>
                    </tr>
                </table>
                  <div id='calendar'></div>
                <!--    <div id='calendar'></div> -->
                   <!-- </div> -->
    </div>
     <div>
     	<div style="width:30%; height:300px; background:block;">
     	
     	</div>
     </div>       


    <jsp:include page="../common/footer.jsp"/>	

    <script>	
		function sumView(calendarDate) {
        	
	        $.ajax({
       			url: 'totalAccountList.do',
       			data: {gaDate:calendarDate},
       			dataType: 'json',
       			success: function(data) {

       				console.log(data);
       				$(".pro").html("");
       				$(".exp").html("");
       				$(".fee").html("");

       				$(".pro").html(data.totalPro[0].totalPro);
       				$(".exp").html(data.totalExp[0].totalExp);
       				$(".fee").html(data.totalFee[0].totalFee);
	       				
	       			
       					
       				
       			},
       			error:function(request, status, errorData){
                       alert("error code: " + request.status + "\n"
                             +"message: " + request.responseText
                             +"error: " + errorData);
                   }   
       		})
	    }
		
		
    </script>
    
</body>
</html>