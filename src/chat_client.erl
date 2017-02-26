-module(chat_client).     
-export([start/0,loop/2]).  

-record(client_info,{socket,name,server,aid,session }).

start() ->  
    chat_server:start(?MODULE, 2000, {?MODULE, loop}).

loop(Socket,client_info) ->
 
  inet:setopts(Socket,[{active,once}]),

   case gen_tcp:recv(Socket,0) of
      {ok,Data} ->
           Tab = ets:tab2list(client_info),
           %lager:info("Tab message: ~s ~n",[Tab]),
           io:format("receive message :~p ~n",[Data]),
           %%spawn(fun() -> gen_tcp:send(Socket,"wellcome ") end),
           
           %%SendData = fun({_key,Sockets}) ->gen_tcp:send(Sockets,Data) end,
           %%lists:foreach(SendData,Tab),
           
           %% 对接收到的json消息进行解析
           %%!!!{struct,[AtomMsg]}=json:decode(Data),
           %%!!ListMsg = tuple_to_list(AtomMsg),
           %%TypCaht = lists:nth(1,ListMsg),
           %% function_message 对消息进行处理
           %%!!function_message(TypCaht,AtomMsg,client_info),
          %% io:format("~p~n",[Data]),
           %%io:format("~p~n",[TypCaht]),
           loop(Socket,client_info); 
      {error, closed} ->  
           Tab = ets:tab2list(client_info), 
           Time = erlang:now(),
           Times = calendar:now_to_universal_time(Time),
           %% ??向所有在线玩家发送离开的消息
           %%SendLeaveMsg = fun({_key,Sockets}) ->gen_tcp:send(Sockets,"closed") end,
           %%lists:foreach(SendLeaveMsg,Tab),
           %%gen_tcp:send(Sockets,"closed"),
           io:format("~p~n closed",[Socket])
           %%loop(Socket,client_info) 

          
end.
    
    function_message(TypCaht,AtomMsg,client_info) ->
      case TypCaht of
        <<"login">> ->
              io:format("~p~n",[login]),
              {struct,
                [{Server,Server_msg},
                  {Session,Session_msg},
                  {Aid,Aid_msg},
                  {Name,Name_mag}
                ]
              }= AtomMsg,

              ets:insert(client_info,
                #client_info{name=Name_mag,server=Server_msg,aid=Aid_msg,session=Server_msg}),
              io:format("~p~n",[Name]),
              io:format("~p~n",[Aid]);


        <<"message">> ->
              io:format("~p~n",[message])
      end.
%%