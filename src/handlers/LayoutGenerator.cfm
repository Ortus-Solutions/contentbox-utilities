<!-----------------------------------------------------------------------
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************
----------------------------------------------------------------------->

<cfset message 			= "" />
<cfset expandLocation	= data.event.ide.projectview.resource.xmlAttributes.path />
<cfset layoutName		= inputstruct.name />

<!--- Read in Module Config --->
<cffile action="read" file="#ExpandPath('../')#/templates/layout/layout.cfc" variable="layoutConfig">

<!--- Start Generation Replacing --->
<cfset layoutConfig = replaceNoCase(layoutConfig,"@title@",inputstruct.title,"all") />
<cfset layoutConfig = replaceNoCase(layoutConfig,"@author@",inputStruct.author,"all") />
<cfset layoutConfig = replaceNoCase(layoutConfig,"@authorURL@",inputStruct.authorURL,"all") />
<cfset layoutConfig = replaceNoCase(layoutConfig,"@description@",inputStruct.description,"all") />
<cfset layoutConfig = replaceNoCase(layoutConfig,"@version@",inputStruct.version,"all") />

<cftry>
	<!--- Copy layout template --->	
	<cfset controller.getUtility().directoryCopy("#ExpandPath('../')#/templates/layout/", expandLocation & "/#layoutName#")>
	<cfset fileDelete( expandLocation & "/#layoutName#/layout.cfc" )>
	<!--- Write Out the New Config --->
	<cfset fileWrite(expandLocation & "/#layoutName#/#layoutName#.cfc",layoutConfig)>
	<cfset message = "Generated new layout theme: #inputStruct.title# in your application"/>
	
	<cfcatch type="any">
		<cfset message = "There was problem creating the layout theme: #cfcatch.message# #cfcatch.detail#" />
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
			    <param key="filename" value="#expandLocation#/#layoutName#/#layoutName#.cfc" />
			</params>
		</command>
	</commands>
	<dialog width="550" height="350" title="ContentBox Layout Theme Wizard" image="includes/images/ContentBox_43.png"/>  
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

