%%%-------------------------------------------------------------------
%%%1.20 (*) Remove the K'th element from a list.
%%Example:
%%remove_at([a,b,c,d],2).
%%
%%Result: [a,c,d]

%%%-------------------------------------------------------------------
-module(p20).
-author("chen_j").

%% API
-export([remove_at/2]).


remove_at(L, K) ->
  Length = length(L),
  if
    K > Length -> L;
    K > 0 -> lists:sublist(L, K - 1) ++ lists:sublist(L, K + 1, Length);
    true -> L
  end.


%%Test:
%%37> c(p20).
%%{ok,p20}
%%38> p20:remove_at([a,b,c,d],0).
%%[a,b,c,d]
%%39> p20:remove_at([a,b,c,d],1).
%%[b,c,d]
%%40> p20:remove_at([a,b,c,d],2).
%%[a,c,d]
%%41> p20:remove_at([a,b,c,d],3).
%%[a,b,d]
%%42> p20:remove_at([a,b,c,d],4).
%%[a,b,c]
%%43> p20:remove_at([a,b,c,d],5).
%%[a,b,c,d]
%%44> p20:remove_at([a,b,c,d],6).
%%[a,b,c,d]
%%45> p20:remove_at([a,b,c,d],-1).
%%[a,b,c,d]
