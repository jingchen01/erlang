%%%-------------------------------------------------------------------
%%1.17 (*) Split a list into two parts; the length of the first part is given.
%%Do not use any predefined predicates.
%%
%%Example:
%%?- split([a,b,c,d,e,f,g,h,i,k],3).
%%L1 = [a,b,c]
%%L2 = [d,e,f,g,h,i,k]
%%%-------------------------------------------------------------------
-module(p17).

-export([split/2, split2/2, split3/2]).
-import(take_drop, [take/2, drop/2]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

split(List, K) ->
  lists:split(K, List).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

split2(List, K) ->
  {First, Second} = split2(List, [], K),
  {lists:reverse(Second), First}.

split2([], L, _) ->
  {[], L};
split2([H | T], L, N) ->
  case N =:= 0 of
    true ->
      {[H | T], L};
    false ->
      split2(T, [H | L], N - 1)
  end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

split3(_, K) when K < 0 ->
  erlang:error(negative);
split3(L, K) ->
  [take(L, K), drop(L, K)].

%%Test:
%%10> c(p17).
%%{ok,p17}
%%11> p17:split([a,b,c,d,e,f,g,h,i,k],3).
%%{[a,b,c],[d,e,f,g,h,i,k]}
%%12> p17:split2([a,b,c,d,e,f,g,h,i,k],3).
%%{[a,b,c],[d,e,f,g,h,i,k]}
%%13> p17:split3([a,b,c,d,e,f,g,h,i,k],3).
%%** exception error: undefined function take_drop:take/2
%%in function  p17:split3/2 (p17.erl, line 41)
%% Need to compile take_drop first!
%%14> c(take_drop).
%%{ok,take_drop}
%%15> p17:split3([a,b,c,d,e,f,g,h,i,k],3).
%%[[a,b,c],[d,e,f,g,h,i,k]]
