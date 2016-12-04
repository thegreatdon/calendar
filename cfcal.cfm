<cfinclude template="mkeCal.cfm"> 

<cfset weeks = "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday">
<cfset weekArr = #listToArray(weeks)#> 

<cfset todNumDat = "#dateFormat(now(),'YYYY-MM-DD')#">

<cfset tmon = "#thisYear#-#thisMonth#-01">

<cfset prvMon = #evaluate(thisMonth-1)#>
<cfset prvYer = #thisYear#>
	<cfif #prvMon# eq "0">
<!--- 		<cfset thisMonth = 1>
		<cfset thisYear = #evaluate(thisYear-1)#> --->
		<cfset prvMon = 12>
		<cfset prvYer = #evaluate(thisYear-1)#>
	</cfif> 

<cfset nxtMon = #evaluate(thisMonth+1)#>
<cfset nxtYer = #thisYear#>
	<cfif #nxtMon# eq "13">
<!--- 		<cfset thisMonth  = 1>
		<cfset thisYear = #evaluate(thisYear+1)#> --->
		<cfset nxtMon = 1>
		<cfset nxtYer =  #evaluate(thisYear+1)#> 
	</cfif>
		
<script src="/jquery/jquery-1.9.1.min.js"></script>
<script>
$(document).ready(function(){

	$(".calcell").click(function(){ 
	$(".calcell").css("font-weight","normal").css("font-size","14px");
	$(this).css("font-weight","bold").css("font-size","12px");
	});		

	
});
</script>
<cfoutput>
<cfparam name="thisDay" default="#dateFormat(now(),'DD')#">
<cfparam name="clkDay" default="#thisYear#-#thisMonth#-#thisDay#">
<table border="0" padding="0" margin="0" width="100%" id="caltab" name="caltab">
<tr>
	<td style="cursor:pointer;" onclick="doCal('#prvMon#','#prvYer#');">&laquo;</td>
	<td colspan="5"></td>
	<td style="cursor:pointer;" align="right" onclick="doCal('#nxtMon#','#nxtYer#');">&raquo;</td>
</tr>
<tr>
	<td colspan="7">#dateFormat(tmon,'MMMM YYYY')#</td>
</tr>
<cfloop index="wd" list="#weeks#">
<th style="border-bottom:1px solid ##666;border-right:1px solid ##666;">#left(wd,3)#</th>
</cfloop>
<cfloop index="w" list="#trim(monCal)#" delimiters="|">	
<tr>
	<cfset darr = #listToArray(trim(w))#>
	<cfloop index="d" from="1" to="#arrayLen(darr)#" step="1">
	
	<cfset tdsty="cursor:pointer;background-color:##fff;color:##000;border-color:##ccc;border-bottom:1px solid ##666;border-right:1px solid ##666;font-size:14px;">
	<cfset pdhdsty = "color:##000;background-color:##ccc;">
	<cfif #darr[d]# eq #todNumDat#>
		<cfset pdhdsty = "color:red;background-color:##ccc;">
		<cfset tdsty="cursor:pointer;background-color:pink;color:red;font-weight:bold;border-color:##ccc;border-bottom:1px solid ##666;border-right:1px solid ##666;font-size:14px;">
	</cfif>	
	<cfif #dateFormat(darr[d],'MM')# neq #thisMonth#>
		<cfset pdhdsty = "color:##fff;background-color:##ccc;">
		<cfset tdsty="cursor:pointer;background-color:##ccc;color:##fff;border-color:##ccc;border-bottom:1px solid ##666;border-right:1px solid ##666;font-size:14px;">
	</cfif>
	<cfif #clkDay# eq #trim(darr[d])#>
		<cfset tdsty = "font-size:12px;font-weight:bold;color:red;">
	</cfif>
	<td align="center" style="#tdsty#" id="#trim(darr[d])#" class="calcell" onclick="clkDay('#trim(darr[d])#');"><!--- #ucase(dateFormat(trim(darr[d]),'MMM DD'))# --->#dateFormat(trim(darr[d]),'DD')#</td>
	</cfloop>
</cfloop>
</tr>
</table>
</cfoutput>