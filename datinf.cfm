<cfparam name="dat" default="">

<cfif #len(dat)#>
<!--- 
<cfgrid format="html" name="#dat#grid" selectmode="cell" selectOnLoad="no">
<cfgridcolumn name="Time" header="Time" width="80">
<cfloop index="h" from="9" to="17" step="1">
	<cfset thstim = "#h#:00">
	<cfgridrow data ="#timeFormat(thstim,'hh:00 tt')#">
</cfloop>
 </cfgrid> 
 --->

<cfoutput>
<cfloop index="h" from="9" to="17" step="1">
	<cfset thstim = "#h#:00">
<div style="font-size:11px;">#timeFormat(thstim,'hh:00 tt')#</div>
</cfloop>
</cfoutput>


</cfif>

