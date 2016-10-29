%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Oct 2016 7:07 PM
%%%-------------------------------------------------------------------
-module(shop2).
-export([total/1]).
-import(lists, [map/2, sum/1]).


total(L) ->
  sum(map(fun({What, N}) -> shop:cost(What) * N end, L)).
