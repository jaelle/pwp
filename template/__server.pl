:-use_module(library(http/thread_httpd)).
:-use_module(library(http/http_dispatch)).
:-use_module(library(http/http_pwp)).

user:file_search_path(pwp,'pwp').

% serve css and js directories
user:file_search_path(assets,'pwp/css').
user:file_search_path(assets,'pwp/js').

:- http_handler('/js', asset_handler, [prefix, priority(1)]).
:- http_handler('/css', asset_handler, [prefix, priority(1)]).
:- http_handler(/, default_handler, [prefix, priority(2)]).

server(Port):-

	% start server on specified Port
	http_server(http_dispatch, [port(Port)]).

default_handler(Request):-

	% Handle PWP
	reply_pwp_page('pwp/template.pwp',[pwp_module(true)],Request).
	
asset_handler(Request):-

	% file is not PWP
	memberchk(path(Path),Request),
	http_reply_file(assets(Path),[cache(true),unsafe(false)],Request).
