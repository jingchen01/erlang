%%%-------------------------------------------------------------------
%%1.01 (*) Find the last element of a list.
%%Example:
%%my_last([a,b,c,d]).
%% Return: d
%%%-------------------------------------------------------------------
-module(p01).
-author("chen_j").

%% API
-export([my_last/1, my_last2/1]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

my_last(L) ->
  lists:last(L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

my_last2([]) -> [];
my_last2([H | []]) -> H;
my_last2([_ | T]) ->
  my_last2(T).

%%Test:
%%19> p01:my_last([a,b,c,d]).
%%d
%%20> p01:my_last2([a,b,c,d]).
%%d

