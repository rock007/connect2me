%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 3.26.4

-ifndef(addressbook_pb).
-define(addressbook_pb, true).

-define(addressbook_pb_gpb_version, "3.26.4").

-ifndef('PERSON_PB_H').
-define('PERSON_PB_H', true).
-record(person,
        {name                   :: binary() | iolist(), % = 1
         id                     :: integer(),       % = 2, 32 bits
         email                  :: binary() | iolist() | undefined % = 3
        }).
-endif.

-endif.