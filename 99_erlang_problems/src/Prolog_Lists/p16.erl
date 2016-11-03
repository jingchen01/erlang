%%%-------------------------------------------------------------------
%%%1.16 (**) Drop every N'th element from a list.
%%Example:
%%drop([a,b,c,d,e,f,g,h,i,k],3).
%%Result: [a,b,d,e,g,h,k]
%%%-------------------------------------------------------------------
-module(p16).
-author("chen_j").

%% API
-export([drop/2, drop2/2]).


drop([], _, _) ->
  [];
drop([_ | T], N, 1) ->
  drop(T, N, N);
drop([H | T], N, K) ->
  [H | drop(T, N, K - 1)].

drop(List, N) ->
  drop(List, N, N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


drop2(L, N) ->
  {_I, N, L1} = lists:foldl(fun do_drop/2, {1, N, []}, L),
  lists:reverse(L1).

do_drop(H, {I, N, L}) ->
  Rem = I rem N,
  if
    Rem == 0 ->
      {1, N, L};
    true ->
      {I + 1, N, [H | L]}
  end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%Test:
%%10> c(p16).
%%{ok,p16}
%%11> p16:drop([a,b,c,d,e,f,g,h,i,k],3).
%%[a,b,d,e,g,h,k]
%%12> p16:drop2([a,b,c,d,e,f,g,h,i,k],3).
%%[a,b,d,e,g,h,k]


