<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
		<jsp:include page="../common/header.jsp"/>
		<jsp:include page="../common/sidenaviDiet.jsp"/>
			<div style="Float:right; width:81%">
			<div id="chartContainer" style="height: 370px; width: 100%;"></div>
			<br>
			<div id="chartContainer2" style="height: 370px; width: 100%;"></div>
			<br>
			<div id="chartContainer3" style="height: 370px; width: 100%;"></div>
			</div>
		<jsp:include page="../common/footer.jsp"/>	

</body>
<script type="text/javascript">

//무게 그래프
$(document).ready(function() {
 
var dps = [];
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	animationEnabled: true,
	title: {
		text: "체중(kg)"
	},
	axisX: {
			valueFormatString : "####-##-##",
			titleFontWeight : "bold"
	},
	axisY: {
		title: "체중(kg)",
		suffix: "kg"
	},
	data: [{
		type: "line",
		dataPoints: dps
	}]
});
 
var xValue;
var yValue;
<c:forEach items="${dataPointsList}" var="dataPoints">	
		xValue = "${dataPoints.inDate}";
		var res = xValue.split("-");
		yValue =  parseInt("${dataPoints.inWeight}");
		dps.push({
			x :  parseInt(res[0]+res[1]+res[2]),
			y : yValue
		});			
			console.log(xValue);
			console.log(yValue);
		
</c:forEach> 
		console.log("dps : " + dps[1].x);
 
chart.render();
 
})
//골격근량 그래프
$(document).ready(function() {
 
var dps = [];
var chart = new CanvasJS.Chart("chartContainer2", {
	theme: "light2", // "light1", "dark1", "dark2"
	animationEnabled: true,
	title: {
		text: "골격근량(kg)"
	},
	axisX: {
			valueFormatString : "####-##-##",
			titleFontWeight : "bold"
	},
	axisY: {
		title: "골격근량(kg)",
		suffix: "kg"
	},
	data: [{
		type: "line",
		dataPoints: dps
	}]
});
 
var xValue;
var yValue;
<c:forEach items="${dataPointsList}" var="dataPoints">	
		xValue = "${dataPoints.inDate}";
		var res = xValue.split("-");
		yValue =  parseInt("${dataPoints.inMuscle}");
		dps.push({
			x :  parseInt(res[0]+res[1]+res[2]),
			y : yValue
		});			
			console.log(xValue);
			console.log(yValue);
		
</c:forEach> 
		console.log("dps : " + dps[1].x);
 
chart.render();
 
})
//3 채지방량 그래프
$(document).ready(function() {
 
var dps = [];
var chart = new CanvasJS.Chart("chartContainer3", {
	theme: "light2", // "light1", "dark1", "dark2"
	animationEnabled: true,
	title: {
		text: "체지방량(kg)"
	},
	axisX: {
			valueFormatString : "####-##-##",
			titleFontWeight : "bold"
	},
	axisY: {
		title: "체지방량(kg)",
		suffix: "kg"
	},
	data: [{
		type: "line",
		dataPoints: dps
	}]
});
 
var xValue;
var yValue;
<c:forEach items="${dataPointsList}" var="dataPoints">	
		xValue = "${dataPoints.inDate}";
		var res = xValue.split("-");
		yValue =  parseInt("${dataPoints.inFat}");
		dps.push({
			x : parseInt(res[0]+res[1]+res[2]),
			y : yValue
		});			
			console.log(xValue);
			console.log(yValue);
		
</c:forEach> 
		console.log("dps : " + dps[1].x);
 
chart.render();
 
})

</script>
</html>