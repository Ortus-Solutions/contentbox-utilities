<!-----------------------------------------------------------------------
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************
----------------------------------------------------------------------->
<cfheader name="Content-Type" value="text/xml">  
<cfoutput>  
<response status="success" type="default">  
	<ide handlerfile="WidgetGenerator.cfm"> 
		<dialog width="700" height="550" title="ContentBox Wiget Wizard" image="includes/images/ContentBox_43.png">  
			<input name="Name" label="Widget Name" required="true"  type="string" default="" tooltip="Enter widget cfc name without .cfc" />
			<input name="Script" label="Script Based CFC" type="boolean" checked="true" tooltip="Choose whether to create the cfc in pure script or not." />
			<input name="Version" label="Version"  type="string" default="1.0" tooltip="Enter widget version" />
			<input name="Description" label="Description"  type="string" default="" tooltip="Enter widget description" />
			<input name="Author" label="Author"  type="string" default="" tooltip="Enter widget Author" />
			<input name="AuthorURL" label="Author Url"  type="string" default="" tooltip="Enter widget Author website URL" />
			
			<input name="Persistence" label="Persistence Type" type="list" default="Singleton">
				<option value="Transient" />
				<option value="Time Persisted" />
				<option value="Singleton" />
			</input>	
			<input name="CacheTimeout" label="Timeout (Time Persisted Only)" type="string" default="" pattern="[0-9]+"
			       errormessage="Numeric values only."
				   helpmessage="Minutes to persist if using Time Persisted type."
				   tooltip="Minutes to persist if using Time Persisted type."/>
		</dialog>
	</ide>
</response>  
</cfoutput>

 