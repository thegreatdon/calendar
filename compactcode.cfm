<cfparam name="tm" default="#dateFormat(now(),'MM')#">
<cfparam name="ty" default="#dateFormat(now(),'YYYY')#">

<cfset datFrm = "yyyy-mm-dd">

<cfset sevRow = 0>
<cfset monCal = "">

<cfloop index="d" from="1" to="31" step="1">
<cfset thisDate = "#ty#-#tm#-#d#">

<cfif #isDate(thisDate)#>
<cfset sevRow = #evaluate(sevRow+1)#>
	
	<!--- calculate days before sunday --->
	<cfif d eq 1 and #dateFormat(thisDate,'dddd')# neq "Sunday">
		<cfloop index="p" from="1" to="#evaluate(dayOfWeek(thisDate)-1)#" step="1">
		<cfset sevRow = #evaluate(sevRow+1)#>
			<cfset monCal = "#listAppend(monCal,dateFormat(DateAdd('d',p,DateAdd('d',thisDate,-dayOfWeek(thisDate))),'#datFrm#'))#">
		</cfloop>
	</cfif>
	
	<!--- add date to row --->
	<cfset monCal = "#listAppend(monCal,dateFormat(thisDate,'#datFrm#'))#"> 
	
	<!--- calculate days after saturday --->
	<cfif d eq #DaysInMonth('#ty#-#tm#')# and #dateFormat(thisDate,'dddd')# neq "Saturday">
		<cfloop index="p" from="1" to="#evaluate(7-dayOfWeek(thisDate))#" step="1">
		<cfset sevRow = #evaluate(sevRow+1)#>
			<cfset monCal = "#listAppend(monCal,dateFormat(DateAdd('d',p,thisDate),'#datFrm#'))#">	
		</cfloop>
	</cfif>
	
	<!--- find row break --->
	<cfif #sevRow# eq "7">
		<cfset sevRow="0">
		<!--- add row break --->
		<cfset monCal = "#listAppend(monCal,'|')#">	
	</cfif>
</cfif>
</cfloop>

<cfoutput>
<cfloop index="y" list="#monCal#" delimiters="|">
	<cfset colLst = "#listToArray(y)#">
	<cfloop index="x" from="1" to="#arrayLen(colLst)#" step="1">
	#colLst[x]# |
	</cfloop><br/>
</cfloop>
</cfoutput>
