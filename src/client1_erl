%%client conn
-module(client1).

-export([client/2,client2/0]).

-define( UINT, 32/unsigned-little-integer).

-define( INT, 32/signed-little-integer).

-define( USHORT, 16/unsigned-little-integer).

-define( SHORT, 16/signed-little-integer).

-define( UBYTE, 8/unsigned-little-integer).

-define( BYTE, 8/signed-little-integer).

client(PortNo,Message) ->
    {ok,Sock} = gen_tcp:connect("localhost",PortNo,[{active,false},binary,
                                                    {packet,2}]),
    gen_tcp:send(Sock,Message),
    A = gen_tcp:recv(Sock,0),
    
    gen_tcp:close(Sock),
    A.



client2() ->
    {ok,Sock} = gen_tcp:connect("127.0.0.1",10013,[{active,false},binary]),

    case gen_tcp:recv(Sock,0) of
    	{ok,<<HeaderLength:?INT,ClientVersion:?INT,1:?INT,Seq:?INT,Ticket/binary>>} ->
    		%%登录
    		send(Sock,56,1,1,bytes[36],<<"aaaaaa1,11111-2222--3333">>);
    	{ok,<<HeaderLength:?INT,ClientVersion:?INT,6:?INT,Seq:?INT,Ticket/binary>>} ->
    		%%心跳	
            io:format("~nreceive heartbeat~n");  
    	{error, closed} ->
    		io:format("~nsocket closed~n")	
    end,
	loop(Sock).


 loop(Sock)->
 	sleep(1000*60*3),
 	send(Sock,56,1,1,bytes[36],<<"aaaaaa1,11111-2222--3333">>).

sleep(T) ->
    receive
    after T -> true
    end.


code() ->

{ok,Sock} = gen_tcp:connect("219.138.150.224",10013,[{active,false},binary]),
A = gen_tcp:recv(Sock,0),
{ok,<<HeaderLen:32/integer-big,ClientVer:32/integer-big,CmdId:32/integer-big,Seq:32/integer-big,Ticket:36/bytes,BodyLen:32/integer-big,Body/bytes>>}=A.

{ok,<<HeaderLen1:32/integer-big,ClientVer1:32/integer-big,CmdId1:32/integer-big,Seq1:32/integer-big,Ticket1:36/bytes,BodyLen1:32/integer-big,Body1/bytes>>}=A.

	%% active 必须为false    
    A = gen_tcp:recv(Sock,0),
    
    %%{ok,<<HeaderLength:32/integer-big,ClientVersion:32/integer-big,CmdId:32/integer-big,Seq:32/integer-big,TT/binary>>}=A.

    {ok,<<HeaderLength:?INT,ClientVersion:?INT,CmdId:?INT,Ticket/binary>>}=A,


    %%<<_:11/bytes, NumberOfPlayers:16/integer-big, _/binary>> = <<83,65,77,80,188,64,171,138,30,120,105,0,0,0,10,0,4,0,0,0,84,101,115,116,15,0,0,0,82,101,122,111,110,101,32,82,111,108,101,80,108,97,121,11,0,0,0,83,97,110,32,65,110,100,114,101,97,115>>,
    %%NumberOfPlayers.

    gen_tcp:send(Sock,<<HeaderLength4:32/integer-big,ClientVersion4:32/integer-big,6:32/integer-big,TT/binary>>),
    %%gen_tcp:send(Sock,200),
    %%gen_tcp:send(Sock,1),
    %%gen_tcp:send(Sock,<<>>),

 	{ok, <<Len:?USHORT,Cmd:?USHORT,Contain:4/binary-unit:8>> = A} ->

    	gen_tcp:close(Sock),
    A. 


send(Sock,CmdId,Seq,Ticket,BodyStr)->
	gen_tcp:send(Sock,<<HeaderLen:32/integer-big,200:32/integer-big,CmdId:32/integer-big,Seq:32/integer-big,Ticket/binary,byte_length(BodyStr):32/integer-big,BodyStr/binary>>).

