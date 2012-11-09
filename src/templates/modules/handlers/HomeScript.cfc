/**
* A ContentBox Module Handler
*/
component{

	function index(event,rc,prc){
		// Activate my module entry tab, the name of the tab is the name of the menu contribution
		// prc.tabModules_@title@ = true;
		
		// View to render
		event.setView("home/index");
	}

}