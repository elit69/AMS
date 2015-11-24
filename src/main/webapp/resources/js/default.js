$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});
var domainname = window.location.origin+"/ArticleManagement/";	//for development
//var domainname = window.location.origin+"/";					//for deploy
