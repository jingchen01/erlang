%%%-------------------------------------------------------------------
%%1.25 (*) Generate a random permutation of the elements of a list.
%%Example:
%%rnd_permu([a, b, c, d, e, f]).
%%Result: [b, a, d, c, e, f]
%%
%%Hint: Use the solution of problem 1.23.
%%%-------------------------------------------------------------------
-module(p25).
-author("chen_j").

%% API
-export([rnd_permu/1]).

rnd_permu(List) ->
  rnd_select(List, length(List)).

rnd_select(L, N) ->
  rnd_select(L, [], N).

rnd_select(L, Result, N) ->
  L_Length = length(L),
  R_Length = length(Result),
  if
    L_Length =:= 0 -> [];
    N < 1 -> [];
    R_Length =:= N -> Result;
    true ->
      rnd_select(L, [lists:nth(rand:uniform(L_Length), L) | Result], N)
  end.


%%Test:
%%145> c(p25).
%%{ok,p25}
%%146> p25:rnd_permu([a, b, c, d, e, f]).
%%[f,b,a,e,f,a]
%%147> p25:rnd_permu([a, b, c, d, e, f]).
%%[b,c,a,b,e,e]
%%148> p25:rnd_permu([a, b, c, d, e, f]).
%%[b,c,f,a,a,d]
%%149> p25:rnd_permu([a, b, c, d, e, f]).
%%[c,d,c,f,f,c]
