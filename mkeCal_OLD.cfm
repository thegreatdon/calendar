<cfparam name="thisMonth" default="#dateFormat(now(),'MM')#">
<cfset thisYear = #dateFormat(now(),'YYYY')#>
<cfset thisDay = #dateFormat(now(),'D')#>

<cfset dayAmt = "#DaysInMonth('#thisYear#-#thisMonth#')#">

<cfset todNumDat = "#dateFormat(now(),'YYYY-MM-DD')#">

<cfset weeks = "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday">
<cfset weekArr = #listToArray(weeks)#>


<cfoutput>
<cfset sevRow = 0>
<cfset calRow = 1>

<cfset thsCalRow = "">
<cfsavecontent variable="monCal">
<cfloop index="d" from="1" to="31" step="1">
<cfset thsCalCell = "">
<cfset sevRow = #evaluate(sevRow+1)#>
<cfset thisDate = "#thisYear#-#thisMonth#-#d#">
<cfif #isDate(thisDate)#>
<cfset numDay = "#d#">
<cfset wrdDay = "#dateFormat(thisDate,'dddd')#">
<cfset fullDay = "#dateFormat(thisDate,'yyyy-mm-dd')#">
<!--- calculate days ahead of sunday --->
<cfif d eq 1 and wrdDay neq "Sunday">
	<cfloop index="w" from="1" to="#arrayLen(weekArr)#" step="1">
		<cfif #weekArr[w]# eq "#wrdDay#">
			<cfset dayBack = "#w#">
		</cfif>
	</cfloop>
	<cfset preLoop = "#evaluate(dayBack-1)#">
	<cfloop index="p" from="1" to="#preLoop#" step="1">
	<cfset sevRow = #evaluate(sevRow+1)#>
	<cfset dayCnt = "#evaluate(dayBack-p)#">
	<cfset p = "-#dayCnt#">
		<cfset preDay = "#DateAdd('d',p,thisDate)#">
		<cfset preDay = "#dateFormat(preDay,'yyyy-mm-dd')#">
	#preDay#~
<!--- 	<cfset thsCalCell = "#listAppend(thsCalCell,preDay,'~')#"> --->
	</cfloop>
</cfif>
#fullDay#~
<!--- <cfset thsCalCell = "#listAppend(thsCalCell,fullDay,'~')#"> --->
<!--- calculate days after saturday --->
<cfif d eq #dayAmt# and wrdDay neq "Saturday">
	<cfloop index="x" from="1" to="#arrayLen(weekArr)#" step="1">
		<cfif #weekArr[x]# eq "#wrdDay#">
			<cfset dayFrwrd = "#x#">
		</cfif>
	</cfloop>
	<cfset pstLoop = "#evaluate(7-dayFrwrd)#">
	<cfloop index="p" from="1" to="#pstLoop#" step="1">
	<cfset sevRow = #evaluate(sevRow+1)#>
		<cfset pstDay = "#DateAdd('d',p,thisDate)#">
		<cfset pstDay = "#dateFormat(pstDay,'yyyy-mm-dd')#">
	#pstDay#~
<!--- 	<cfset thsCalCell = "#listAppend(thsCalCell,pstDay,'~')#"> --->
	</cfloop>
</cfif>
<cfif #sevRow# eq "7">|
	<cfset sevRow="0"><cfset calRow = #evaluate(calRow+1)#>
<!--- 	<cfset thsCalRow = "#listAppend(thsCalRow,thsCalCell,'|')#"> --->
</cfif>
</cfif>
</cfloop>
</cfsavecontent>
</cfoutput>
