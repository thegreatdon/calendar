<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title><!--- border:1px solid red; height:100px;width:200px;--->
<style>
body{font-family:verdana;font-size:11px;}
</style>
</head>

<body>
<cfinclude template="mkeCal.cfm"> 
<cfset weeks = "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday">
<cfset weekArr = #listToArray(weeks)#> 

<cfset todNumDat = "#dateFormat(now(),'YYYY-MM-DD')#">

<cfset tmon = "#thisYear#-#thisMonth#-01">
<cfoutput><h2>#dateFormat(tmon,'MMMM YYYY')#</h2>
<a href="index.cfm">back</a><br/>


<table border="0" padding="0" margin="0">
<cfloop index="wd" list="#weeks#">
<th style="border-bottom:1px solid ##666;border-right:1px solid ##666;">#wd#</th>
</cfloop>
<cfloop index="w" list="#trim(monCal)#" delimiters="|">	
<tr>
	<cfset darr = #listToArray(trim(w))#>
	<cfloop index="d" from="1" to="#arrayLen(darr)#" step="1">
	
	<cfset tdsty="background-color:##fff;color:##000;border-color:##ccc;border-bottom:1px solid ##666;border-right:1px solid ##666;">
	<cfset pdhdsty = "color:##000;background-color:##ccc;">
	<cfif #darr[d]# eq #todNumDat#>
		<cfset pdhdsty = "color:red;background-color:##ccc;">
		<cfset tdsty="background-color:pink;color:red;font-weight:bold;border-color:##ccc;border-bottom:1px solid ##666;border-right:1px solid ##666;">
	</cfif>	
	<cfif #dateFormat(darr[d],'MM')# neq #thisMonth#>
		<cfset pdhdsty = "color:##fff;background-color:##ccc;">
		<cfset tdsty="background-color:##ccc;color:##fff;border-color:##ccc;border-bottom:1px solid ##666;border-right:1px solid ##666;">
	</cfif>
	<td align="center" style="#tdsty#">#ucase(dateFormat(trim(darr[d]),'MMM DD'))#</td>
	</cfloop>
</cfloop>
</tr>
</table>
</cfoutput>

</body>
</html>
