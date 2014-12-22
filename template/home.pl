page(Index):-
	load_xml_file('pwp/home.pwp', Contents),
	pwp_xml(Contents, Index, []).