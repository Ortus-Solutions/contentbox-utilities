<cfoutput>

	<!--- ContentBoxEvent --->
	#cb.event("cbui_prePageDisplay")#
	
	<!--- search Results --->
	<div>
		<h1>Search Results</h1>
		
		<!--- Search Form --->
		#html.startForm(name="searchForm",action=cb.linkContentSearch())#
			#html.textField(name="q",size="55",value=cb.getSearchTerm())#
			#html.submitButton(name="searchSubmitButton",value="Search")#
		#html.endForm()#
		
		<!--- Search Results --->
		#cb.getSearchResultsContent()#
		
		<!--- Search paging --->
		#cb.quickSearchPaging()#		
	</div>
		
	<!--- ContentBoxEvent --->
	#cb.event("cbui_postPageDisplay")#
	
</cfoutput>