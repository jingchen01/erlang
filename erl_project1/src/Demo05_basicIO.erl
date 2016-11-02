%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Aug 2016 3:49 PM
%%%-------------------------------------------------------------------
-module('Demo05_basicIO').
-author("chen_j").

%% API
-export([say_something/2, start_concurrency/2]).



say_something(_, 0) ->
  io:format("Done ~n");
say_something(Value, Times) ->
  io:format("~s ~n", [Value]),
  say_something(Value, Times - 1).

%% concurrency
start_concurrency(Value1, Value2) ->
  spawn('Demo05_basicIO', say_something, [Value1, 3]),
  spawn('Demo05_basicIO', say_something, [Value2, 3]).
