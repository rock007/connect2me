%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 3.26.4
-module(updateGroupReq_pb).

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

-include("updateGroupReq_pb.hrl").
-include("gpb.hrl").

%% enumerated types

-export_type([]).

%% message types
-type updateGroupReq() :: #updateGroupReq{}.
-export_type(['updateGroupReq'/0]).


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
      #updateGroupReq{} ->
	  e_msg_updateGroupReq(Msg, TrUserData)
    end.



e_msg_updateGroupReq(Msg, TrUserData) ->
    e_msg_updateGroupReq(Msg, <<>>, TrUserData).


e_msg_updateGroupReq(#updateGroupReq{id = F1,
				     groupName = F2, groupLevel = F3, note = F4,
				     remarks = F5, ownUser = F6, status = F7,
				     createDate = F8},
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
    B4 = if F4 == undefined -> B3;
	    true ->
		begin
		  TrF4 = id(F4, TrUserData),
		  e_type_string(TrF4, <<B3/binary, 34>>)
		end
	 end,
    B5 = if F5 == undefined -> B4;
	    true ->
		begin
		  TrF5 = id(F5, TrUserData),
		  e_type_string(TrF5, <<B4/binary, 42>>)
		end
	 end,
    B6 = begin
	   TrF6 = id(F6, TrUserData),
	   e_type_string(TrF6, <<B5/binary, 50>>)
	 end,
    B7 = begin
	   TrF7 = id(F7, TrUserData),
	   e_type_int32(TrF7, <<B6/binary, 56>>)
	 end,
    if F8 == undefined -> B7;
       true ->
	   begin
	     TrF8 = id(F8, TrUserData),
	     e_type_string(TrF8, <<B7/binary, 66>>)
	   end
    end.



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
      updateGroupReq -> d_msg_updateGroupReq(Bin, TrUserData)
    end.



d_msg_updateGroupReq(Bin, TrUserData) ->
    dfp_read_field_def_updateGroupReq(Bin, 0, 0,
				      id(undefined, TrUserData),
				      id(undefined, TrUserData),
				      id(undefined, TrUserData),
				      id(undefined, TrUserData),
				      id(undefined, TrUserData),
				      id(undefined, TrUserData),
				      id(undefined, TrUserData),
				      id(undefined, TrUserData), TrUserData).

dfp_read_field_def_updateGroupReq(<<8, Rest/binary>>,
				  Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData) ->
    d_field_updateGroupReq_id(Rest, Z1, Z2, F1, F2, F3, F4,
			      F5, F6, F7, F8, TrUserData);
