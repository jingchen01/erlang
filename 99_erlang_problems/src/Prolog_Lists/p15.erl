%%%-------------------------------------------------------------------
%%1.15 (**) Duplicate the elements of a list a given number of times.
%%Example:
%%dupli([a,b,c],3).
%%Result: [a,a,a,b,b,b,c,c,c]
%%
%%What are the results of the goal:
%% dupli(X,3).
%%%-------------------------------------------------------------------

-module(p15).
-author("chen_j").

%% API
-export([dupli/2, dupli2/2]).

dupli(L, K) ->
  lists:flatmap(fun(X) -> repeat(X, K) end, L).

repeat(X, N) ->
  if
    N < 1 -> [];
    true -> [X | repeat(X, N - 1)]
  end.

dupli2([], _) ->
  [];
dupli2([H | T], Number) ->
  lists:append(repeat(H, Number), dupli2(T, Number)).


%%Test:
%%60> c(p15).
%%{ok,p15}
%%61> p15:dupli([a,b,c],3).
%%[a,a,a,b,b,b,c,c,c]
%%62> p15:dupli([a,b,c],2).
%%[a,a,b,b,c,c]
%%63> p15:dupli([a,b,c],4).
%%[a,a,a,a,b,b,b,b,c,c,c,c]
%%64> p15:dupli([a,b,c],1).
%%[a,b,c]
%%65> p15:dupli([a,b,c],0).
%%[]
%%66> p15:dupli([a,b,c],-3).
%%[]
%%67> p15:dupli([a],3).
%%[a,a,a]
%%68> p15:dupli([a],1).
%%[a]
%%69> p15:dupli([a],0).
%%[]
%%72> p15:dupli2([a,b,c],3).
%%[a,a,a,b,b,b,c,c,c]
%%73> p15:dupli2([a,b,c],4).
%%[a,a,a,a,b,b,b,b,c,c,c,c]
%%74> p15:dupli2([a,b,c],1).
%%[a,b,c]
%%75> p15:dupli2([a,b,c],2).
%%[a,a,b,b,c,c]

