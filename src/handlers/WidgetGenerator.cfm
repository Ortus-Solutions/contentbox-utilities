<!-----------------------------------------------------------------------
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************
----------------------------------------------------------------------->

<!--- set widget properties default values --->
<cfset defaultDescription 	= "I am new Widget" />
<cfset defaultAuthor		= "" />
<cfset defaultAuthorURL		= "" />
<cfset defaultVersion		= "1.0" />
<cfset defaultCache			= "true" />
<cfset defaultCacheTimeout	= "" />
<cfset message 				= "" />
<cfset expandLocation		= data.event.ide.projectview.resource.xmlAttributes.path />
<cfset widgetName			= inputstruct.Name />
<cfset scriptPrefix 		= "">
<!--- Script? --->
<cfif inputStruct.Script>
	<cfset scriptPrefix = "Script">
</cfif>
		
<cffile action="read" file="#ExpandPath('../')#/templates/WidgetContent#scriptPrefix#.txt" variable="widgetContent">

<!--- Start Replacings --->
<cfset widgetContent = replaceNoCase(widgetContent,"|widgetName|",widgetName,"all") />

<cfif len(inputstruct.Version)>
	<cfset widgetContent = replaceNoCase(widgetContent,"|widgetVersion|",inputstruct.Version,"all") />
<cfelse>
	<cfset widgetContent = replaceNoCase(widgetContent,"|widgetVersion|",defaultVersion,"all") />	
</cfif>

<cfif len(inputstruct.Description)>
	<cfset widgetContent = replaceNoCase(widgetContent,"|widgetDescription|",inputstruct.Description,"all") />
<cfelse>
	<cfset widgetContent = replaceNoCase(widgetContent,"|widgetDescription|",defaultDescription,"all") />	
</cfif>


<cfif len(inputstruct.Author)>
	<cfset widgetContent = replaceNoCase(widgetContent,"|widgetAuthor|",inputstruct.Author,"all") />
<cfelse>
	<cfset widgetContent = replaceNoCase(widgetContent,"|widgetAuthor|",defaultAuthor,"all") />	
</cfif>

<cfif len(inputstruct.AuthorURL)>
	<cfset widgetContent = replaceNoCase(widgetContent,"|widgetAuthorURL|",inputstruct.AuthorURL,"all") />
<cfelse>
	<cfset widgetContent = replaceNoCase(widgetContent,"|widgetAuthorURL|",defaultAuthorURL,"all") />	
</cfif>

<cfswitch expression="#inputStruct.Persistence#">
	<cfcase value="Transient">
		<cfset persistence = "">
	</cfcase>
	<cfcase value="Time Persisted">
		<cfset persistence = 'cache="true" cacheTimeout="#inputStruct.CacheTimeout#"'>
	</cfcase>
	<cfcase value="Singleton">
		<cfset persistence = 'singleton'>
	</cfcase>
</cfswitch>

<!--- Persistence Update --->
<cfset widgetContent = replaceNoCase(widgetContent,"|widgetPersistence|",persistence) />

<cftry>
	<cffile action="write" file="#expandLocation#/#widgetName#.cfc" mode ="777" output="#widgetContent#">
	<cfset message = widgetName & ".cfc Generated new widget" />
	
	<cfcatch type="any">
		<cfset message = "There was problem creating widget: #cfcatch.message#" />
	</cfcatch>
</cftry>

<cfheader name="Content-Type" value="text/xml">  
<cfoutput>
<response status="success" showresponse="true">  
<ide>  
	<commands>
		<command type="RefreshProject">
			<params>
			    <param key="projectname" value="#data.event.ide.projectview.xmlAttributes.projectname#" />
			</params>
		</command>
		<command type="openfile">
			<params>
			    <param key="filename" value="#expandLocation#/#widgetName#.cfc" />
			</params>
		</command>
	</commands>
	<dialog width="550" height="350" title="ContentBox Widget Wizard" image="includes/images/ContentBox_43.png"/>  
	<body>
	<![CDATA[
	<html>
		<head>
			<base href="#controller.getBaseURL()#" />
			<link href="includes/css/styles.css" type="text/css" rel="stylesheet">
			<script type="text/javascript" src="includes/js/jquery.latest.min.js"></script>
		</head>
		<body>
			<div class="messagebox-green">#message#</div>
		</body>
	</html>	
	]]>
	</body>
</ide>
</response>
</cfoutput>

