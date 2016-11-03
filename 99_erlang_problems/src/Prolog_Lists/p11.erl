%%%-------------------------------------------------------------------
%%1.11 (*) Modified run-length encoding.
%%Modify the result of problem 1.10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as [N,E] terms.
%%
%%Example:
%% encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%Result: [[4,a],b,[2,c],[2,a],d,[4,e]]
%%%-------------------------------------------------------------------
-module(p11).
-import(p09, [pack/1]).
-import(p10, [encode/1]).
-export([encode_modified/1, encode_modified2/1, encode_modified3/1]).
-import(lists, [map/2]).


encode_modified(L) ->
  map(fun([N, E]) -> if 1 =:= N -> E;
                       true -> [N, E]
                     end
      end, encode(L)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


encode_modified2(L) ->
  map(fun([H | T]) ->
    if
      length([H | T]) > 1 -> [length([H | T]), H];
      true -> H
    end
      end,
    pack(L)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


encode_modified3(L) ->
  lists:reverse(lists:foldl(fun encode_modified3/2, [], L)).
encode_modified3(H, []) ->
  [H];
encode_modified3(H, [H | T]) ->
  [[2, H] | T];
encode_modified3(H, [[N, H] | T]) ->
  [[N + 1, H] | T];
encode_modified3(H, [[_N, _X] | _T] = L) ->
  [H | L];
encode_modified3(H, [_X | _T] = L) ->
  [H | L].


%%Test:
%%12> c(p11).
%%{ok,p11}
%%13> p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[[4,a],b,[2,c],[2,a],d,[4,e]]
%%14> p11:encode_modified2([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[[4,a],b,[2,c],[2,a],d,[4,e]]
%%17> p11:encode_modified3([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[[4,a],b,[2,c],[2,a],d,[4,e]]
