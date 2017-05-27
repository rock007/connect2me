%%%-------------------------------------------------------------------
%% @doc connect2me top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(connect2me_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
	io:format("init oooooo",[]),
	%%lager:warning("Some message with a term: ~p", ["loog"]),
	%%masterServer:start(3,10022),
	tcp_server:start(10023),
	io:format("tcp_server:start at 10023",[]),
	udp_server:start(10024),
	io:format("udp_server:start at 10024",[]),
    {ok, { {one_for_all, 0, 1}, []} }.

%%====================================================================
%% Internal functions
%%====================================================================
