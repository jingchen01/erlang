%%%-------------------------------------------------------------------
%%1.14 (*) Duplicate the elements of a list.
%%Example:
%% dupli([a,b,c,c,d]).
%%Result: [a,a,b,b,c,c,c,c,d,d]
%%%-------------------------------------------------------------------
-module(p14).
-author("chen_j").

%% API
-export([dupli/1, dupli2/1]).

dupli([]) -> [];
dupli(L) ->
  lists:flatmap(fun(X) -> [X, X] end, L).


dupli2([]) -> [];
dupli2([H | T]) ->
  [H, H | dupli2(T)].

%%Test:
%%56> c(p14).
%%{ok,p14}
%%57> p14:dupli([a,b,c,c,d]).
%%[a,a,b,b,c,c,c,c,d,d]
%%58> p14:dupli2([a,b,c,c,d]).
%%[a,a,b,b,c,c,c,c,d,d]