dfp_read_field_def_updateGroupReq(<<18, Rest/binary>>,
				  Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData) ->
    d_field_updateGroupReq_groupName(Rest, Z1, Z2, F1, F2,
				     F3, F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_updateGroupReq(<<24, Rest/binary>>,
				  Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData) ->
    d_field_updateGroupReq_groupLevel(Rest, Z1, Z2, F1, F2,
				      F3, F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_updateGroupReq(<<34, Rest/binary>>,
				  Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData) ->
    d_field_updateGroupReq_note(Rest, Z1, Z2, F1, F2, F3,
				F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_updateGroupReq(<<42, Rest/binary>>,
				  Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData) ->
    d_field_updateGroupReq_remarks(Rest, Z1, Z2, F1, F2, F3,
				   F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_updateGroupReq(<<50, Rest/binary>>,
				  Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData) ->
    d_field_updateGroupReq_ownUser(Rest, Z1, Z2, F1, F2, F3,
				   F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_updateGroupReq(<<56, Rest/binary>>,
				  Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData) ->
    d_field_updateGroupReq_status(Rest, Z1, Z2, F1, F2, F3,
				  F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_updateGroupReq(<<66, Rest/binary>>,
				  Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData) ->
    d_field_updateGroupReq_createDate(Rest, Z1, Z2, F1, F2,
				      F3, F4, F5, F6, F7, F8, TrUserData);
dfp_read_field_def_updateGroupReq(<<>>, 0, 0, F1, F2,
				  F3, F4, F5, F6, F7, F8, _) ->
    #updateGroupReq{id = F1, groupName = F2,
		    groupLevel = F3, note = F4, remarks = F5, ownUser = F6,
		    status = F7, createDate = F8};
dfp_read_field_def_updateGroupReq(Other, Z1, Z2, F1, F2,
				  F3, F4, F5, F6, F7, F8, TrUserData) ->
    dg_read_field_def_updateGroupReq(Other, Z1, Z2, F1, F2,
				     F3, F4, F5, F6, F7, F8, TrUserData).

dg_read_field_def_updateGroupReq(<<1:1, X:7,
				   Rest/binary>>,
				 N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData)
    when N < 32 - 7 ->
    dg_read_field_def_updateGroupReq(Rest, N + 7,
				     X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7,
				     F8, TrUserData);
dg_read_field_def_updateGroupReq(<<0:1, X:7,
				   Rest/binary>>,
				 N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
      8 ->
	  d_field_updateGroupReq_id(Rest, 0, 0, F1, F2, F3, F4,
				    F5, F6, F7, F8, TrUserData);
      18 ->
	  d_field_updateGroupReq_groupName(Rest, 0, 0, F1, F2, F3,
					   F4, F5, F6, F7, F8, TrUserData);
      24 ->
	  d_field_updateGroupReq_groupLevel(Rest, 0, 0, F1, F2,
					    F3, F4, F5, F6, F7, F8, TrUserData);
      34 ->
	  d_field_updateGroupReq_note(Rest, 0, 0, F1, F2, F3, F4,
				      F5, F6, F7, F8, TrUserData);
      42 ->
	  d_field_updateGroupReq_remarks(Rest, 0, 0, F1, F2, F3,
					 F4, F5, F6, F7, F8, TrUserData);
      50 ->
	  d_field_updateGroupReq_ownUser(Rest, 0, 0, F1, F2, F3,
					 F4, F5, F6, F7, F8, TrUserData);
      56 ->
	  d_field_updateGroupReq_status(Rest, 0, 0, F1, F2, F3,
					F4, F5, F6, F7, F8, TrUserData);
      66 ->
	  d_field_updateGroupReq_createDate(Rest, 0, 0, F1, F2,
					    F3, F4, F5, F6, F7, F8, TrUserData);
      _ ->
	  case Key band 7 of
	    0 ->
		skip_varint_updateGroupReq(Rest, 0, 0, F1, F2, F3, F4,
					   F5, F6, F7, F8, TrUserData);
	    1 ->
		skip_64_updateGroupReq(Rest, 0, 0, F1, F2, F3, F4, F5,
				       F6, F7, F8, TrUserData);
	    2 ->
		skip_length_delimited_updateGroupReq(Rest, 0, 0, F1, F2,
						     F3, F4, F5, F6, F7, F8,
						     TrUserData);
	    5 ->
		skip_32_updateGroupReq(Rest, 0, 0, F1, F2, F3, F4, F5,
				       F6, F7, F8, TrUserData)
	  end
    end;
dg_read_field_def_updateGroupReq(<<>>, 0, 0, F1, F2, F3,
				 F4, F5, F6, F7, F8, _) ->
    #updateGroupReq{id = F1, groupName = F2,
		    groupLevel = F3, note = F4, remarks = F5, ownUser = F6,
		    status = F7, createDate = F8}.

d_field_updateGroupReq_id(<<1:1, X:7, Rest/binary>>, N,
			  Acc, F1, F2, F3, F4, F5, F6, F7, F8, TrUserData)
    when N < 57 ->
    d_field_updateGroupReq_id(Rest, N + 7, X bsl N + Acc,
			      F1, F2, F3, F4, F5, F6, F7, F8, TrUserData);
d_field_updateGroupReq_id(<<0:1, X:7, Rest/binary>>, N,
			  Acc, _, F2, F3, F4, F5, F6, F7, F8, TrUserData) ->
    <<NewFValue:32/signed-native>> = <<(X bsl N +
					  Acc):32/unsigned-native>>,
    dfp_read_field_def_updateGroupReq(Rest, 0, 0, NewFValue,
				      F2, F3, F4, F5, F6, F7, F8, TrUserData).


d_field_updateGroupReq_groupName(<<1:1, X:7,
				   Rest/binary>>,
				 N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				 TrUserData)
    when N < 57 ->
    d_field_updateGroupReq_groupName(Rest, N + 7,
				     X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7,
				     F8, TrUserData);
d_field_updateGroupReq_groupName(<<0:1, X:7,
				   Rest/binary>>,
				 N, Acc, F1, _, F3, F4, F5, F6, F7, F8,
				 TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_updateGroupReq(Rest2, 0, 0, F1,
				      NewFValue, F3, F4, F5, F6, F7, F8,
				      TrUserData).


d_field_updateGroupReq_groupLevel(<<1:1, X:7,
				    Rest/binary>>,
				  N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData)
    when N < 57 ->
    d_field_updateGroupReq_groupLevel(Rest, N + 7,
				      X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7,
				      F8, TrUserData);
d_field_updateGroupReq_groupLevel(<<0:1, X:7,
				    Rest/binary>>,
				  N, Acc, F1, F2, _, F4, F5, F6, F7, F8,
				  TrUserData) ->
    <<NewFValue:32/signed-native>> = <<(X bsl N +
					  Acc):32/unsigned-native>>,
    dfp_read_field_def_updateGroupReq(Rest, 0, 0, F1, F2,
				      NewFValue, F4, F5, F6, F7, F8,
				      TrUserData).


d_field_updateGroupReq_note(<<1:1, X:7, Rest/binary>>,
			    N, Acc, F1, F2, F3, F4, F5, F6, F7, F8, TrUserData)
    when N < 57 ->
    d_field_updateGroupReq_note(Rest, N + 7, X bsl N + Acc,
				F1, F2, F3, F4, F5, F6, F7, F8, TrUserData);
d_field_updateGroupReq_note(<<0:1, X:7, Rest/binary>>,
			    N, Acc, F1, F2, F3, _, F5, F6, F7, F8,
			    TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_updateGroupReq(Rest2, 0, 0, F1, F2,
				      F3, NewFValue, F5, F6, F7, F8,
				      TrUserData).


d_field_updateGroupReq_remarks(<<1:1, X:7,
				 Rest/binary>>,
			       N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
			       TrUserData)
    when N < 57 ->
    d_field_updateGroupReq_remarks(Rest, N + 7,
				   X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7,
				   F8, TrUserData);
d_field_updateGroupReq_remarks(<<0:1, X:7,
				 Rest/binary>>,
			       N, Acc, F1, F2, F3, F4, _, F6, F7, F8,
			       TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_updateGroupReq(Rest2, 0, 0, F1, F2,
				      F3, F4, NewFValue, F6, F7, F8,
				      TrUserData).


d_field_updateGroupReq_ownUser(<<1:1, X:7,
				 Rest/binary>>,
			       N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
			       TrUserData)
    when N < 57 ->
    d_field_updateGroupReq_ownUser(Rest, N + 7,
				   X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7,
				   F8, TrUserData);
d_field_updateGroupReq_ownUser(<<0:1, X:7,
				 Rest/binary>>,
			       N, Acc, F1, F2, F3, F4, F5, _, F7, F8,
			       TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_updateGroupReq(Rest2, 0, 0, F1, F2,
				      F3, F4, F5, NewFValue, F7, F8,
				      TrUserData).


d_field_updateGroupReq_status(<<1:1, X:7, Rest/binary>>,
			      N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
			      TrUserData)
    when N < 57 ->
    d_field_updateGroupReq_status(Rest, N + 7,
				  X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData);
d_field_updateGroupReq_status(<<0:1, X:7, Rest/binary>>,
			      N, Acc, F1, F2, F3, F4, F5, F6, _, F8,
			      TrUserData) ->
    <<NewFValue:32/signed-native>> = <<(X bsl N +
					  Acc):32/unsigned-native>>,
    dfp_read_field_def_updateGroupReq(Rest, 0, 0, F1, F2,
				      F3, F4, F5, F6, NewFValue, F8,
				      TrUserData).


d_field_updateGroupReq_createDate(<<1:1, X:7,
				    Rest/binary>>,
				  N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				  TrUserData)
    when N < 57 ->
    d_field_updateGroupReq_createDate(Rest, N + 7,
				      X bsl N + Acc, F1, F2, F3, F4, F5, F6, F7,
				      F8, TrUserData);
d_field_updateGroupReq_createDate(<<0:1, X:7,
				    Rest/binary>>,
				  N, Acc, F1, F2, F3, F4, F5, F6, F7, _,
				  TrUserData) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_updateGroupReq(Rest2, 0, 0, F1, F2,
				      F3, F4, F5, F6, F7, NewFValue,
				      TrUserData).


skip_varint_updateGroupReq(<<1:1, _:7, Rest/binary>>,
			   Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
			   TrUserData) ->
    skip_varint_updateGroupReq(Rest, Z1, Z2, F1, F2, F3, F4,
			       F5, F6, F7, F8, TrUserData);
skip_varint_updateGroupReq(<<0:1, _:7, Rest/binary>>,
			   Z1, Z2, F1, F2, F3, F4, F5, F6, F7, F8,
			   TrUserData) ->
    dfp_read_field_def_updateGroupReq(Rest, Z1, Z2, F1, F2,
				      F3, F4, F5, F6, F7, F8, TrUserData).


skip_length_delimited_updateGroupReq(<<1:1, X:7,
				       Rest/binary>>,
				     N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				     TrUserData)
    when N < 57 ->
    skip_length_delimited_updateGroupReq(Rest, N + 7,
					 X bsl N + Acc, F1, F2, F3, F4, F5, F6,
					 F7, F8, TrUserData);
skip_length_delimited_updateGroupReq(<<0:1, X:7,
				       Rest/binary>>,
				     N, Acc, F1, F2, F3, F4, F5, F6, F7, F8,
				     TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_updateGroupReq(Rest2, 0, 0, F1, F2,
				      F3, F4, F5, F6, F7, F8, TrUserData).


skip_32_updateGroupReq(<<_:32, Rest/binary>>, Z1, Z2,
		       F1, F2, F3, F4, F5, F6, F7, F8, TrUserData) ->
    dfp_read_field_def_updateGroupReq(Rest, Z1, Z2, F1, F2,
				      F3, F4, F5, F6, F7, F8, TrUserData).


skip_64_updateGroupReq(<<_:64, Rest/binary>>, Z1, Z2,
		       F1, F2, F3, F4, F5, F6, F7, F8, TrUserData) ->
    dfp_read_field_def_updateGroupReq(Rest, Z1, Z2, F1, F2,
				      F3, F4, F5, F6, F7, F8, TrUserData).






merge_msgs(Prev, New) -> merge_msgs(Prev, New, []).

merge_msgs(Prev, New, Opts)
    when element(1, Prev) =:= element(1, New) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case Prev of
      #updateGroupReq{} ->
	  merge_msg_updateGroupReq(Prev, New, TrUserData)
    end.

merge_msg_updateGroupReq(#updateGroupReq{groupLevel =
					     PFgroupLevel,
					 note = PFnote, remarks = PFremarks,
					 createDate = PFcreateDate},
			 #updateGroupReq{id = NFid, groupName = NFgroupName,
					 groupLevel = NFgroupLevel,
					 note = NFnote, remarks = NFremarks,
					 ownUser = NFownUser, status = NFstatus,
					 createDate = NFcreateDate},
			 _) ->
    #updateGroupReq{id = NFid, groupName = NFgroupName,
		    groupLevel =
			if NFgroupLevel =:= undefined -> PFgroupLevel;
			   true -> NFgroupLevel
			end,
		    note =
			if NFnote =:= undefined -> PFnote;
			   true -> NFnote
			end,
		    remarks =
			if NFremarks =:= undefined -> PFremarks;
			   true -> NFremarks
			end,
		    ownUser = NFownUser, status = NFstatus,
		    createDate =
			if NFcreateDate =:= undefined -> PFcreateDate;
			   true -> NFcreateDate
			end}.



verify_msg(Msg) -> verify_msg(Msg, []).

verify_msg(Msg, Opts) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case Msg of
      #updateGroupReq{} ->
	  v_msg_updateGroupReq(Msg, [updateGroupReq], TrUserData);
      _ -> mk_type_error(not_a_known_message, Msg, [])
    end.


-dialyzer({nowarn_function,v_msg_updateGroupReq/3}).
v_msg_updateGroupReq(#updateGroupReq{id = F1,
				     groupName = F2, groupLevel = F3, note = F4,
				     remarks = F5, ownUser = F6, status = F7,
				     createDate = F8},
		     Path, _) ->
    v_type_int32(F1, [id | Path]),
    v_type_string(F2, [groupName | Path]),
    if F3 == undefined -> ok;
       true -> v_type_int32(F3, [groupLevel | Path])
    end,
    if F4 == undefined -> ok;
       true -> v_type_string(F4, [note | Path])
    end,
    if F5 == undefined -> ok;
       true -> v_type_string(F5, [remarks | Path])
    end,
    v_type_string(F6, [ownUser | Path]),
    v_type_int32(F7, [status | Path]),
    if F8 == undefined -> ok;
       true -> v_type_string(F8, [createDate | Path])
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




get_msg_defs() ->
    [{{msg, updateGroupReq},
      [#field{name = id, fnum = 1, rnum = 2, type = int32,
	      occurrence = required, opts = []},
       #field{name = groupName, fnum = 2, rnum = 3,
	      type = string, occurrence = required, opts = []},
       #field{name = groupLevel, fnum = 3, rnum = 4,
	      type = int32, occurrence = optional, opts = []},
       #field{name = note, fnum = 4, rnum = 5, type = string,
	      occurrence = optional, opts = []},
       #field{name = remarks, fnum = 5, rnum = 6,
	      type = string, occurrence = optional, opts = []},
       #field{name = ownUser, fnum = 6, rnum = 7,
	      type = string, occurrence = required, opts = []},
       #field{name = status, fnum = 7, rnum = 8, type = int32,
	      occurrence = required, opts = []},
       #field{name = createDate, fnum = 8, rnum = 9,
	      type = string, occurrence = optional, opts = []}]}].


