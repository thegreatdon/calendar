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

<!--- <cfinclude template="mkeCal.cfm"> --->
<cfinclude template="compactcode.cfm">
<cfset thisYear="#ty#"><cfset thisMonth="#tm#">
<cfset weeks = "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday">
<cfset weekArr = #listToArray(weeks)#> 

<cfset tmon = "#thisYear#-#thisMonth#-01">
<cfoutput><h2>#dateFormat(tmon,'MMMM YYYY')#</h2></cfoutput>

<a href="index.cfm">back</a><br/>
<cfset grdRowDat = "">
<cfform name="tableform">
<cfgrid format="html" name="#thisMonth#grid" selectmode="cell" selectOnLoad="no" width="600">
<cfgridcolumn name="ind" header="ind" width="80" display="no">
<cfloop index="g" list="#weeks#">
<cfgridcolumn name="#trim(g)#" header="#trim(g)#" width="80">
</cfloop>
<cfloop index="w" list="#trim(monCal)#" delimiters="|">	
<cfset grdRowDat = "cfgridrowindex">
	<cfset darr = #listToArray(trim(w))#>
	<cfloop index="d" from="1" to="#arrayLen(darr)#" step="1">
	<cfset grdRowDat = "#listAppend(grdRowDat,dateFormat(trim(darr[d]),'mmm dd'))#">
	</cfloop>
	<cfgridrow data ="#grdRowDat#">
</cfloop>
 </cfgrid> 
</cfform>

</body>
</html>
