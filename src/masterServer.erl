-module(masterServer).

-include("include/common.hrl").

-export([start/2,server/1]).

%%连接服务器
start(Num,LPort) ->
    case gen_tcp:listen(LPort,[{active, false},{packet,2}]) of
        {ok, ListenSock} ->
            io:format(" debug info ~w ~n",[1]),
            start_servers(Num,ListenSock),
            io:format(" debug info ~w ~n",[11]),
            {ok, Port} = inet:port(ListenSock),
            io:format(" debug info ~w ~n",[ListenSock]),
            Port;
        {error,Reason} ->
            io:format(" debug info ~w ~n",[2]),
            {error,Reason}
    end.

start_servers(0,_) ->
    ok;
start_servers(Num,LS) ->
    io:format("start_servers debug info ~w [~w]  ~n",[Num,LS]),
    io:format("start_servers debug info ~w   ~n",[?MODULE]),
    Pid = spawn(?MODULE,server,[LS]),
    io:format("start_servers debug info Pid ~w   ~n",[Pid]),
    start_servers(Num-1,LS).

server(LS) ->
    io:format("server debug info ~w  ~n",[3]),
    case gen_tcp:accept(LS) of
        {ok,S} ->
            io:format(" gen_tcp:accept  ~w closed [~w]~n",[S,self()]),
            loop(S),
            server(LS);
        Other ->
            io:format("accept returned ~w - goodbye!~n",[Other]),
            ok
    end.

loop(S) ->
    inet:setopts(S,[{active,once}]),
    receive
        {tcp,S,Data} ->
            Answer = process(Data), % Not implemented in this example
            gen_tcp:send(S,Answer),
            %%gen_tcp:send(S, ["message text我们",0]),%%"message text\0"
            loop(S);
      
        {tcp_closed,S} ->
            io:format("Socket ~w closed [~w]~n",[S,self()]),
            ok

    end.

 process(Data)->
 	io:format("~s answer is returned ~w - goodbye!~n",[Data,ok]),
    "ok\0".
 	