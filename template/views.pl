view('/',"pwp/home.pwp").
view('/about',"pwp/about.pwp").

nav("pwp/nav.pwp").

display_nav(Nav):-
	nav(NavTemplate),
	load_view(NavTemplate,Nav).

display_view(ScriptName,View):-
	
	view(ScriptName,Template),
	load_view(Template,View).

load_view(Template,View):-
	load_xml_file(Template, Contents),
	pwp_xml(Contents, View, []).