<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>ColdFusion Calendar</title><!--- border:1px solid red; height:100px;width:200px;--->
<style>
body{font-family:verdana;font-size:11px;}
</style>
</head>

<body>
<cfinclude template="mkeCal.cfm">


<cfoutput>#dayOfWeek('2014-10-05')#</cfoutput>

<a href="table.cfm">table</a> | <a href="cfpod.cfm">cfpod</a> | <a href="grid.cfm">grid</a> | <a href="textarea.cfm">textarea</a> | <a href="allmonths.cfm">year</a> 
<br/>

<cfoutput>
<cfloop index="w" list="#trim(monCal)#" delimiters="|">	
	<cfset darr = #listToArray(trim(w))#>
	<cfloop index="d" from="1" to="#arrayLen(darr)#" step="1">
	#trim(darr[d])#<cfif #d# lt #arrayLen(darr)#>,</cfif>
	</cfloop><br/>
</cfloop>
</cfoutput>


</body>
</html>
