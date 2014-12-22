% nav(Id,ParentId,Title,Link)

hello("World").

nav([
	link("Home","/index.pwp",""),
	link("About","/about.pwp",
		nav([
			link("Mission","/mission.pwp")])),
	link("Contact","/contact.pwp","")]).