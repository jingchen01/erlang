%%%-------------------------------------------------------------------
%%1.05 (*) Reverse a list.
%%%-------------------------------------------------------------------
-module(p05).
-author("chen_j").

%% API
-export([reverse_list/1, reverse_list2/1, reverse_list3/1]).

reverse_list(L) ->
  if
    is_list(L) -> lists:reverse(L);
    true -> "undefined"
  end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

reverse_list2([]) -> [];
reverse_list2([H | []]) -> [H];
reverse_list2([H | T]) -> reverse_list2(T) ++ [H].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

reverse_list3(L) ->
  case is_list(L) of
    true -> lists:reverse(L);
    false -> "undefined"
  end.


%%Test:
%%86> c(p05).
%%{ok,p05}
%%87> p05:reverse_list([1,2,3,4]).
%%[4,3,2,1]
%%88> p05:reverse_list2([1,2,3,4]).
%%[4,3,2,1]
%%89> p05:reverse_list([1,2,3,4,7,0]).
%%[0,7,4,3,2,1]
%%90> p05:reverse_list2([1,2,3,4,7,0]).
%%[0,7,4,3,2,1]
%%91> p05:reverse_list([0]).
%%[0]
%%92> p05:reverse_list2([0]).
%%[0]
%%93> p05:reverse_list([3]).
%%[3]
%%94> p05:reverse_list2([3]).
%%[3]
%%95> p05:reverse_list(3).
%%"undefined"
%%96> p05:reverse_list2(3).
%%** exception error: no function clause matching p05:reverse_list2(3) (p05.erl, line 19)
%%97>
