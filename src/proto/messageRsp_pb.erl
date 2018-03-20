%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 3.26.4
-module(messageRsp_pb).

-export([encode_msg/1, encode_msg/2]).
-export([decode_msg/2, decode_msg/3]).
-export([merge_msgs/2, merge_msgs/3]).
-export([verify_msg/1, verify_msg/2]).
-export([get_msg_defs/0]).
-export([get_msg_names/0]).
-export([get_enum_names/0]).
-export([find_msg_def/1, fetch_msg_def/1]).
-export([find_enum_def/1, fetch_enum_def/1]).
-export([enum_symbol_by_value/2, enum_value_by_symbol/2]).
-export([get_service_names/0]).
-export([get_service_def/1]).
-export([get_rpc_names/1]).
-export([find_rpc_def/2, fetch_rpc_def/2]).
-export([get_package_name/0]).
-export([gpb_version_as_string/0, gpb_version_as_list/0]).

-include("messageRsp_pb.hrl").
-include("gpb.hrl").

%% enumerated types

-export_type([]).

%% message types
-type messageBuffer() :: #messageBuffer{}.
-type chatMessageListRsp() :: #chatMessageListRsp{}.
-export_type(['messageBuffer'/0, 'chatMessageListRsp'/0]).


-spec encode_msg(_) -> binary().
encode_msg(Msg) -> encode_msg(Msg, []).


-spec encode_msg(_, list()) -> binary().
encode_msg(Msg, Opts) ->
    case proplists:get_bool(verify, Opts) of
      true -> verify_msg(Msg, Opts);
      false -> ok
    end,
    TrUserData = proplists:get_value(user_data, Opts),
    case Msg of
      #messageBuffer{} ->
	  e_msg_messageBuffer(Msg, TrUserData);
      #chatMessageListRsp{} ->
	  e_msg_chatMessageListRsp(Msg, TrUserData)
    end.



e_msg_messageBuffer(Msg, TrUserData) ->
    e_msg_messageBuffer(Msg, <<>>, TrUserData).


e_msg_messageBuffer(#messageBuffer{id = F1,
				   content = F2, groupId = F3, toUser = F4,
				   sendFrom = F5, status = F6, recDate = F7,
				   sendDate = F8},
		    Bin, TrUserData) ->
    B1 = begin
	   TrF1 = id(F1, TrUserData),
	   e_type_int32(TrF1, <<Bin/binary, 8>>)
	 end,
    B2 = begin
	   TrF2 = id(F2, TrUserData),
	   e_type_string(TrF2, <<B1/binary, 18>>)
	 end,
    B3 = if F3 == undefined -> B2;
	    true ->
		begin
		  TrF3 = id(F3, TrUserData),
		  e_type_int32(TrF3, <<B2/binary, 24>>)
		end
	 end,
    B4 = begin
	   TrF4 = id(F4, TrUserData),
	   e_type_string(TrF4, <<B3/binary, 34>>)
	 end,
    B5 = begin
	   TrF5 = id(F5, TrUserData),
	   e_type_string(TrF5, <<B4/binary, 42>>)
	 end,
    B6 = begin
	   TrF6 = id(F6, TrUserData),
	   e_type_int32(TrF6, <<B5/binary, 48>>)
	 end,
    B7 = if F7 == undefined -> B6;
	    true ->
		begin
		  TrF7 = id(F7, TrUserData),
		  e_type_string(TrF7, <<B6/binary, 58>>)
		end
	 end,
    if F8 == undefined -> B7;
       true ->
	   begin
	     TrF8 = id(F8, TrUserData),
	     e_type_string(TrF8, <<B7/binary, 66>>)
	   end
    end.

e_msg_chatMessageListRsp(Msg, TrUserData) ->
    e_msg_chatMessageListRsp(Msg, <<>>, TrUserData).


e_msg_chatMessageListRsp(#chatMessageListRsp{messages =
						 F1},
			 Bin, TrUserData) ->
    begin
      TrF1 = id(F1, TrUserData),
      if TrF1 == [] -> Bin;
	 true ->
	     e_field_chatMessageListRsp_messages(TrF1, Bin,
						 TrUserData)
      end
    end.

