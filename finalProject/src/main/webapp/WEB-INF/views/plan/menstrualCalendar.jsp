<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            initialDate: new Date,
            editable: true,
            selectable: true,
            businessHours: true,
            dayMaxEvents: true, // allow "more" link when too many events
            events: [
                
            ]
            });

            calendar.render();
        });
    </script>
    
    <style>
        #personalInfo{
            border-collapse: separate;
            border-spacing: 0 5px;
        }

        .col-md-6, .col-md-2 {
            position: inherit !important;
        }

        .modal-content{
            width: 300px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
            margin-left: 300px;
            /* z-index: 0; */
        }

        .fc-today-button{
            display: none !important;
        }
    </style>
</head>

<body>
    <jsp:include page="../common/header.jsp"/>

    <section>

		<jsp:include page="../common/sidenavi.jsp"/>
        
        <br><br>
        <div class="modal fade" id="setModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                    </div>
                    <div class="modal-body" align="center">
                        <form>
                            가장 최근의 월경 시작일을 입력하세요<br>
                            <input type="date" style="margin: 5px;"><br>
                            <button type="submit">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-2">
                <table id="personalInfo">
                    <tr>
                        <td><b>Cycle :&nbsp;</b></td>
                        <td><input type="number" min="1" max="31" value="28"><br></td>
                        <td><b>&nbsp;days</b></td>
                    </tr>
                    <tr>
                        <td><b>Period :&nbsp;</b></td>
                        <td><input type="number" min="1" max="31" value="5"><br></td>
                        <td><b>&nbsp;days</b></td>
                    </tr>
                </table>
            </div>
            <div class="col-md-6"></div>
            <div class="col-md-2">
                <table style="font-size: 18px;">
                    <tr>
                        <td style="color: hotpink;">♥</td>
                        <td>월경 예정일</td>
                    </tr>
                    <tr>
                        <td style="color: seagreen;">★</td>
                        <td>가임기</td>
                    </tr>
                </table>
            </div>
        </div>

        <div id='calendar'></div>
        
       <br><br><br><br><br>
    </section>

    <jsp:include page="../common/footer.jsp"/>	

    <script>
        // 로그인 서브 메뉴
        $(document).ready(function(){
        $(".l-login-area>div").click(function(){

            var submenu = $(this).children(".l-login-sub");
            var subdeco = $(this).children(".l-login-square");
            
             if(submenu.is(":visible")){
                submenu.slideUp();
                subdeco.toggleClass("l-hide");
            }else{
                submenu.slideDown();
                subdeco.toggleClass("l-hide");
            }

            });
        });
    </script>
    
</body>
</html>