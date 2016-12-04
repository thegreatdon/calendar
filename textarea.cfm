<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Calendar</title><!--- border:1px solid red; height:100px;width:200px;--->
<style>
body{font-family:verdana;font-size:11px;}
</style>
</head>

<body>
<cfinclude template="mkeCal.cfm">
<cfset tmon = "#thisYear#-#thisMonth#-01">
<cfoutput><h2>#dateFormat(tmon,'MMMM YYYY')#</h2>
<a href="index.cfm">back</a><br/>


<cfloop index="w" list="#trim(monCal)#" delimiters="|">	
	<cfset darr = #listToArray(trim(w))#>
	<cfloop index="d" from="1" to="#arrayLen(darr)#" step="1">
	<cfset dat="#darr[d]#">
	<textarea id="#darr[d]#" cols="20" rows="5">#dateFormat(darr[d],'mmm dd')#<cfinclude template="datinf.cfm"></textarea>
	</cfloop><br/>
</cfloop>
</cfoutput>


</body>
</html>
