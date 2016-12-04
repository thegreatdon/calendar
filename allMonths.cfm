<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<cfparam name="dsp" default="table">
<a href="allMonths.cfm?dsp=table">table</a> | <a href="allMonths.cfm?dsp=cfpod">cfpod</a> | <a href="allMonths.cfm?dsp=grid">grid</a> | <a href="allMonths.cfm?dsp=textarea">textarea</a><br/>
<cfloop index="a" from="1" to="12" step="1">
<cfset thisMonth = "#a#">
<cfinclude template="#dsp#.cfm">
<!--- <cfinclude template="grid.cfm"> --->
</cfloop>


</body>
</html>
