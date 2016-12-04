<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title><!--- border:1px solid red; height:100px;width:200px;--->
<style>
body{font-family:verdana;font-size:11px;}
</style>
</head>

<body>
<cfajaximport tags="cftooltip, cfwindow, cfpod, cfgrid, cfform, cfdiv, cftextarea, cflayout-tab, cftree, cfinput-datefield">
<cfinclude template="mkeCal.cfm"> 
<cfset weeks = "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday">
<cfset todNumDat = "#dateFormat(now(),'YYYY-MM-DD')#">
<cfset weekArr = #listToArray(weeks)#> 

<cfset tmon = "#thisYear#-#thisMonth#-01">
<cfoutput><h2>#dateFormat(tmon,'MMMM YYYY')#</h2>
<a href="index.cfm">back</a><br/>


<table border="0">
<cfloop index="wd" list="#weeks#">
<th>#wd#</th>
</cfloop>
<cfloop index="w" list="#trim(monCal)#" delimiters="|">	
<tr>
	<cfset darr = #listToArray(trim(w))#>
	<cfloop index="d" from="1" to="#arrayLen(darr)#" step="1">
	
	<cfset tdsty="background-color:##fff;color:##000;border-color:##ccc;">
	<cfset pdhdsty = "color:##000;background-color:##ccc;">
	<cfif #darr[d]# eq #todNumDat#>
		<cfset pdhdsty = "color:red;background-color:##ccc;">
		<cfset tdsty="background-color:pink;color:red;font-weight:bold;border-color:##ccc">
	</cfif>	
	<cfif #dateFormat(darr[d],'MM')# neq #thisMonth#>
		<cfset pdhdsty = "color:##fff;background-color:##ccc;">
		<cfset tdsty="background-color:##ccc;color:##fff;border-color:##ccc;overflow:hidden;">
	</cfif>
	<td align="center"><cfpod title="#ucase(dateFormat(trim(darr[d]),'MMM DD'))#" width="120" height="70" headerstyle="#pdhdsty#" bodystyle="#tdsty#" source="datinf.cfm?dat=#trim(darr[d])#"/></td>
	</cfloop>
</cfloop>
</tr>
</table>
</cfoutput>

</body>
</html>
