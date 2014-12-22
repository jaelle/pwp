details(1,"First item","Some very interesting details").
details(2,"Second item","Less interesting details").
details(3,"Third item","An interesting detail").

request([id=AtomId],Id):-
	catch(
		atom_number(AtomId,Id),
		_E,
		fail).