e_mfield_chatMessageListRsp_messages(Msg, Bin,
				     TrUserData) ->
    SubBin = e_msg_messageBuffer(Msg, <<>>, TrUserData),
    Bin2 = e_varint(byte_size(SubBin), Bin),
    <<Bin2/binary, SubBin/binary>>.

e_field_chatMessageListRsp_messages([Elem | Rest], Bin,
				    TrUserData) ->
    Bin2 = <<Bin/binary, 10>>,
    Bin3 = e_mfield_chatMessageListRsp_messages(id(Elem,
						   TrUserData),
						Bin2, TrUserData),
    e_field_chatMessageListRsp_messages(Rest, Bin3,
					TrUserData);
e_field_chatMessageListRsp_messages([], Bin,
				    _TrUserData) ->
    Bin.



e_type_int32(Value, Bin)
    when 0 =< Value, Value =< 127 ->
    <<Bin/binary, Value>>;
e_type_int32(Value, Bin) ->
    <<N:64/unsigned-native>> = <<Value:64/signed-native>>,
    e_varint(N, Bin).

e_type_string(S, Bin) ->
    Utf8 = unicode:characters_to_binary(S),
    Bin2 = e_varint(byte_size(Utf8), Bin),
    <<Bin2/binary, Utf8/binary>>.

e_varint(N, Bin) when N =< 127 -> <<Bin/binary, N>>;
e_varint(N, Bin) ->
    Bin2 = <<Bin/binary, (N band 127 bor 128)>>,
    e_varint(N bsr 7, Bin2).



decode_msg(Bin, MsgName) when is_binary(Bin) ->
    decode_msg(Bin, MsgName, []).

decode_msg(Bin, MsgName, Opts) when is_binary(Bin) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case MsgName of
      messageBuffer -> d_msg_messageBuffer(Bin, TrUserData);
      chatMessageListRsp ->
	  d_msg_chatMessageListRsp(Bin, TrUserData)
    end.



d_msg_messageBuffer(Bin, TrUserData) ->
    dfp_read_field_def_messageBuffer(Bin, 0, 0,
				     id(undefined, TrUserData),
				     id(undefined, TrUserData),
				     id(undefined, TrUserData),
				     id(undefined, TrUserData),
				     id(undefined, TrUserData),
				     id(undefined, TrUserData),
				     id(undefined, TrUserData),
				     id(undefined, TrUserData), TrUserData).

