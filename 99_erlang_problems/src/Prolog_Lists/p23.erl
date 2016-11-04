%%%-------------------------------------------------------------------
%%1.23 (**) Extract a given number of randomly selected elements from a list.
%%The selected items shall be put into a result list.
%%Example:
%%rnd_select([a,b,c,d,e,f,g,h],3).
%%Result: [e,d,a]
%%
%%Hint: Use the built-in random number generator random/2 and the result of problem 1.20.
%%%-------------------------------------------------------------------
-module(p23).
-author("chen_j").

%% API
-export([rnd_select/2]).

%% This rnd_select generate randomly element list which length is greater than the input list.
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
      rnd_select(L, [Elem | Result], N)
  end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Test:
%%124> c(p23).
%%{ok,p23}
%%125> p23:rnd_select([a,b,c,d,e,f,g,h],-1).
%%[]
%%126> p23:rnd_select([a,b,c,d,e,f,g,h],0).
%%[]
%%127> p23:rnd_select([a,b,c,d,e,f,g,h],1).
%%[b]
%%128> p23:rnd_select([a,b,c,d,e,f,g,h],2).
%%[d,h]
%%129> p23:rnd_select([a,b,c,d,e,f,g,h],3).
%%[b,d,c]
%%130> p23:rnd_select([a,b,c,d,e,f,g,h],6).
%%[e,a,c,f,a,b]
%%131> p23:rnd_select([a,b,c,d,e,f,g,h],15).
%%[h,b,c,a,b,b,e,a,b,c,c,c,h,b,e]
%%132> p23:rnd_select([],6).
%%[]