get_msg_names() -> [updateGroupReq].


get_enum_names() -> [].


fetch_msg_def(MsgName) ->
    case find_msg_def(MsgName) of
      Fs when is_list(Fs) -> Fs;
      error -> erlang:error({no_such_msg, MsgName})
    end.


-spec fetch_enum_def(_) -> no_return().
fetch_enum_def(EnumName) ->
    erlang:error({no_such_enum, EnumName}).


find_msg_def(updateGroupReq) ->
    [#field{name = id, fnum = 1, rnum = 2, type = int32,
	    occurrence = required, opts = []},
     #field{name = groupName, fnum = 2, rnum = 3,
	    type = string, occurrence = required, opts = []},
     #field{name = groupLevel, fnum = 3, rnum = 4,
	    type = int32, occurrence = optional, opts = []},
     #field{name = note, fnum = 4, rnum = 5, type = string,
	    occurrence = optional, opts = []},
     #field{name = remarks, fnum = 5, rnum = 6,
	    type = string, occurrence = optional, opts = []},
     #field{name = ownUser, fnum = 6, rnum = 7,
	    type = string, occurrence = required, opts = []},
     #field{name = status, fnum = 7, rnum = 8, type = int32,
	    occurrence = required, opts = []},
     #field{name = createDate, fnum = 8, rnum = 9,
	    type = string, occurrence = optional, opts = []}];
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
