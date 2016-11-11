%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Nov 2016 6:41 PM
%%%-------------------------------------------------------------------
-module(loops2).
-author("chen_j").

%% API
-export([for/2, start/0]).


for(0, _) ->
  [];

for(N, Term) when N > 0 ->
  io:fwrite("Hello~n"),
  [Term | for(N - 1, Term)].

start() ->
  for(5, 1).


%%Test:
%%11> loops2:start().
%%Hello
%%Hello
%%Hello
%%Hello
%%Hello
%%[1,1,1,1,1]
