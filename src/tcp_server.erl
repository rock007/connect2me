-module(tcp_server).

-export([start/1]).
%%% file_name (50bytes)
%%% length(file) 4bytes
%%% file 
%%%

start(Port)->
case gen_tcp:listen(Port, [binary, {packet, 0}, {active, false}]) of
    {ok, ListenSocket} ->
        case gen_tcp:accept(ListenSocket) of
            {ok, Socket} ->
				%%阻止下一个连接
				%%gen_tcp:close(ListenSocket),
				io:format(" connect ~p~n",[Socket]),
                %%gen_tcp:send(Socket, "test!"),
				send(Socket,3,100,make_option(),<<"ok">>),
				%%loop(Socket);
				read(Socket);

            {error, SocketAcceptFail} ->
                {error,SocketAcceptFail}
        end;
    _ ->
        {error,socket_listen_fail}
end.

loop(Socket)->
	receive
		{tcp,Socket,Bin}->
			io:format("receive ~p~n",[Bin]),

			%%AllBin=[Bin,AllBin],	
			decodePacket(Bin),
			%%gen_tcp:send(Socket, "ok"),
			send(Socket,3,100,make_option(),<<"ok">>),
			loop(Socket);
		{tcp_closed,Socket}->
			io:format("Socket is closed ~p~n",[Socket])		
	end.	


loop2(Sck)->
	case gen_tcp:recv(Sck, 0) of
		{ok,Packet} ->
			decodePacket(Packet),
			send(Sck,3,100,make_option(),<<"ok">>);
		{error, Reson}->
			Reson	
	end,
ok.

decodePacket(Packet)->
	<<HeaderLen:32/integer-big,CmdId:32/integer-big,Seq:32/integer-big,FileName:36/bytes,BodyLen:32/integer-big,Body/bytes>>=Packet,
	FilePath=string:concat("E:\\person\\meizu\\",FileName),
	case file:write_file(FilePath, Body) of
		ok  ->
			io:format("~nsave file ~p~n",FileName);
			
		{error,Reson} ->
			io:format("~nsave file ~p error:~p ~n",[FileName,Reson])	
	end,
 ok.			

readPackage(Socket,Num)->
	case gen_tcp:recv(Socket, Num) of
		{ok, Packet}  ->
			io:format("~neadPackage num ~p ,~p~n",[Num,Packet]),
			{ok,Packet};
		{error,Reson} ->
			{err,Reson}	
	end.

read(Socket)->
	{ok,HeaderLen}=readPackage(Socket,4),
	{ok,CmdId}=readPackage(Socket,4),
	{ok,Seq}=readPackage(Socket,4),
	{ok,FileName}=readPackage(Socket,36),
	{ok,BodyLen}=readPackage(Socket,4),
	B=binary:decode_unsigned(BodyLen),
	{ok,Body}=readPackage(Socket,B),

	FilePath=string:concat("d:\\temp\\",binary_to_list(FileName)),
	case file:write_file(FilePath, Body) of
		ok  ->
			io:format("~nsave file ~p~n",[FilePath]),
			send(Socket,3,100,make_option(),<<"ok">>),
			read(Socket);
		{error,Reson} ->
			io:format("~nsave file ~p error:~p ~n",[FileName,Reson])	
	end.

 send(Sock,CmdId,Seq,Ticket,BodyStr) ->
 	io:format("~nsend resp  ~n"),
	BodyLen=byte_size(BodyStr),
	gen_tcp:send(Sock,<<48:32/integer-big,CmdId:32/integer-big,Seq:32/integer-big,Ticket/bytes,BodyLen:32/integer-big,BodyStr/bytes>>).


make_option()->
<<"                                    ">>.