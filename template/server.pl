:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_pwp)).
:-use_module(library(http/http_parameters)).

:- ensure_loaded(details).

user:file_search_path(pwp,'pwp').
:- http_handler('/', default_handler, [prefix]).
:- http_handler('/details', default_handler, [prefix]).

server(Port):-

	% start server on specified Port
	http_server(http_dispatch, [port(Port)]).

	
default_handler(Request):-
	
	% Handle PWP and Parameters
		
	catch(
		http_parameters(Request,
			[
			detail_id(_Id, [integer])
			]),
		_E,
		fail
	),	
	
	reply_pwp_page('pwp/template.pwp',[pwp_module(true)],Request).
	

default_handler(Request):-

	reply_pwp_page('pwp/template.pwp',[pwp_module(true)],Request).