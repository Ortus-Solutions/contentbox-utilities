<!-----------------------------------------------------------------------
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************
----------------------------------------------------------------------->
<cfheader name="Content-Type" value="text/xml">  
<cfoutput>  
<response status="success" type="default">  
	<ide handlerfile="LayoutGenerator.cfm"> 
		<dialog width="650" height="450" title="ContentBox Layout Theme Wizard" image="includes/images/ContentBox_43.png">  
		
			<input name="Name" label="Name" required="true"  type="string" tooltip="Enter a web safe layout name (no spaces)" />
			<input name="Title" label="Title" required="true"  type="string" tooltip="The layout theme title" />
			<input name="Description" label="Description"  type="string" required="true" default="" tooltip="Enter the layout description" />
			<input name="Author" label="Author"  type="string" required="true" default="" tooltip="Enter Layout Author" />
			<input name="AuthorURL" label="Author Url"  type="string" required="true" default="http://" tooltip="Enter Layout Author website URL" />
			<input name="Version" label="Version"  type="string" required="true" default="1.0" tooltip="Enter Layout version" />
			<input name="ForgeBoxSlug" label="ForgeBox Slug"  type="string" default="" tooltip="Enter a ForgeBox Slug this layout represents" />
			
		</dialog>
	</ide>
</response>  
</cfoutput>

 