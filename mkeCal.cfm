<cfparam name="thisMonth" default="#dateFormat(now(),'MM')#">
<cfparam name="thisYear" default="#dateFormat(now(),'YYYY')#">


<cfset dayAmt = "#DaysInMonth('#thisYear#-#thisMonth#')#">

<cfset sevRow = 0>
<cfset calRow = 1>
<cfset monCal = "">

<cfoutput>
<cfloop index="d" from="1" to="31" step="1">
<cfset thisDate = "#thisYear#-#thisMonth#-#d#">

<cfif #isDate(thisDate)#>
<cfset sevRow = #evaluate(sevRow+1)#>

	<cfset wrdDay = "#dateFormat(thisDate,'dddd')#">
	<cfset fullDay = "#dateFormat(thisDate,'yyyy-mm-dd')#">
	
	<!--- calculate days before sunday --->
	<cfif d eq 1 and wrdDay neq "Sunday">
		<cfset dayBack = #dayOfWeek(thisDate)#>
		<cfloop index="p" from="1" to="#evaluate(dayBack-1)#" step="1">
		<cfset sevRow = #evaluate(sevRow+1)#>
		 <cfset preDay = "#DateAdd('d',p,DateAdd('d',fullDay,-dayBack))#"><!--- 1:DateAdd('d',fullDay,-dayBack)= go back "dayBack" days; 2:DateAdd('d',p,[]) = add "p" days to previous date value; --->
		 <cfset preDay = "#dateFormat(preDay,'yyyy-mm-dd')#">
			<!--- add date to row --->
			<cfset monCal = "#listAppend(monCal,preDay)#">
		</cfloop>
	</cfif>
	
	<!--- add date to row --->
	<cfset monCal = "#listAppend(monCal,fullDay)#"> 
	
	<!--- calculate days after saturday --->
	<cfif d eq #dayAmt# and wrdDay neq "Saturday">
		<cfset dayFrwrd = #dayOfWeek(thisDate)#>
		<cfloop index="p" from="1" to="#evaluate(7-dayFrwrd)#" step="1">
		<cfset sevRow = #evaluate(sevRow+1)#>
			<cfset pstDay = "#DateAdd('d',p,fullDay)#">
			<cfset pstDay = "#dateFormat(pstDay,'yyyy-mm-dd')#">
			<!--- add date to row --->
			<cfset monCal = "#listAppend(monCal,pstDay)#">	
		</cfloop>
	</cfif>
	
	<!--- find row break --->
	<cfif #sevRow# eq "7">
		<cfset sevRow="0">
		<cfset calRow = #evaluate(calRow+1)#>
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