%%%-------------------------------------------------------------------
%%1.13 (**) Run-length encoding of a list (direct solution).
%%Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 1.09, but only count them. As in problem 1.11, simplify the result list by replacing the singleton terms [1,X] by X.
%%
%%Example:
%%encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%Result: [{4,a},b,{2,c},{2,a},d,{4,e}]

%%encode_direct2([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%Result: [[4,a],b,[2,c],[2,a],d,[4,e]]

%%%-------------------------------------------------------------------
-module(p13).
-author("chen_j").

%% API
-export([encode_direct/1, encode_direct2/1]).

encode_direct([], []) ->
  [];
encode_direct([], [H | T]) ->
  encode_direct({1, H}, T);
encode_direct({N, H}, [H | T]) ->
  encode_direct({N + 1, H}, T);
encode_direct({1, E}, List) ->
  [E | encode_direct([], List)];
encode_direct({N, E}, List) ->
  [{N, E} | encode_direct([], List)].

encode_direct(List) ->
  encode_direct([], List).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


encode_direct2(L) ->
  lists:reverse(lists:foldl(fun encode_direct2/2, [], L)).
encode_direct2(H, []) ->
  [H];
encode_direct2(H, [H | T]) ->
  [[2, H] | T];
encode_direct2(H, [[N, H] | T]) ->
  [[N + 1, H] | T];
encode_direct2(H, [[_N, _X] | _T] = L) ->
  [H | L];
encode_direct2(H, [_X | _T] = L) ->
  [H | L].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Test:
%%47> c(p13).
%%{ok,p13}
%%48> p13:encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[{4,a},b,{2,c},{2,a},d,{4,e}]
%%49> p13:encode_direct2([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[[4,a],b,[2,c],[2,a],d,[4,e]]
