:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_pwp)).



:- ensure_loaded(debug).

user:file_search_path(pwp_root,'pwp').

:- http_handler('/js', assets_handler, [prefix, priority(1)]).
:- http_handler('/css', assets_handler, [prefix, priority(1)]).
:- http_handler('/favicon.ico', favicon_handler, [priority(1)]).
:- http_handler(/, default_handler, [prefix, priority(2)]).

server(Port):-

	% start server on specified Port
	http_server(http_dispatch, [port(Port)]).


default_handler(Request):-

	% Handle PWP
	reply_pwp_page(pwp_root('index.pwp'),[pwp_module(true)],Request).
	
assets_handler(Request):-

	% file is not PWP
	memberchk(path(Path),Request),
	http_reply_file(pwp_root(Path),[cache(true),unsafe(false)],Request).
	
favicon_handler(Request):-

	http_404([],Request).