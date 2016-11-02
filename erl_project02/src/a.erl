%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 31. Oct 2016 3:49 PM
%%%-------------------------------------------------------------------
-module(a).
-compile(export_all).
start(Tag) ->
  spawn(fun() -> loop(Tag) end).
loop(Tag) ->
  sleep(),
  Val = b:x(),
  io:format("Vsn1 (~p) b:x() = ~p~n", [Tag, Val]),
  loop(Tag).
sleep() ->
  receive
  after 3000 -> true
  end.