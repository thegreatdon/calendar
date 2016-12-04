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


<cfset monCal = "">
<!--- <cfsavecontent variable="monCal"> --->
<cfloop index="d" from="1" to="31" step="1">

<cfset sevRow = #evaluate(sevRow+1)#>
<cfset thisDate = "#thisYear#-#thisMonth#-#d#">
<cfif #isDate(thisDate)#>
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
			<!--- add date to row --->
			<cfset monCal = "#listAppend(monCal,preDay)#">
		</cfloop>
	</cfif>
	
	<!--- add date to row --->
	<cfset monCal = "#listAppend(monCal,fullDay)#"> 
	
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
			<!--- add date to row --->
			<cfset monCal = "#listAppend(monCal,pstDay)#">	
		</cfloop>
	</cfif>
	
	<!--- find row break --->
	<cfif #sevRow# eq "7">
		<cfset sevRow="0"><cfset calRow = #evaluate(calRow+1)#>
		<!--- add row break --->
		<cfset monCal = "#listAppend(monCal,'|')#">	
	</cfif>
</cfif>
</cfloop>
</cfoutput>
<!--- 
<cfoutput>
<cfloop index="y" list="#monCal#" delimiters="|">
	<cfset colLst = "#listToArray(y)#">
	<cfloop index="x" from="1" to="#arrayLen(colLst)#" step="1">
	#colLst[x]# |
	</cfloop><br/>
</cfloop>
</cfoutput>
 --->