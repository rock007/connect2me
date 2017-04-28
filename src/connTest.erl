-module(connTest).

-export([start/0,timer/2,send/5]).


start() ->
    {ok,Sock} = gen_tcp:connect("219.138.150.224",10013,[{active,false},binary]),
	A=gen_tcp:recv(Sock,0),
	{ok,<<HeaderLen:32/integer-big,ClientVer:32/integer-big,CmdId:32/integer-big,Seq:32/integer-big,Ticket:36/bytes,BodyLen:32/integer-big,Body/bytes>>}=A,
	State={HeaderLen,ClientVer,CmdId,Seq,Ticket,BodyLen,Body},
	io:format("~nreceive body: ~p",[Body]),
	%%login
	send(Sock,1,1,Ticket,<<"aaaaaa1,11111-2222--3333">>),
	A1=gen_tcp:recv(Sock,0),
	{ok,<<HeaderLen1:32/integer-big,ClientVer1:32/integer-big,CmdId1:32/integer-big,Seq1:32/integer-big,Ticket1:36/bytes,BodyLen1:32/integer-big,Body1/bytes>>}=A1,
	io:format("~nreceive Ticket1: ~p",[Ticket1]),
	loop(Sock,Ticket1).

send(Sock,CmdId,Seq,Ticket,BodyStr) ->
	BodyLen=byte_size(BodyStr),
	gen_tcp:send(Sock,<<56:32/integer-big,200:32/integer-big,CmdId:32/integer-big,Seq:32/integer-big,Ticket/bytes,BodyLen:32/integer-big,BodyStr/bytes>>).


 loop(Sock,Ticket) ->
 	sleep(1000*60*3),
 	io:format("~nloop send  Ticket: ~p",[Ticket]),
 	send(Sock,6,100,Ticket,<<"">>),
 	loop(Sock,Ticket).

sleep(T) ->
    receive
    after T -> true
    end.

timer(T,Fun) ->
  receive
  	stop ->
  	   void
  after T -> 
  	Fun,
  	timer(T,Fun)
  end.    