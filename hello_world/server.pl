:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_pwp)).


user:file_search_path(pwp,'pwp').
:- http_handler(/, default_handler, [prefix]).

server(Port):-

	% start server on specified Port
	http_server(http_dispatch, [port(Port)]).
	
default_handler(Request):-

	% Handle PWP
	pwp_handler([path_alias(pwp)],Request).