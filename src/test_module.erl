-module(test_module).

-export([client/2,send/2]).  

client(PortNo,Message) ->
    {ok,Sock} = gen_tcp:connect("localhost",PortNo,[{active,false},
                                                    {packet,2}]),


    gen_tcp:send(Sock,Message),
    %A = gen_tcp:recv(Sock,0),
    %gen_tcp:close(Sock),
    %A.
    {ok,Sock}.

 send(Sock,Message)->
    gen_tcp:send(Sock,Message).