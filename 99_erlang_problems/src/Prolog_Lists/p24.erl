%%%-------------------------------------------------------------------
%%1.24 (*) Lotto: Draw N different random numbers from the set 1..M.
%%The selected numbers shall be put into a result list.
%%Example:
%% lotto(6,49).
%%Result: [23,1,17,33,21,37]
%%%-------------------------------------------------------------------
-module(p24).
-author("chen_j").

%% API
-export([diff_select/2]).

diff_select(Count, Max) ->
  diff_select(lists:seq(1, Max), Count, []).

diff_select(_, 0, Result) ->
  Result;

diff_select(L, M, Result) ->
  Nth = rand:uniform(length(L)),
  X = lists:nth(Nth, L),
  %% create new List L1 with all elements in L without elements which equals to X
  L1 = lists:sublist(L, Nth - 1) ++ lists:sublist(L, Nth + 1, length(L)),
  diff_select(L1, M - 1, [X | Result]).


%%Test:
%%138> c(p24).
%%{ok,p24}
%%139> p24:diff_select(6,59).
%%[47,55,57,29,32,24]
%%140> p24:diff_select(6,59).
%%[51,39,30,46,54,19]
%%141> p24:diff_select(6,59).
%%[10,31,28,56,30,39]
%%142> p24:diff_select(6,59).
%%[59,55,38,56,16,15]
%%143> p24:diff_select(6,30).
%%[30,21,17,15,3,26]
%%144> p24:diff_select(6,30).
%%[12,17,25,29,3,21]
