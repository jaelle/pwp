:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_pwp)).


user:file_search_path(pwp,'pwp').
:- http_handler(/, default_handler, []).

server(Port):-

	% start server on specified Port
	http_server(http_dispatch, [port(Port)]).
	
default_handler(Request):-

	reply_pwp_page('pwp/index.pwp',[pwp_module(true)],Request).