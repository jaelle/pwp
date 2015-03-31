% include some libraries
:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_pwp)).

% setup a handler to tell prolog what to do when the user visits asset folders

user:file_search_path('assets','/css').
user:file_search_path('assets','/js').
user:file_search_path('assets','/images').

:- http_handler(assets(.), assets_handler, [prefix, priority(1)]).

% setup a handler to tell what prolog to do when the user visits anything under /
:- http_handler(/, default_handler, []).

% predicate to start the server
server(Port):-

	% start server on specified port
	http_server(http_dispatch, [port(Port)]).

assets_handler(Request):-

	% file is not PWP
	??memberchk(path(Path),Request),
	http_reply_file(assets(Path),[cache(true),unsafe(false)],Request).

% Used by http_handler to determine what to do when handling the HTTP request
default_handler(Request):-

	% display index.pwp
	reply_pwp_page('index.pwp',[],Request).