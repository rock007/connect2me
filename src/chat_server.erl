-module(chat_server).
-behavior(gen_server).  
  
-export([init/1, code_change/3, handle_call/3, handle_cast/2, handle_info/2, terminate/2]).  
-export([accept_loop/1]).  
-export([start/3]).  
  
-define(TCP_OPTIONS, [binary, {packet, 0}, {active, false}, {reuseaddr, true}]).  
  
-record(server_state, {port,loop,client_msg, lsocket=0}).

-record(client_info,{socket,name,server,aid,session }).

start(Name, Port, Loop) ->  
    State = #server_state{port = Port, loop = Loop},  
    gen_server:start_link({local, Name}, ?MODULE, State, []).  
  
init(State = #server_state{port=Port}) ->  
    case gen_tcp:listen(Port, ?TCP_OPTIONS) of  
        {ok, LSocket} ->  
            ets:new(client_info,[public,ordered_set,named_table,
            {keypos,#client_info.socket}]),
            NewState = State#server_state{lsocket = LSocket,client_msg=client_info},  
            {ok, accept(NewState)}; %% #state() 
        {error, Reason} ->  
            {stop, Reason}  
    end.  
  
handle_cast({accepted, _Pid,client_info}, State=#server_state{}) ->  
    {noreply, accept(State)}.
  
accept_loop({Server,LSocket, {M, F},client_info}) ->  
   %% {ok,Socket} ->
    case gen_tcp:accept(LSocket) of
        {ok,Socket} ->
            ets:insert(client_info,#client_info{socket=Socket}),
            gen_server:cast(Server,{accepted,self(),client_info}),
            M:F(Socket,client_info)
            
end.
 
accept(State =#server_state{lsocket=LSocket, loop = Loop,client_msg=client_info}) ->  
    proc_lib:spawn(?MODULE, accept_loop, [{self(), LSocket, Loop,client_info}]),  
    State.
  
handle_call(_Msg, _Caller, State) -> 
    {noreply, State}. 

handle_info(_Msg, Library) -> 
    {noreply, Library}.

terminate(_Reason, _Library) -> 
    ok.

code_change(_OldVersion, Library, _Extra) -> 
    {ok, Library}.     
     
