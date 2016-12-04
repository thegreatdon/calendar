<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<cfparam name="thisMonth" default="#dateFormat(now(),'MM')#">
<cfparam name="thisYear" default="#dateFormat(now(),'YYYY')#">
<cfparam name="thisDay" default="#dateFormat(now(),'DD')#">
<html>
<head>
	<title>Untitled</title>
<script src="/jquery/jquery-1.9.1.min.js"></script>

<script>

$(document).ready(function(){
var weekDays = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
var fullMonth = ['January','February','March','April','May','June','July','August','September','October','November','December'];

	doCal = function(m,y,d){
		var cfcal = "cfcal.cfm?thisMonth="+m+"&thisYear="+y+"&thisDay="+d;
		$("#caldiv").load(cfcal);
		$("#caldiv").slideDown();
	}
	
	clkDay = function(d){
		$("#datinp").val(d);
		var datarr = d.split("-");
	
		var monVal = datarr[1] * 1;
			monVal -=1;
		var monDsp = fullMonth[monVal];
		
		var spnval = monDsp + " " + datarr[2] + ", "+ datarr[0];
		
		$("#calspn").html(spnval);
		$("#datdsp").val(spnval)
		$("#caldiv").slideUp();
	}
	
	$("#calspn").click(function(){ 
		var getMonYer = $("#datinp").val();
		monYerArr = getMonYer.split("-");
		doCal(monYerArr[1],monYerArr[0],monYerArr[2]);
	});
	
});
</script>
<!--- <cfoutput>
<script>
$(window).load(function(){
	$("#datinp").focus(function(){  
	
	});	
});
</script>
</cfoutput> --->
<style type="text/css">
#caldiv{width:400px;display:none;}
#calspn{border:1px solid #ccc;}
</style>
</head>

<body>
<form>
	<cfoutput><!---  onclick="doCal('#thisMonth#','#thisYear#');" --->
	<span id="calspn" name="calspn">Choose Date</span>
	<div id="caldiv" name="caldiv"></div>
	<input type="text" name="datinp" id="datinp" value="#thisYear#-#thisMonth#-#thisDay#" disabled>
	</cfoutput>
</form>



</body>
</html>
