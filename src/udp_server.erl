-module(udp_server).

-export([start/1,stop/1]).


start(Port)->
case gen_udp:open(Port,[{active, true}]) of
	{ok, Socket}  ->
		io:format("udp connect ~p~n",[Socket]),
		receiver(Socket);
	{error, Reason} ->
		io:format("udp connect fail ~p~n",[Reason])
end.

receiver(Socket) ->
   inet:setopts(Socket, [{active, once}]), 
   receive
   	 {udp, Socket, Host, Port, Bin} ->  
            io:format("server received:~p~n",[Bin]),  
            gen_udp:send(Socket, Host, Port, <<"ok">>),  
            receiver(Socket); 
       stop -> true
   end.

stop({S,Pid}) ->
   gen_udp:close(S),
   Pid ! stop.   