%%%-------------------------------------------------------------------
%%1.10 (*) Run-length encoding of a list.
%%Use the result of problem 1.09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.
%%
%%Example:
%%encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%Result: [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]]
%%%-------------------------------------------------------------------
-module(p10).
-import(p09, [pack/1]).
-export([encode/1]).
-import(lists, [map/2]).

encode(L) ->
  map(fun([H | T]) -> [length([H | T]), H] end, pack(L)).

%%Test:
%%1> c(p10).
%%{ok,p10}
%%2> p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]]
