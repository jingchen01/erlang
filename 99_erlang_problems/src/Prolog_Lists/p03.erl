%%%-------------------------------------------------------------------
%%1.03 (*) Find the K'th element of a list.
%%The first element in the list is number 1.
%%Example:
%%element_at([a,b,c,d,e],3).
%%Result: c
%%%-------------------------------------------------------------------
-module(p03).
-author("chen_j").

%% API
-export([element_at/2, element_at2/2]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

element_at(L, K) ->
  if
    not is_list(L) -> [];
    K < 1 -> [];
    K > length(L) -> [];
    true -> lists:nth(K, L)
  end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

element_at2([], _) ->
  [];
element_at2([H | _], 1) ->
  H;
element_at2([_ | T], K) ->
  element_at2(T, K - 1).


%%Test:
%%30> p03:element_at([a,b,c,d,e],3).45> c(p03).
%%{ok,p03}
%%46> p03:element_at([],0).
%%[]
%%47> p03:element_at([],-1).
%%[]
%%48> p03:element_at([],1).
%%[]
%%49> p03:element_at([1,2,3,4,5],1).
%%1
%%50> p03:element_at([1,2,3,4,5],3).
%%3
%%51> p03:element_at([1,2,3,4,5],6).
%%[]
%%52> p03:element_at(9,1).
%%[]
%%53> p03:element_at([a,b,c,d,e],3).
%%c
%%54> p03:element_at([],3).
%%[]
%%55> p03:element_at([],-3).
%%[]
%%56> p03:element_at2([a,b,c,d,e],3).
%%c
%%57> p03:element_at2([a,b,c,d,e],-3).
%%[]
%%58> p03:element_at2([],-3).
%%[]
%%59> p03:element_at2([],3).
%%[]
%%60> p03:element_at2([a,b,c,d,e],5).
%%e

