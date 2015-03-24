% include some libraries
:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_pwp)).

% setup a handler to tell prolog what to do when the user visits the root of the website
:- http_handler(/, default_handler, []).

% predicate to start the server
server(Port):-

	% start server on specified port
	http_server(http_dispatch, [port(Port)]).

% Used by http_handler to determine what to do when handling the HTTP request
default_handler(Request):-

	% display index.pwp
	reply_pwp_page('index.pwp',[],Request).