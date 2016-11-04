%%%-------------------------------------------------------------------
%%1.23 (**) Extract a given number of randomly selected elements from a list.
%%The selected items shall be put into a result list.
%%Example:
%%rnd_select([a,b,c,d,e,f,g,h],3).
%%Result: [e,d,a]
%%
%%Hint: Use the built-in random number generator random/2 and the result of problem 1.20.
%%%-------------------------------------------------------------------
-module(p23_2).
-author("chen_j").

%% API
-export([rnd_select/2]).

%% This rnd_select cannot generate randomly element list which length is greater than the input list.
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
      Elem = lists:nth(rand:uniform(L_Length), L),
      rnd_select(lists:delete(Elem, L), [Elem | Result], N)
  end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Test:
%%155> c(p23_2).
%%{ok,p23_2}
%%156> p23_2:rnd_select([a,b,c,d,e,f,g,h],-1).
%%[]
%%157> p23_2:rnd_select([a,b,c,d,e,f,g,h],0).
%%[]
%%158> p23_2:rnd_select([a,b,c,d,e,f,g,h],1).
%%[e]
%%159> p23_2:rnd_select([a,b,c,d,e,f,g,h],2).
%%[b,f]
%%160> p23_2:rnd_select([a,b,c,d,e,f,g,h],3).
%%[d,b,f]
%%161> p23_2:rnd_select([a,b,c,d,e,f,g,h],4).
%%[a,d,h,g]
%%162> p23_2:rnd_select([a,b,c,d,e,f,g,h],5).
%%[h,f,g,e,a]
%%163> p23_2:rnd_select([a,b,c,d,e,f,g,h],6).
%%[h,f,e,g,c,b]
%%164> p23_2:rnd_select([a,b,c,d,e,f,g,h],7).
%%[d,h,e,a,g,c,f]
%%165> p23_2:rnd_select([a,b,c,d,e,f,g,h],8).
%%[]
%%166> p23_2:rnd_select([a,b,c,d,e,f,g,h],9).
%%[]

