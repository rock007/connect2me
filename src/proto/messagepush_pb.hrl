%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 3.26.4

-ifndef(messagepush_pb).
-define(messagepush_pb, true).

-define(messagepush_pb_gpb_version, "3.26.4").

-ifndef('MESSAGEPUSH_PB_H').
-define('MESSAGEPUSH_PB_H', true).
-record('MessagePush',
        {topic                  :: binary() | iolist(), % = 1
         content                :: binary() | iolist(), % = 2
         from                   :: binary() | iolist() % = 3
        }).
-endif.

-endif.