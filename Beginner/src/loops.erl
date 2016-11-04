%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Nov 2016 6:18 PM
%%%-------------------------------------------------------------------
-module(loops).
-author("chen_j").

%% API
-export([while/1, while/2, start/0]).



while(L) -> while(L, 0).
while([], Acc) -> Acc;

while([_ | T], Acc) ->
  io:fwrite("~w~n", [Acc]),
  while(T, Acc + 1).

start() ->
  X = [1, 2, 3, 4, 7, 8],
  while(X).


%%Test:
%%loops:start().
%%0
%%1
%%2
%%3
%%4
%%5
%%6