dfp_read_field_def_messageBuffer(<<8, Rest/binary>>, Z1,
				 Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    d_field_messageBuffer_id(Rest, Z1, Z2, F1, F2, F3, F4,
			     F5, F6, F7, F8, TrUserData);
dfp_read_field_def_messageBuffer(<<18, Rest/binary>>,
				 Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    d_field_messageBuffer_content(Rest, Z1, Z2, F1, F2, F3,
				  F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_messageBuffer(<<24, Rest/binary>>,
				 Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    d_field_messageBuffer_groupId(Rest, Z1, Z2, F1, F2, F3,
				  F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_messageBuffer(<<34, Rest/binary>>,
				 Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    d_field_messageBuffer_toUser(Rest, Z1, Z2, F1, F2, F3,
				 F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_messageBuffer(<<42, Rest/binary>>,
				 Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    d_field_messageBuffer_sendFrom(Rest, Z1, Z2, F1, F2, F3,
				   F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_messageBuffer(<<48, Rest/binary>>,
				 Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    d_field_messageBuffer_status(Rest, Z1, Z2, F1, F2, F3,
				 F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_messageBuffer(<<58, Rest/binary>>,
				 Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    d_field_messageBuffer_recDate(Rest, Z1, Z2, F1, F2, F3,
				  F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_messageBuffer(<<66, Rest/binary>>,
				 Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    d_field_messageBuffer_sendDate(Rest, Z1, Z2, F1, F2, F3,
				   F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_messageBuffer(<<>>, 0, 0, F1, F2, F3,
				 F4, F5, F6, F7, F8, _) ->
    #messageBuffer{id = F1, content = F2, groupId = F3,
		   toUser = F4, sendFrom = F5, status = F6, recDate = F7,
		   sendDate = F8};
dfp_read_field_def_messageBuffer(Other, Z1, Z2, F1, F2,
				 F3, F4, F5, F6, F7, F8, TrUserData) ->
    dg_read_field_def_messageBuffer(Other, Z1, Z2, F1, F2,
				    F3, F4, F5, F6, F7, F8, TrUserData).

dg_read_field_def_messageBuffer(<<1:1, X:7,
				  Rest/binary>>,
				N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				TrUserData)
    when N < 32 - 7 ->
    dg_read_field_def_messageBuffer(Rest, N + 7,
				    X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7,
				    F8, TrUserData);
dg_read_field_def_messageBuffer(<<0:1, X:7,
				  Rest/binary>>,
				N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
      8 ->
	  d_field_messageBuffer_id(Rest, 0, 0, F1, F2, F3, F4, F5,
				   F6, F7, F8, TrUserData);
      18 ->
	  d_field_messageBuffer_content(Rest, 0, 0, F1, F2, F3,
					F4, F5, F6, F7, F8, TrUserData);
      24 ->
	  d_field_messageBuffer_groupId(Rest, 0, 0, F1, F2, F3,
					F4, F5, F6, F7, F8, TrUserData);
      34 ->
	  d_field_messageBuffer_toUser(Rest, 0, 0, F1, F2, F3, F4,
				       F5, F6, F7, F8, TrUserData);
      42 ->
	  d_field_messageBuffer_sendFrom(Rest, 0, 0, F1, F2, F3,
					 F4, F5, F6, F7, F8, TrUserData);
      48 ->
	  d_field_messageBuffer_status(Rest, 0, 0, F1, F2, F3, F4,
				       F5, F6, F7, F8, TrUserData);
      58 ->
	  d_field_messageBuffer_recDate(Rest, 0, 0, F1, F2, F3,
					F4, F5, F6, F7, F8, TrUserData);
      66 ->
	  d_field_messageBuffer_sendDate(Rest, 0, 0, F1, F2, F3,
					 F4, F5, F6, F7, F8, TrUserData);
      _ ->
	  case Key band 7 of
	    0 ->
		skip_varint_messageBuffer(Rest, 0, 0, F1, F2, F3, F4,
					  F5, F6, F7, F8, TrUserData);
	    1 ->
		skip_64_messageBuffer(Rest, 0, 0, F1, F2, F3, F4, F5,
				      F6, F7, F8, TrUserData);
	    2 ->
		skip_length_delimited_messageBuffer(Rest, 0, 0, F1, F2,
						    F3, F4, F5, F6, F7, F8,
						    TrUserData);
	    5 ->
		skip_32_messageBuffer(Rest, 0, 0, F1, F2, F3, F4, F5,
				      F6, F7, F8, TrUserData)
	  end
    end;
dg_read_field_def_messageBuffer(<<>>, 0, 0, F1, F2, F3,
				F4, F5, F6, F7, F8, _) ->
    #messageBuffer{id = F1, content = F2, groupId = F3,
		   toUser = F4, sendFrom = F5, status = F6, recDate = F7,
		   sendDate = F8}.

d_field_messageBuffer_id(<<1:1, X:7, Rest/binary>>, N,
			 Acc, F1, F2, F3, F4, F5, F6, F7, F8, TrUserData)
    when N < 57 ->
    d_field_messageBuffer_id(Rest, N + 7, X bsl N + Acc, F1,
			     F2, F3, F4, F5, F6, F7, F8, TrUserData);
d_field_messageBuffer_id(<<0:1, X:7, Rest/binary>>, N,
			 Acc, _, F2, F3, F4, F5, F6, F7, F8, TrUserData) ->
    <<NewFValue:32/signed-native>> = <<(X bsl N +
					  Acc):32/unsigned-native>>,
    dfp_read_field_def_messageBuffer(Rest, 0, 0, NewFValue,
				     F2, F3, F4, F5, F6, F7, F8, TrUserData).


d_field_messageBuffer_content(<<1:1, X:7, Rest/binary>>,
			      N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
			      TrUserData)
    when N < 57 ->
    d_field_messageBuffer_content(Rest, N + 7,
				  X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData);
d_field_messageBuffer_content(<<0:1, X:7, Rest/binary>>,
			      N, Acc, F1, _, F3, F4, F5, F6, F7, F8,
			      TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_messageBuffer(Rest2, 0, 0, F1,
				     NewFValue, F3, F4, F5, F6, F7, F8,
				     TrUserData).


d_field_messageBuffer_groupId(<<1:1, X:7, Rest/binary>>,
			      N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
			      TrUserData)
    when N < 57 ->
    d_field_messageBuffer_groupId(Rest, N + 7,
				  X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData);
d_field_messageBuffer_groupId(<<0:1, X:7, Rest/binary>>,
			      N, Acc, F1, F2, _, F4, F5, F6, F7, F8,
			      TrUserData) ->
    <<NewFValue:32/signed-native>> = <<(X bsl N +
					  Acc):32/unsigned-native>>,
    dfp_read_field_def_messageBuffer(Rest, 0, 0, F1, F2,
				     NewFValue, F4, F5, F6, F7, F8, TrUserData).


d_field_messageBuffer_toUser(<<1:1, X:7, Rest/binary>>,
			     N, Acc, F1, F2, F3, F4, F5, F6, F7, F8, TrUserData)
    when N < 57 ->
    d_field_messageBuffer_toUser(Rest, N + 7, X bsl N + Acc,
				 F1, F2, F3, F4, F5, F6, F7, F8, TrUserData);
d_field_messageBuffer_toUser(<<0:1, X:7, Rest/binary>>,
			     N, Acc, F1, F2, F3, _, F5, F6, F7, F8,
			     TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_messageBuffer(Rest2, 0, 0, F1, F2,
				     F3, NewFValue, F5, F6, F7, F8, TrUserData).


d_field_messageBuffer_sendFrom(<<1:1, X:7,
				 Rest/binary>>,
			       N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
			       TrUserData)
    when N < 57 ->
    d_field_messageBuffer_sendFrom(Rest, N + 7,
				   X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7,
				   F8, TrUserData);
d_field_messageBuffer_sendFrom(<<0:1, X:7,
				 Rest/binary>>,
			       N, Acc, F1, F2, F3, F4, _, F6, F7, F8,
			       TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_messageBuffer(Rest2, 0, 0, F1, F2,
				     F3, F4, NewFValue, F6, F7, F8, TrUserData).


d_field_messageBuffer_status(<<1:1, X:7, Rest/binary>>,
			     N, Acc, F1, F2, F3, F4, F5, F6, F7, F8, TrUserData)
    when N < 57 ->
    d_field_messageBuffer_status(Rest, N + 7, X bsl N + Acc,
				 F1, F2, F3, F4, F5, F6, F7, F8, TrUserData);
d_field_messageBuffer_status(<<0:1, X:7, Rest/binary>>,
			     N, Acc, F1, F2, F3, F4, F5, _, F7, F8,
			     TrUserData) ->
    <<NewFValue:32/signed-native>> = <<(X bsl N +
					  Acc):32/unsigned-native>>,
    dfp_read_field_def_messageBuffer(Rest, 0, 0, F1, F2, F3,
				     F4, F5, NewFValue, F7, F8, TrUserData).


d_field_messageBuffer_recDate(<<1:1, X:7, Rest/binary>>,
			      N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
			      TrUserData)
    when N < 57 ->
    d_field_messageBuffer_recDate(Rest, N + 7,
				  X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData);
d_field_messageBuffer_recDate(<<0:1, X:7, Rest/binary>>,
			      N, Acc, F1, F2, F3, F4, F5, F6, _, F8,
			      TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_messageBuffer(Rest2, 0, 0, F1, F2,
				     F3, F4, F5, F6, NewFValue, F8, TrUserData).


d_field_messageBuffer_sendDate(<<1:1, X:7,
				 Rest/binary>>,
			       N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
			       TrUserData)
    when N < 57 ->
    d_field_messageBuffer_sendDate(Rest, N + 7,
				   X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7,
				   F8, TrUserData);
d_field_messageBuffer_sendDate(<<0:1, X:7,
				 Rest/binary>>,
			       N, Acc, F1, F2, F3, F4, F5, F6, F7, _,
			       TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_messageBuffer(Rest2, 0, 0, F1, F2,
				     F3, F4, F5, F6, F7, NewFValue, TrUserData).


skip_varint_messageBuffer(<<1:1, _:7, Rest/binary>>, Z1,
			  Z2, F1, F2, F3, F4, F5, F6, F7, F8, TrUserData) ->
    skip_varint_messageBuffer(Rest, Z1, Z2, F1, F2, F3, F4,
			      F5, F6, F7, F8, TrUserData);
skip_varint_messageBuffer(<<0:1, _:7, Rest/binary>>, Z1,
			  Z2, F1, F2, F3, F4, F5, F6, F7, F8, TrUserData) ->
    dfp_read_field_def_messageBuffer(Rest, Z1, Z2, F1, F2,
				     F3, F4, F5, F6, F7, F8, TrUserData).


skip_length_delimited_messageBuffer(<<1:1, X:7,
				      Rest/binary>>,
				    N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				    TrUserData)
    when N < 57 ->
    skip_length_delimited_messageBuffer(Rest, N + 7,
					X bsl N + Acc, F1, F2, F3, F4, F5, F6,
					F7, F8, TrUserData);
skip_length_delimited_messageBuffer(<<0:1, X:7,
				      Rest/binary>>,
				    N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				    TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_messageBuffer(Rest2, 0, 0, F1, F2,
				     F3, F4, F5, F6, F7, F8, TrUserData).


skip_32_messageBuffer(<<_:32, Rest/binary>>, Z1, Z2, F1,
		      F2, F3, F4, F5, F6, F7, F8, TrUserData) ->
    dfp_read_field_def_messageBuffer(Rest, Z1, Z2, F1, F2,
				     F3, F4, F5, F6, F7, F8, TrUserData).


skip_64_messageBuffer(<<_:64, Rest/binary>>, Z1, Z2, F1,
		      F2, F3, F4, F5, F6, F7, F8, TrUserData) ->
    dfp_read_field_def_messageBuffer(Rest, Z1, Z2, F1, F2,
				     F3, F4, F5, F6, F7, F8, TrUserData).


d_msg_chatMessageListRsp(Bin, TrUserData) ->
    dfp_read_field_def_chatMessageListRsp(Bin, 0, 0,
					  id([], TrUserData), TrUserData).

dfp_read_field_def_chatMessageListRsp(<<10,
					Rest/binary>>,
				      Z1, Z2, F1, TrUserData) ->
    d_field_chatMessageListRsp_messages(Rest, Z1, Z2, F1,
					TrUserData);
dfp_read_field_def_chatMessageListRsp(<<>>, 0, 0, F1,
				      TrUserData) ->
    #chatMessageListRsp{messages =
			    lists_reverse(F1, TrUserData)};
dfp_read_field_def_chatMessageListRsp(Other, Z1, Z2, F1,
				      TrUserData) ->
    dg_read_field_def_chatMessageListRsp(Other, Z1, Z2, F1,
					 TrUserData).

dg_read_field_def_chatMessageListRsp(<<1:1, X:7,
				       Rest/binary>>,
				     N, Acc, F1, TrUserData)
    when N < 32 - 7 ->
    dg_read_field_def_chatMessageListRsp(Rest, N + 7,
					 X bsl N + Acc, F1, TrUserData);
dg_read_field_def_chatMessageListRsp(<<0:1, X:7,
				       Rest/binary>>,
				     N, Acc, F1, TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
      10 ->
	  d_field_chatMessageListRsp_messages(Rest, 0, 0, F1,
					      TrUserData);
      _ ->
	  case Key band 7 of
	    0 ->
		skip_varint_chatMessageListRsp(Rest, 0, 0, F1,
					       TrUserData);
	    1 ->
		skip_64_chatMessageListRsp(Rest, 0, 0, F1, TrUserData);
	    2 ->
		skip_length_delimited_chatMessageListRsp(Rest, 0, 0, F1,
							 TrUserData);
	    5 ->
		skip_32_chatMessageListRsp(Rest, 0, 0, F1, TrUserData)
	  end
    end;
dg_read_field_def_chatMessageListRsp(<<>>, 0, 0, F1,
				     TrUserData) ->
    #chatMessageListRsp{messages =
			    lists_reverse(F1, TrUserData)}.

d_field_chatMessageListRsp_messages(<<1:1, X:7,
				      Rest/binary>>,
				    N, Acc, F1, TrUserData)
    when N < 57 ->
    d_field_chatMessageListRsp_messages(Rest, N + 7,
					X bsl N + Acc, F1, TrUserData);
d_field_chatMessageListRsp_messages(<<0:1, X:7,
				      Rest/binary>>,
				    N, Acc, F1, TrUserData) ->
    Len = X bsl N + Acc,
    <<Bs:Len/binary, Rest2/binary>> = Rest,
    NewFValue = id(d_msg_messageBuffer(Bs, TrUserData),
		   TrUserData),
    dfp_read_field_def_chatMessageListRsp(Rest2, 0, 0,
					  cons(NewFValue, F1, TrUserData),
					  TrUserData).


skip_varint_chatMessageListRsp(<<1:1, _:7,
				 Rest/binary>>,
			       Z1, Z2, F1, TrUserData) ->
    skip_varint_chatMessageListRsp(Rest, Z1, Z2, F1,
				   TrUserData);
skip_varint_chatMessageListRsp(<<0:1, _:7,
				 Rest/binary>>,
			       Z1, Z2, F1, TrUserData) ->
    dfp_read_field_def_chatMessageListRsp(Rest, Z1, Z2, F1,
					  TrUserData).


skip_length_delimited_chatMessageListRsp(<<1:1, X:7,
					   Rest/binary>>,
					 N, Acc, F1, TrUserData)
    when N < 57 ->
    skip_length_delimited_chatMessageListRsp(Rest, N + 7,
					     X bsl N + Acc, F1, TrUserData);
skip_length_delimited_chatMessageListRsp(<<0:1, X:7,
					   Rest/binary>>,
					 N, Acc, F1, TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_chatMessageListRsp(Rest2, 0, 0, F1,
					  TrUserData).


skip_32_chatMessageListRsp(<<_:32, Rest/binary>>, Z1,
			   Z2, F1, TrUserData) ->
    dfp_read_field_def_chatMessageListRsp(Rest, Z1, Z2, F1,
					  TrUserData).


skip_64_chatMessageListRsp(<<_:64, Rest/binary>>, Z1,
			   Z2, F1, TrUserData) ->
    dfp_read_field_def_chatMessageListRsp(Rest, Z1, Z2, F1,
					  TrUserData).






merge_msgs(Prev, New) -> merge_msgs(Prev, New, []).

merge_msgs(Prev, New, Opts)
    when element(1, Prev) =:= element(1, New) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case Prev of
      #messageBuffer{} ->
	  merge_msg_messageBuffer(Prev, New, TrUserData);
      #chatMessageListRsp{} ->
	  merge_msg_chatMessageListRsp(Prev, New, TrUserData)
    end.

merge_msg_messageBuffer(#messageBuffer{groupId =
					   PFgroupId,
				       recDate = PFrecDate,
				       sendDate = PFsendDate},
			#messageBuffer{id = NFid, content = NFcontent,
				       groupId = NFgroupId, toUser = NFtoUser,
				       sendFrom = NFsendFrom, status = NFstatus,
				       recDate = NFrecDate,
				       sendDate = NFsendDate},
			_) ->
    #messageBuffer{id = NFid, content = NFcontent,
		   groupId =
		       if NFgroupId =:= undefined -> PFgroupId;
			  true -> NFgroupId
		       end,
		   toUser = NFtoUser, sendFrom = NFsendFrom,
		   status = NFstatus,
		   recDate =
		       if NFrecDate =:= undefined -> PFrecDate;
			  true -> NFrecDate
		       end,
		   sendDate =
		       if NFsendDate =:= undefined -> PFsendDate;
			  true -> NFsendDate
		       end}.

merge_msg_chatMessageListRsp(#chatMessageListRsp{messages
						     = PFmessages},
			     #chatMessageListRsp{messages = NFmessages},
			     TrUserData) ->
    #chatMessageListRsp{messages =
			    'erlang_++'(PFmessages, NFmessages, TrUserData)}.



verify_msg(Msg) -> verify_msg(Msg, []).

verify_msg(Msg, Opts) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case Msg of
      #messageBuffer{} ->
	  v_msg_messageBuffer(Msg, [messageBuffer], TrUserData);
      #chatMessageListRsp{} ->
	  v_msg_chatMessageListRsp(Msg, [chatMessageListRsp],
				   TrUserData);
      _ -> mk_type_error(not_a_known_message, Msg, [])
    end.


-dialyzer({nowarn_function,v_msg_messageBuffer/3}).
v_msg_messageBuffer(#messageBuffer{id = F1,
				   content = F2, groupId = F3, toUser = F4,
				   sendFrom = F5, status = F6, recDate = F7,
				   sendDate = F8},
		    Path, _) ->
    v_type_int32(F1, [id | Path]),
    v_type_string(F2, [content | Path]),
    if F3 == undefined -> ok;
       true -> v_type_int32(F3, [groupId | Path])
    end,
    v_type_string(F4, [toUser | Path]),
    v_type_string(F5, [sendFrom | Path]),
    v_type_int32(F6, [status | Path]),
    if F7 == undefined -> ok;
       true -> v_type_string(F7, [recDate | Path])
    end,
    if F8 == undefined -> ok;
       true -> v_type_string(F8, [sendDate | Path])
    end,
    ok;
v_msg_messageBuffer(X, Path, _TrUserData) ->
    mk_type_error({expected_msg, messageBuffer}, X, Path).

-dialyzer({nowarn_function,v_msg_chatMessageListRsp/3}).
v_msg_chatMessageListRsp(#chatMessageListRsp{messages =
						 F1},
			 Path, TrUserData) ->
    if is_list(F1) ->
	   _ = [v_msg_messageBuffer(Elem, [messages | Path],
				    TrUserData)
		|| Elem <- F1],
	   ok;
       true ->
	   mk_type_error({invalid_list_of, {msg, messageBuffer}},
			 F1, Path)
    end,
    ok.

-dialyzer({nowarn_function,v_type_int32/2}).
v_type_int32(N, _Path)
    when -2147483648 =< N, N =< 2147483647 ->
    ok;
v_type_int32(N, Path) when is_integer(N) ->
    mk_type_error({value_out_of_range, int32, signed, 32},
		  N, Path);
v_type_int32(X, Path) ->
    mk_type_error({bad_integer, int32, signed, 32}, X,
		  Path).

-dialyzer({nowarn_function,v_type_string/2}).
v_type_string(S, Path) when is_list(S); is_binary(S) ->
    try unicode:characters_to_binary(S) of
      B when is_binary(B) -> ok;
      {error, _, _} ->
	  mk_type_error(bad_unicode_string, S, Path)
    catch
      error:badarg ->
	  mk_type_error(bad_unicode_string, S, Path)
    end;
v_type_string(X, Path) ->
    mk_type_error(bad_unicode_string, X, Path).

-spec mk_type_error(_, _, list()) -> no_return().
mk_type_error(Error, ValueSeen, Path) ->
    Path2 = prettify_path(Path),
    erlang:error({gpb_type_error,
		  {Error, [{value, ValueSeen}, {path, Path2}]}}).


prettify_path([]) -> top_level;
prettify_path(PathR) ->
    list_to_atom(string:join(lists:map(fun atom_to_list/1,
				       lists:reverse(PathR)),
			     ".")).



-compile({inline,id/2}).
id(X, _TrUserData) -> X.

-compile({inline,cons/3}).
cons(Elem, Acc, _TrUserData) -> [Elem | Acc].

-compile({inline,lists_reverse/2}).
'lists_reverse'(L, _TrUserData) -> lists:reverse(L).
-compile({inline,'erlang_++'/3}).
'erlang_++'(A, B, _TrUserData) -> A ++ B.



get_msg_defs() ->
    [{{msg, messageBuffer},
      [#field{name = id, fnum = 1, rnum = 2, type = int32,
	      occurrence = required, opts = []},
       #field{name = content, fnum = 2, rnum = 3,
	      type = string, occurrence = required, opts = []},
       #field{name = groupId, fnum = 3, rnum = 4, type = int32,
	      occurrence = optional, opts = []},
       #field{name = toUser, fnum = 4, rnum = 5, type = string,
	      occurrence = required, opts = []},
       #field{name = sendFrom, fnum = 5, rnum = 6,
	      type = string, occurrence = required, opts = []},
       #field{name = status, fnum = 6, rnum = 7, type = int32,
	      occurrence = required, opts = []},
       #field{name = recDate, fnum = 7, rnum = 8,
	      type = string, occurrence = optional, opts = []},
       #field{name = sendDate, fnum = 8, rnum = 9,
	      type = string, occurrence = optional, opts = []}]},
     {{msg, chatMessageListRsp},
      [#field{name = messages, fnum = 1, rnum = 2,
	      type = {msg, messageBuffer}, occurrence = repeated,
	      opts = []}]}].


get_msg_names() -> [messageBuffer, chatMessageListRsp].


get_enum_names() -> [].


fetch_msg_def(MsgName) ->
    case find_msg_def(MsgName) of
      Fs when is_list(Fs) -> Fs;
      error -> erlang:error({no_such_msg, MsgName})
    end.


-spec fetch_enum_def(_) -> no_return().
fetch_enum_def(EnumName) ->
    erlang:error({no_such_enum, EnumName}).


find_msg_def(messageBuffer) ->
    [#field{name = id, fnum = 1, rnum = 2, type = int32,
	    occurrence = required, opts = []},
     #field{name = content, fnum = 2, rnum = 3,
	    type = string, occurrence = required, opts = []},
     #field{name = groupId, fnum = 3, rnum = 4, type = int32,
	    occurrence = optional, opts = []},
     #field{name = toUser, fnum = 4, rnum = 5, type = string,
	    occurrence = required, opts = []},
     #field{name = sendFrom, fnum = 5, rnum = 6,
	    type = string, occurrence = required, opts = []},
     #field{name = status, fnum = 6, rnum = 7, type = int32,
	    occurrence = required, opts = []},
     #field{name = recDate, fnum = 7, rnum = 8,
	    type = string, occurrence = optional, opts = []},
     #field{name = sendDate, fnum = 8, rnum = 9,
	    type = string, occurrence = optional, opts = []}];
find_msg_def(chatMessageListRsp) ->
    [#field{name = messages, fnum = 1, rnum = 2,
	    type = {msg, messageBuffer}, occurrence = repeated,
	    opts = []}];
find_msg_def(_) -> error.


find_enum_def(_) -> error.


-spec enum_symbol_by_value(_, _) -> no_return().
enum_symbol_by_value(E, V) ->
    erlang:error({no_enum_defs, E, V}).


-spec enum_value_by_symbol(_, _) -> no_return().
enum_value_by_symbol(E, V) ->
    erlang:error({no_enum_defs, E, V}).



get_service_names() -> [].


get_service_def(_) -> error.


get_rpc_names(_) -> error.


find_rpc_def(_, _) -> error.



-spec fetch_rpc_def(_, _) -> no_return().
fetch_rpc_def(ServiceName, RpcName) ->
    erlang:error({no_such_rpc, ServiceName, RpcName}).


get_package_name() -> 'com.paintfriend.chat.proto'.



gpb_version_as_string() ->
    "3.26.4".

gpb_version_as_list() ->
    [3,26,4].
