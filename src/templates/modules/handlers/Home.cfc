<cfcomponent output="false" hint="A ContentBox Module Handler">

	<!--- index --->
    <cffunction name="index" output="false" hint="Index">
    	<cfargument name="event">
		<cfargument name="rc">
		<cfargument name="prc">
	
		<!--- Activate my module entry tab, the name of the tab is the name of the menu contribution --->
		<!--- <cfset prc.tabModules_@title@ = true> --->

		<!---Set View to Render --->
    	<cfset event.setView("home/index")>
    </cffunction>

</cfcomponent>