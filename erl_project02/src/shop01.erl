%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Oct 2016 2:30 PM
%%%-------------------------------------------------------------------

-module(shop01).
-export([total/1]).

total([{What, N} | T]) -> shop:cost(What) * N + total(T);
total([]) -> 0.