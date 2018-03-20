%%**
 % 解码格式.
 %
 %                                        Protocol
 %  __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __
 % |           |           |           |           |              |                          |
 %       2           1           1           1            4               Uncertainty
 % |__ __ __ __|__ __ __ __|__ __ __ __|__ __ __ __|__ __ __ __ __|__ __ __ __ __ __ __ __ __|
 % |           |           |           |           |              |                          |
 %     Magic        Sign        Type       Status     Body Length         Body Content
 % |__ __ __ __|__ __ __ __|__ __ __ __|__ __ __ __|__ __ __ __ __|__ __ __ __ __ __ __ __ __|
 %
 % 协议头9个字节定长
 %     Magic      // 数据包的验证位，short类型
 %     Sign       // 消息标志，请求／响应／通知，byte类型
 %     Type       // 消息类型，登录／发送消息等，byte类型
 %     Status     // 响应状态，成功／失败，byte类型
 %     BodyLength // 协议体长度，int类型
 %
 %
 % @author sam.
%%/
-module(protocol).
-author("sam").


-export([ok/0,h1/1,login/1,create_Login/2]).
-import(loginReq_pb, [encode_msg/1, encode_msg/2 ,decode_msg/2, decode_msg/3]).

-include("proto/loginReq_pb.hrl").

ok()->
ok.

h1(Resp)->
{ok,<<Magic:2,Sign:1/bytes,Type:1/bytes,Status:1/bytes,BodyLen:4,Body:BodyLen/bytes>>} = Resp.


send(Sock,CmdId,Seq,Ticket,BodyStr) ->
	BodyLen=byte_size(BodyStr),
	gen_tcp:send(Sock,<<56:32/integer-big,200:32/integer-big,CmdId:32/integer-big,Seq:32/integer-big,Ticket/bytes,BodyLen:32/integer-big,BodyStr/bytes>>).


login(Sock)->
	A1=create_Login("133","123456"),
	Body=loginReq_pb:encode_msg(A1),
	BodyLen=byte_size(Body),
	gen_tcp:send(Sock,<<16#baba,16#01,16#11,16#31,BodyLen,Body>>).



create_Login(Name,Pwd)->
    #loginReq{account = Name ,password =Pwd}.

