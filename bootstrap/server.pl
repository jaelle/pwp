:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_pwp)).


user:file_search_path(pwp,'pwp').

% serve css and js directories
user:file_search_path(css,'pwp/css').
user:file_search_path(js,'pwp/js').

:- http_handler(/, default_handler, [prefix]).

server(Port):-

	% start server on specified Port
	http_server(http_dispatch, [port(Port)]).


default_handler(Request):-

	% Handle PWP
	pwp_handler([path_alias(pwp),pwp_module(true)],Request).


default_handler(Request):-

	% file is not PWP
	http_handler(root(.),Request,[]).